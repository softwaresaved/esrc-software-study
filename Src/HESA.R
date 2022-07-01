# Examine some Higher Education Statistical Agency (HESA) data for the
# Economic and Social Sciences Research Council (ESRC)

# Set up ----

# Packages to be used
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(scales)

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
              "133) Business & management studies",
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

# Plot gender

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
                xlab("No know discipline percent") +
                geom_text(aes(y = discipline, x = pos, label = comma(Total)), hjust = -0.25,
                         position = "identity", inherit.aes = FALSE, size = 3) +
                scale_fill_manual(labels = c("Resarch only", "Teaching only"), values = c("green","red"))

# Modified the spreadsheet to aggregate the disability values.
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

# Plot the graph
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
                xlab("No know discipline percent") + labs(fill = "Disability") +
                geom_text(aes(y = discipline, x = pos, label = comma(Total_num)), hjust = -0.25,
                          position = "identity", inherit.aes = FALSE, size = 3) +
                scale_fill_manual(labels = c("RO disability", "TO disability", "RO no known disability", "TO no known disability"),
                                  values = c("green","red","blue","yellow"))
