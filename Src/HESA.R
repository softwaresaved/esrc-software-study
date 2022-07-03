# Examine some Higher Education Statistical Agency (HESA) data for the
# Economic and Social Sciences Research Council (ESRC)

# Set up ----

# Packages to be used
library(readxl)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)
library(viridis)

# Create a look-up table to map cost centres to subjects
#
# ESRC related subjects mapped to cost centres
# ESRC disciplines: https://www.ukri.org/about-us/esrc/what-is-social-science/social-science-disciplines/
# HESA cost centres: https://www.hesa.ac.uk/support/documentation/cost-centres/2012-13-onwards

# The cost codes
esrc_cc <- c( "(104) Psychology & behavioural sciences",
              "(123) Architecture, built environment & planning",
              "(124) Geography & environmental studies",
              "(125) Area studies",
              "(127) Anthropology & development studies",
              "(128) Politics & international studies",
              "(129) Economics & econometrics",
              "(130) Law",
              "(131) Social work & social policy",
              "(132) Sociology",
              "(133) Business & management studies",
              "(135) Education",
              "(136) Continuing education",
              "(145) Media studies"
            )

# The subjects
cc2subjects <- c("Psychology & behavioural sciences",
                 "Architecture, built environment & planning",
                 "Geography & environmental studies",
                 "Area studies",
                 "Anthropology & development studies",
                 "Politics & international studies",
                 "Economics & econometrics",
                 "Law",
                 "Social work & social policy",
                 "Sociology",
                 "Business & management studies",
                 "Education",
                 "Continuing education",
                 "Media studies"
                 )

# Names are the cost centres, values the subjects
names(cc2subjects) <- esrc_cc

# Gender ----

# Read the corresponding data and sheet
hesadat <- read_xlsx("../Data/hesa.xlsx", sheet = "Gender", skip = 3)

# Difference between
#  FPE - Full Person Equivalent
#  _RO - Research Only
# p_RO - % Research Only
#  _TO - Teaching Only
# p_TO - % Teaching Only
names(hesadat) <- c("Academic_Year",
                   "Cost_centre_group_v2",
                   "Cost_centre_v2",
                   "FPE_Female_RO",
                   "FPE_Male_RO",
                   "FPE_Other_RO",
                   "FPE_Femalep_RO",
                   "FPE_Malep_RO",
                   "FPE_Otherp_RO",
                   "FPE_Female_TO",
                   "FPE_Male_TO",
                   "FPE_Other_TO",
                   "FPE_Femalep_TO",
                   "FPE_Malep_TO",
                   "FPE_Otherp_TO",
                   "FPE_Total",
                   "FPE_Totalp")

# Fill NA values with repeated values in labelling columns.
hesadat <- hesadat %>% fill(Academic_Year, Cost_centre_group_v2)

# Pick the ESRC related cost centres
gender <- hesadat %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
gender$discipline <-unname(cc2subjects[gender[["Cost_centre_v2"]]])

# Plot gender - Research Only
gender %>% select(discipline, FPE_Femalep_RO, FPE_Malep_RO, FPE_Otherp_RO, FPE_Total) %>%
           pivot_longer(cols = c("FPE_Femalep_RO", "FPE_Malep_RO", "FPE_Otherp_RO"),
                        names_to = "gender",
                        values_to = "percent") %>%
           filter(!is.na(percent))             %>%
           group_by(discipline)                %>%
           mutate(pos = sum(percent))          %>%
           ggplot(aes(y = discipline, x = percent, fill = gender)) +
           geom_col(colour = "black", na.rm = TRUE) +
           scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0,0.38)) +
           theme_bw() +
           xlab("Percent") + ylab("Research discipline") +
           labs(fill = "Gender") +
           geom_text(aes(y = discipline, x = pos, label = comma(FPE_Total)), hjust = -0.25,
                     position = "identity", inherit.aes = FALSE, size = 3) +
           scale_fill_manual(labels = c("Female", "Male", "Other"), values = c("green","red","blue"))

# Plot gender - Research and Teaching Only
gender %>% select(discipline, FPE_Femalep_RO, FPE_Malep_RO, FPE_Otherp_RO,
                  FPE_Femalep_TO, FPE_Malep_TO, FPE_Otherp_TO,FPE_Total) %>%
           pivot_longer(cols = c("FPE_Femalep_RO", "FPE_Malep_RO", "FPE_Otherp_RO",
                                 "FPE_Femalep_TO", "FPE_Malep_TO", "FPE_Otherp_TO"),
                        names_to = "gender",
                        values_to = "percent") %>%
           filter(!is.na(percent))             %>%
           group_by(discipline)                %>%
           mutate(pos = sum(percent))          %>%
           mutate(gender = factor(gender, levels = c("FPE_Femalep_RO", "FPE_Malep_RO", "FPE_Otherp_RO",
                                                     "FPE_Femalep_TO", "FPE_Malep_TO", "FPE_Otherp_TO"), ordered = TRUE)) %>%
           ggplot(aes(y = discipline, x = percent, fill = gender)) +
           geom_col(colour = "black", na.rm = TRUE) +
           scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0,1.1)) +
           theme_bw() +
           xlab("Percent") + ylab("Research discipline") +
           labs(fill = "Gender") +
           geom_text(aes(y = discipline, x = pos, label = comma(FPE_Total)), hjust = -0.25,
                    position = "identity", inherit.aes = FALSE, size = 3) +
           scale_fill_manual(labels = c("RO Female","RO Male", "RO Other", "TO Female", "TO Male","TO Other"),
                             values = c("green","red","blue","yellow", "purple", "chocolate"))

# This numbers are approximate as all sort of rounding effects come into play
gender %>% summarise(Total = sum(FPE_Total))

# Plot only the totals
gender %>%  ggplot(aes(y = discipline, x = FPE_Total, fill = FPE_Total)) +
            geom_col(colour = "black", na.rm = TRUE) +
            theme_bw() +
            scale_x_continuous(labels = comma, limits = c(0, 11550)) +
            xlab("Full Person Equivalent") + ylab("Research discipline") +
            geom_text(aes(y = discipline, x = FPE_Total, label = comma(FPE_Total)), hjust = -0.25,
            position = "identity", inherit.aes = FALSE, size = 3) +
            scale_fill_viridis(option="magma") + theme(legend.position = "None")

# Disability ----

# Do not appear to be able to read non-adjacent columns and do not want all
# the detail so will have to read in separately and then put back together
disability <- read_xlsx("../Data/hesa.xlsx", range = "Disability!A5:C54")
names(disability) <-  c("Academic_Year", "Cost_centre_group_v2", "Cost_centre_v2")

# Research only
disability2 <- read_xlsx("../Data/hesa.xlsx", range = "Disability!Y5:Y54")
names(disability2) <-  c("No_known_RO")

disability3 <- read_xlsx("../Data/hesa.xlsx", range = "Disability!AU5:AU54")
names(disability3) <-  c("No_known_TO")

disability4 <- read_xlsx("../Data/hesa.xlsx", range = "Disability!AV5:AV54")
names(disability4) <-  c("Total")

# Join the columns
disability <- bind_cols(disability, disability2, disability3, disability4)

# Removed the tibbles we no longer need
rm(disability2, disability3, disability4)

# Repeat values
disability <- disability %>% fill(Academic_Year, Cost_centre_group_v2)

# Pick the ESRC related cost centres
disability <- disability %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
disability$discipline <-unname(cc2subjects[disability[["Cost_centre_v2"]]])

# Plot the graph
disability %>% pivot_longer(
                             cols = c("No_known_RO", "No_known_TO"),
                             names_to = "disability",
                             values_to = "percent"
                           )                        %>%
                group_by(discipline)                %>%
                mutate(pos = sum(percent))          %>%
                ggplot(aes(y = discipline, x = percent, fill = disability)) +
                geom_col(colour = "black") +
                theme_bw() +
                scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.05)) +
                ylab("Research discipline") +
                xlab("No know disability percent") +
                geom_text(aes(y = discipline, x = pos, label = comma(Total)), hjust = -0.25,
                         position = "identity", inherit.aes = FALSE, size = 3) +
                scale_fill_manual(labels = c("Resarch only", "Teaching only"), values = c("green","red"))

# Modified the spreadsheet to aggregate the disability values. This is reading
# this in.
disability <- read_xlsx("../Data/hesa.xlsx", range = "Disability!A5:C54")
names(disability) <-  c("Academic_Year", "Cost_centre_group_v2", "Cost_centre_v2")

# Research only
disability2 <- read_xlsx("../Data/hesa.xlsx", range = "Disability!AX5:BC54")
#names(disability2) <-  c("dis_RO",	"no_dis_RO",	"dis_TO",	"no_dis_TO",	"Total",	"Total_num")

# Join the columns
disability <- bind_cols(disability, disability2)

# Removed the tibbles we no longer need
rm(disability2)

# Repeat values
disability <- disability %>% fill(Academic_Year, Cost_centre_group_v2)

# Pick the ESRC related cost centres
disability <- disability %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
disability$discipline <-unname(cc2subjects[disability[["Cost_centre_v2"]]])

# Plot the graph for Research Only (RO) and Training Only (TO)
disability %>% pivot_longer(
                           cols = c("dis_RO",	"no_dis_RO",	"dis_TO",	"no_dis_TO"),
                           names_to = "disability",
                            values_to = "percent"
                            )                        %>%
                group_by(discipline)                 %>%
                mutate(pos = sum(percent))           %>%
                ggplot(aes(y = discipline, x = percent, fill = disability)) +
                geom_col(colour = "black") +
                theme_bw() +
                scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.1)) +
                ylab("Research discipline") +
                xlab("Percent") + labs(fill = "Disability") +
                geom_text(aes(y = discipline, x = pos, label = comma(Total_num)), hjust = -0.25,
                          position = "identity", inherit.aes = FALSE, size = 3) +
                scale_fill_manual(labels = c("RO disability", "TO disability", "RO no known disability", "TO no known disability"),
                                  values = c("green","red","blue","yellow"))

# Plot the graph for Research Only (RO)
disability %>% pivot_longer(
                            cols = c("dis_RO",	"no_dis_RO"),
                            names_to = "disability",
                            values_to = "percent"
                             )                        %>%
                 group_by(discipline)                 %>%
                 mutate(pos = sum(percent))           %>%
                 ggplot(aes(y = discipline, x = percent, fill = disability)) +
                 geom_col(colour = "black") +
                 theme_bw() +
                 scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 0.38)) +
                 ylab("Research discipline") +
                 xlab("Percent") + labs(fill = "Disability") +
                 geom_text(aes(y = discipline, x = pos, label = comma(Total_num)), hjust = -0.25,
                           position = "identity", inherit.aes = FALSE, size = 3) +
                 scale_fill_manual(labels = c("RO disability", "RO no known disability"),
                                  values = c("blue","yellow"))

# Ethnicity ----

# Read the data
ethnicity <-  read_xlsx("../Data/hesa.xlsx", sheet = "Ethnicity", skip = 3)

# Rename the columns
names(ethnicity) <- c("Academic_Year", "Cost_centre_group_v2",	"Cost_centre_v2",
                      "ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White",
                      "RO_Asian",	"RO_Black",	"RO_Mixed",	"RO_Other",	"RO_Unknown_NA",	"RO_White",
                      "TOp_Asian",	"TOp_Black",	"TOp_Mixed",	"TOp_Other",	"TOp_Unknown_NA",	"TOp_White",
                      "TO_Asian",	"TO_Black",	"TO_Mixed",	"TO_Other",	"TO_Unknown_NA",	"TO_White",
                      "pTotal", "nTotal")

# Repeat values
ethnicity <- ethnicity %>% fill(Academic_Year, Cost_centre_group_v2)

# Pick the ESRC related cost centres
ethnicity <- ethnicity %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
ethnicity$discipline <-unname(cc2subjects[ethnicity[["Cost_centre_v2"]]])

# Plot the ethnicity - RO and TO
ethnicity %>% pivot_longer(
                           cols = c("ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White",
                                    "TOp_Asian",	"TOp_Black",	"TOp_Mixed",	"TOp_Other",	"TOp_Unknown_NA",	"TOp_White"),
                           names_to = "ethnicity",
                           values_to = "percent"
                         )                         %>%
              filter(!is.na(percent))              %>%
              group_by(discipline)                 %>%
              mutate(pos = sum(percent))           %>%
              mutate(ethnicity = factor(ethnicity, levels = c("ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White",
                                                              "TOp_Asian",	"TOp_Black",	"TOp_Mixed",	"TOp_Other",	"TOp_Unknown_NA",	"TOp_White"),
                                        ordered = TRUE)) %>%
              ggplot(aes(y = discipline, x = percent, fill = ethnicity)) +
              geom_col(colour = "black") +
              theme_bw() +
              scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.1)) +
              ylab("Research discipline") +
              xlab("Percent") + labs(fill = "Ethnicity") +
              geom_text(aes(y = discipline, x = pos, label = comma(nTotal)), hjust = -0.25,
                        position = "identity", inherit.aes = FALSE, size = 3) +
              scale_fill_manual(labels = c("RO Asian",	"RO Black",	"RO Mixed",	"RO Other",	"RO Unknown/NA",	"RO White",
                                          "TO Asian",	"TO Black",	"TO Mixed",	"TO Other",	"TO Unknown/NA",	"TO White"),
                                values = viridis(12))

# Plot the ethnicity - RO only
ethnicity %>% pivot_longer(
                cols = c("ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White"),
                names_to = "ethnicity",
                values_to = "percent")             %>%
              filter(!is.na(percent))              %>%
              group_by(discipline)                 %>%
              mutate(pos = sum(percent))           %>%
              mutate(ethnicity = factor(ethnicity, levels = c("ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White"),
                                        ordered = TRUE)) %>%
              ggplot(aes(y = discipline, x = percent, fill = ethnicity)) +
              geom_col(colour = "black") +
              theme_bw() +
              scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 0.37)) +
              ylab("Research discipline") +
              xlab("Percent") + labs(fill = "Ethnicity") +
              geom_text(aes(y = discipline, x = pos, label = comma(nTotal)), hjust = -0.25,
                        position = "identity", inherit.aes = FALSE, size = 3) +
              scale_fill_manual(labels = c("RO Asian",	"RO Black",	"RO Mixed",	"RO Other",	"RO Unknown/NA",	"RO White"),
                                values = viridis(12))

# Plot the ethnicity - TO only
ethnicity %>% pivot_longer(
                          cols = c("TOp_Asian",	"TOp_Black",	"TOp_Mixed",	"TOp_Other",	"TOp_Unknown_NA",	"TOp_White"),
                          names_to = "ethnicity",
                          values_to = "percent"
                          )                                    %>%
                          filter(!is.na(percent))              %>%
                          group_by(discipline)                 %>%
                          mutate(pos = sum(percent))           %>%
                          mutate(ethnicity = factor(ethnicity, levels = c("TOp_Asian",	"TOp_Black",	"TOp_Mixed",	"TOp_Other",	"TOp_Unknown_NA",	"TOp_White"),
                                                    ordered = TRUE)) %>%
                          ggplot(aes(y = discipline, x = percent, fill = ethnicity)) +
                          geom_col(colour = "black") +
                          theme_bw() +
                          scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.02)) +
                          ylab("Research discipline") +
                          xlab("Percent") + labs(fill = "Ethnicity") +
                          geom_text(aes(y = discipline, x = pos, label = comma(nTotal)), hjust = -0.25,
                                    position = "identity", inherit.aes = FALSE, size = 3) +
                          scale_fill_manual(labels = c("TO Asian",	"TO Black",	"TO Mixed",	"TO Other",	"TO Unknown/NA",	"TO White"),
                                            values = viridis(6))
# Institutions ----

# Read in the data
provider <-  read_xlsx("../Data/hesa.xlsx", sheet = "Provider", skip = 2)

# Rename the columns
# RO - Research Only
# ROp - Research Only percentage
# TO - Teaching Only
# TOp - Teaching Only percentage
names(provider) <-  c("Academic_Year", "Cost_centre_group_v2", "Cost_centre_v2", "ukprn",
                      "RO", "ROp", "TO",	"TOp", "Total",	"Totalp")

# Repeat values
provider <- provider %>% fill(Academic_Year, Cost_centre_group_v2, Cost_centre_v2)

# Pick the ESRC related cost centres
provider <- provider %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
provider$discipline <-unname(cc2subjects[provider[["Cost_centre_v2"]]])

# Can download the unistat dataset from:
#
# https://www.hesa.ac.uk/support/tools-and-downloads/unistats
#
# UKPRN to institution can be obtained
institutions <-  read_csv("../Data/on_2022_03_15_13_26_06/AccreditationByHep.csv",
                          show_col_types = FALSE)

# Keep only the institutions
institutions <- unique(institutions$HEP)

# Create a new data frame with the UKPRN and institution
ukprn2inst <- data.frame(ukprn = sub("^\\((\\d+)\\)\\s+(.*)$", "\\1", institutions, perl = TRUE),
                         institution = sub("^\\((\\d+)\\)\\s+(.*)$", "\\2", institutions, perl = TRUE))

# Join the two data sets
provider <- provider %>% left_join(ukprn2inst, by = "ukprn")

# Plot the results by research discipline
for(disc in unique(provider$discipline)){

  print(paste("Research discipline:", disc))

  # Need to print to get the plots to show
  print(
          provider %>% pivot_longer(cols = c("ROp", "TOp"),
                                    names_to = "Type",
                                    values_to = "percent")  %>%
                        filter(!is.na(percent))             %>%
                        filter(!is.na(institution))         %>%
                        filter(discipline == disc)          %>%
                        ggplot(aes(y = institution, x = percent, fill = Type)) +
                        geom_col(colour = "black") +
                        theme_bw() +
                        scale_x_continuous(labels = percent_format(accuracy = 1)) +
                        theme(axis.text.y = element_text(size = 8)) +
                        ylab("Research discipline") + xlab("Percent") +
                        scale_fill_manual(labels = c("Research Only", "Teaching Only"),
                                          values = viridis(2)) +
                        ggtitle(paste0("Research discipline: ", disc))
    )
}
