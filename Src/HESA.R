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
#
# ESRC disciplines: https://www.ukri.org/about-us/esrc/what-is-social-science/social-science-disciplines/
# HESA cost centres: https://www.hesa.ac.uk/support/documentation/cost-centres/2012-13-onwards
#

# The ESRC related cost centres
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

# The ESRC subjects (cost centres with the cost centre code removed)
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

## Read data ----
# Read the corresponding data and sheet
hesadat <- read_xlsx("../Data/hesa.xlsx", sheet = "Gender", skip = 3)

# Difference between Full Person Equivalent (FPE) and Full Time Equivalent (FTE)
#
# https://www.hesa.ac.uk/collection/c20025/fte_vs_fpe
#
# Only have Full Person Equivalent (FPE) data
#
#  _RO - Research Only
# p_RO - % Research Only
#  _TR - Teaching and Research
# p_TR - % Teaching and Research
#
names(hesadat) <- c("Academic_Year",
                   "Cost_centre_group_v2",
                   "Cost_centre_v2",
                   "FPE_Female_RO",
                   "FPE_Male_RO",
                   "FPE_Other_RO",
                   "FPE_Femalep_RO",
                   "FPE_Malep_RO",
                   "FPE_Otherp_RO",
                   "FPE_Female_TR",
                   "FPE_Male_TR",
                   "FPE_Other_TR",
                   "FPE_Femalep_TR",
                   "FPE_Malep_TR",
                   "FPE_Otherp_TR",
                   "FPE_Total",
                   "FPE_Totalp")

# Fill NA values with repeated values in labelling columns.
hesadat <- hesadat %>% fill(Academic_Year, Cost_centre_group_v2)

# Pick the ESRC related cost centres
gender <- hesadat %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
gender$discipline <-unname(cc2subjects[gender[["Cost_centre_v2"]]])

## RO gender plot ----
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

## TR gender plot ----
# Plot gender - Research and Teaching & Research
gender %>% select(discipline, FPE_Femalep_RO, FPE_Malep_RO, FPE_Otherp_RO,
                  FPE_Femalep_TR, FPE_Malep_TR, FPE_Otherp_TR,FPE_Total) %>%
           pivot_longer(cols = c("FPE_Femalep_RO", "FPE_Malep_RO", "FPE_Otherp_RO",
                                 "FPE_Femalep_TR", "FPE_Malep_TR", "FPE_Otherp_TR"),
                        names_to = "gender",
                        values_to = "percent") %>%
           filter(!is.na(percent))             %>%
           group_by(discipline)                %>%
           mutate(pos = sum(percent))          %>%
           mutate(gender = factor(gender, levels = c("FPE_Femalep_RO", "FPE_Malep_RO", "FPE_Otherp_RO",
                                                     "FPE_Femalep_TR", "FPE_Malep_TR", "FPE_Otherp_TR"), ordered = TRUE)) %>%
           ggplot(aes(y = discipline, x = percent, fill = gender)) +
           geom_col(colour = "black", na.rm = TRUE) +
           scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0,1.1)) +
           theme_bw() +
           xlab("Percent") + ylab("Research discipline") +
           labs(fill = "Gender") +
           geom_text(aes(y = discipline, x = pos, label = comma(FPE_Total)), hjust = -0.25,
                    position = "identity", inherit.aes = FALSE, size = 3) +
           scale_fill_manual(labels = c("RO Female","RO Male", "RO Other", "TR Female", "TR Male","TR Other"),
                             values = c("green","red","blue","yellow", "purple", "chocolate"))

# This numbers are approximate as all sort of rounding effects come into play
gender %>% summarise(Total = sum(FPE_Total))

## Gender TR + RO by Cost Centre ----

# Replacing NAs by 0 which is iffy but just want an overview
gender %>% replace(is.na(.), 0)                                          %>%
           mutate(Female = FPE_Female_RO + FPE_Female_TR,
                  Male = FPE_Male_RO + FPE_Male_TR,
                  Other = FPE_Other_RO + FPE_Other_TR, na.rm = TRUE)     %>%
           pivot_longer(cols = c(Female, Male, Other),
                        names_to = "gender",
                        values_to = "number")                            %>%
           select(discipline, gender, number)                            %>%
           ggplot(aes(y = discipline, x = number, fill = gender)) +
           geom_col(colour = "black") + theme_bw() +
           xlab("Number of FPEs") + ylab("Research discipline") +
           labs(fill = "Gender")

## Gender TR + RO by Cost Centre % ----

# Replacing NAs by 0 which is iffy but just want an overview

# Rounding an issue for "Continuing education", need to rescale
scale <- gender[gender$discipline == "Continuing education",][["FPE_Total"]]/sum(gender[gender$discipline == "Continuing education",][c(4:6, 10:12)], na.rm = TRUE)

gender %>% replace(is.na(.), 0)                                          %>%
           mutate(Female = FPE_Female_RO + FPE_Female_TR,
                  Male = FPE_Male_RO + FPE_Male_TR,
                  Other = FPE_Other_RO + FPE_Other_TR, na.rm = TRUE)     %>%
           pivot_longer(cols = c(Female, Male, Other),
                        names_to = "gender",
                        values_to = "number")                            %>%
           mutate(number = number/FPE_Total) %>%
           mutate(number = if_else(discipline == "Continuing education",
                                   scale*number, number))    %>%
           select(discipline, gender, number,FPE_Total)                  %>%
           ggplot(aes(y = discipline, x = number, fill = gender)) +
           geom_col(colour = "black") +
           theme_bw() +
           scale_x_continuous(labels = percent_format(accuracy = 1)) +
           xlab("Number of FPEs") + ylab("Research discipline") +
           labs(fill = "Gender")

## FPE by Cost Centre ----
# Plot only the FPE totals for each cost centre
gender %>%  ggplot(aes(y = discipline, x = FPE_Total, fill = FPE_Total)) +
            geom_col(colour = "black", na.rm = TRUE) +
            theme_bw() +
            scale_x_continuous(labels = comma, limits = c(0, 11550)) +
            xlab("Percent Full Person Equivalent") + ylab("Research discipline") +
            geom_text(aes(y = discipline, x = FPE_Total, label = comma(FPE_Total)), hjust = -0.25,
            position = "identity", inherit.aes = FALSE, size = 3) +
            scale_fill_viridis(option="magma") + theme(legend.position = "None")

## FPE by Cost Centre % ----
# Same as the above but as percentages
# Plot only the FPE totals for each cost centre
gender %>% mutate(N = sum(FPE_Total)) %>%
           ggplot(aes(y = discipline, x = FPE_Total/N, fill = FPE_Total)) +
           geom_col(colour = "black", na.rm = TRUE) +
           theme_bw() +
           scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 0.27)) +
           xlab("Percent") + ylab("Research discipline") +
           geom_text(aes(y = discipline, x = FPE_Total/N, label = percent(FPE_Total/N, accuracy = 0.1)), hjust = -0.25,
           position = "identity", inherit.aes = FALSE, size = 3) +
           scale_fill_viridis(option="magma") + theme(legend.position = "None")

## Gender stats ----
# Calculate proportions (there will be rounding effects).
# The Other values are hitting rounding issues.
gender %>% summarise(RO_F_Tot = sum(FPE_Female_RO, na.rm = TRUE),
                     RO_M_Tot = sum(FPE_Male_RO, na.rm = TRUE),
                     RO_O_Tot = sum(FPE_Other_RO, na.rm = TRUE),
                     TR_F_Tot = sum(FPE_Female_TR, na.rm = TRUE),
                     TR_M_Tot = sum(FPE_Male_TR, na.rm = TRUE),
                     TR_O_Tot = sum(FPE_Other_TR, na.rm = TRUE),
                     Tot_F_all = sum(FPE_Female_RO + FPE_Female_TR, na.rm = TRUE),
                     Tot_M_all = sum(FPE_Male_RO + FPE_Male_TR, na.rm = TRUE),
                     Tot_O_all = sum(FPE_Other_RO + FPE_Other_TR, na.rm = TRUE),
                     Tot = sum(FPE_Female_RO + FPE_Female_TR + FPE_Male_RO + FPE_Male_TR + FPE_Other_RO + FPE_Other_TR, na.rm = TRUE), # Does not add up!
                     Tot2 = sum(FPE_Total)) %>%
            summarise(TotFemalPer = percent(Tot_F_all/Tot2, accuracy = 0.1),
                      Female_ROPer = percent(RO_F_Tot/Tot2, accuracy = 0.01),
                      Female_TRPer = percent(TR_F_Tot/Tot2, accuracy = 0.01),
                      TotMalePer = percent(Tot_M_all/Tot2, accuracy = 0.1),
                      Male_ROPer = percent(RO_M_Tot/Tot2, accuracy = 0.1),
                      Male_TRPer = percent(TR_M_Tot/Tot2, accuracy = 0.1),
                      OtherPer = percent(Tot_O_all/Tot2, accuracy = 0.001),
                      Other_ROPer = percent(RO_O_Tot/Tot2, accuracy = 0.001),
                      Other_TRPer = percent(TR_O_Tot/Tot2, accuracy = 0.001))

# Disability ----

## Read the disability data ----


# Map cost centres to a new column of subjects
dis$discipline <- unname(cc2subjects[dis[["Cost_centre_v2"]]])

dis %>% select(!ends_with("%")) %>%  View()

# Do not appear to be able to read non-adjacent columns and do not want all
# the detail so will have to read in separately and then put back together
disability <- read_xlsx("../Data/hesa.xlsx", range = "Disability!A5:C54")
names(disability) <-  c("Academic_Year", "Cost_centre_group_v2", "Cost_centre_v2")

# Research only
disability2 <- read_xlsx("../Data/hesa.xlsx", range = "Disability!Y5:Y54")
names(disability2) <-  c("No_known_RO")

disability3 <- read_xlsx("../Data/hesa.xlsx", range = "Disability!AU5:AU54")
names(disability3) <-  c("No_known_TR")

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
disability$discipline <- unname(cc2subjects[disability[["Cost_centre_v2"]]])

## RO & TR disability %s ----
# Plot graph of no known disabilities
disability %>% pivot_longer(
                             cols = c("No_known_RO", "No_known_TR"),
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
                scale_fill_manual(labels = c("Resarch only", "Teaching & Research"), values = c("green","red"))

## Read aggregated disabilities values ----
# Modified the spreadsheet to aggregate the disability values.
# Read a modified version of the spreadsheet that sums up the disabilities.
disability <- read_xlsx("../Data/hesa.xlsx", range = "Disability!A5:C54")
names(disability) <-  c("Academic_Year", "Cost_centre_group_v2", "Cost_centre_v2")

# Research only
disability2 <- read_xlsx("../Data/hesa.xlsx", range = "Disability!AX5:BC54")
#names(disability2) <-  c("dis_RO",	"no_dis_RO",	"dis_TR",	"no_dis_TR",	"Total",	"Total_num")

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

## Plot aggregated disabilities ----
# Plot the graph for Research Only (RO) and Training & Research (TR)
disability %>% pivot_longer(
                           cols = c("dis_RO",	"no_dis_RO",	"dis_TR",	"no_dis_TR"),
                           names_to = "disability",
                            values_to = "percent"
                            )                        %>%
                group_by(discipline)                 %>%
                mutate(pos = sum(percent))           %>%
                mutate(disability = factor(disability, levels = c("dis_RO",	"no_dis_RO",	"dis_TR",	"no_dis_TR"), ordered = TRUE)) %>%
                ggplot(aes(y = discipline, x = percent, fill = disability)) +
                geom_col(colour = "black") +
                theme_bw() +
                scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.125)) +
                ylab("Research discipline") +
                xlab("Percent") + labs(fill = "Disability") +
                geom_text(aes(y = discipline, x = pos, label = comma(Total_num)), hjust = -0.25,
                          position = "identity", inherit.aes = FALSE, size = 3) +
                scale_fill_manual(labels = c("RO disability", "RO no known disability" , "TR disability", "TR no known disability"),
                                  values = c("green","red","blue","yellow"))

## Aggregate TR and RO ----

# Have to read the data in again to capture the numeric data
# Read the disability data
dis <- read_xlsx("../Data/hesa.xlsx", range = "Disability!A5:AW55")

# Rename the columns
names(dis) <- c("Academic_Year",
                "Cost_centre_group_v2",
                "Cost_centre_v2",
                "RO_a_long_standing_illness_or_health_condition",
                "RO_a_physical_impairment_or_mobility_issues",
                "RO_Another_disability_impairment_or_medical_condition",
                "RO_Blind_or_a_serious_visual_impairment",
                "RO_Deaf_or_a_serious_hearing_impairment",
                "RO_General_learning_disability_such_as_Down_syndrome",
                "RO_Mental_health_condition",
                "RO_Social_communication_Autistic_spectrum_disorder",
                "RO_Specific_learning_difficulty",
                "RO_Two_or_more_conditions",
                "RO_No_known_disability_unknown",
                "RO_a_long_standing_illness_or_health_condition%",
                "RO_a_physical_impairment_or_mobility_issues%",
                "RO_Another_disability_impairment_or_medical_condition%",
                "RO_Blind_or_a_serious_visual_impairment%",
                "RO_Deaf_or_a_serious_hearing_impairment%",
                "RO_General_learning_disability_such_as_Down_syndrome%",
                "RO_Mental_health_condition%",
                "RO_Social_communication_Autistic_spectrum_disorder%",
                "RO_Specific_learning_difficulty%",
                "RO_Two_or_more_conditions%",
                "RO_No_known_disability_unknown%",
                "TR_a_long_standing_illness_or_health_condition",
                "TR_a_physical_impairment_or_mobility_issues",
                "TR_Another_disability_impairment_or_medical_condition",
                "TR_Blind_or_a_serious_visual_impairment",
                "TR_Deaf_or_a_serious_hearing_impairment",
                "TR_General_learning_disability_such_as_Down_syndrome",
                "TR_Mental_health_condition",
                "TR_Social_communication_Autistic_spectrum_disorder",
                "TR_Specific_learning_difficulty",
                "TR_Two_or_more_conditions",
                "TR_No_known_disability_unknown",
                "TR_a_long_standing_illness_or_health_condition%",
                "TR_a_physical_impairment_or_mobility_issues%",
                "TR_Another_disability_impairment_or_medical_condition%",
                "TR_Blind_or_a_serious_visual_impairment%",
                "TR_Deaf_or_a_serious_hearing_impairment%",
                "TR_General_learning_disability_such_as_Down_syndrome%",
                "TR_Mental_health_condition%",
                "TR_Social_communication_Autistic_spectrum_disorder%",
                "TR_Specific_learning_difficulty%",
                "TR_Two_or_more_conditions%",
                "TR_No_known_disability_unknown%",
                "Total",
                "Total%")

# Map the data that we want - have to do this in two steps
dis <- dis                                         %>%
       select(!ends_with("%"))                     %>%
       filter(Cost_centre_v2 %in% esrc_cc)         %>%
       fill(Academic_Year, Cost_centre_group_v2)

dis <- dis                                                                %>%
       mutate(discipline = unname(cc2subjects[dis[["Cost_centre_v2"]]]))  %>%
       select(-Academic_Year, -Cost_centre_group_v2)                      %>%
       rowwise()                                                          %>%
       mutate(dis = sum(c_across(c(RO_a_long_standing_illness_or_health_condition:RO_Two_or_more_conditions,
                                  TR_a_long_standing_illness_or_health_condition:TR_Two_or_more_conditions)),
                       na.rm = TRUE),
              no_dis = sum(c_across(c(RO_No_known_disability_unknown, TR_No_known_disability_unknown)),
                           na.rm = TRUE))

# Plot the data
dis %>% select(discipline, dis, no_dis, Total) %>%
        pivot_longer(
                    cols = c("dis",	"no_dis"),
                    names_to = "disability",
                    values_to = "numbers"
                    )                         %>%

        group_by(discipline)                  %>%
        mutate(pos = sum(numbers))            %>%
        mutate(disability = factor(disability, levels = c("dis",	"no_dis"), ordered = TRUE)) %>%
        ggplot(aes(y = discipline, x = numbers, fill = disability)) +
        geom_col(colour = "black") +
        theme_bw() + xlim(0,13000) +
        #scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.125)) +
        ylab("Research discipline") +
        xlab("Numbers") + labs(fill = "Disability") +
        geom_text(aes(y = discipline, x = pos, label = comma(Total)), hjust = -0.25,
                          position = "identity", inherit.aes = FALSE, size = 3) +
        scale_fill_manual(labels = c("disability", "no known disability"),
                                  values = c("blue","yellow"))

## Plot RO only aggregated disabilities ----
# Plot the graph for Research Only (RO)
dis %>% pivot_longer(
                      cols = c("dis",	"no_dis"),
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
        xlab("Number") + labs(fill = "Disability") +
        geom_text(aes(y = discipline, x = pos, label = comma(Total_num)), hjust = -0.25,
                          position = "identity", inherit.aes = FALSE, size = 3) +
       scale_fill_manual(labels = c("RO disability", "RO no known disability"),
                         values = c("blue","yellow"))

# Percentages are calculated in the spreadsheet.

# Ethnicity ----

## Read ethnicity data ----
# Read the data
ethnicity <- read_xlsx("../Data/hesa.xlsx", sheet = "Ethnicity", skip = 3)

# Rename the columns
names(ethnicity) <- c("Academic_Year", "Cost_centre_group_v2",	"Cost_centre_v2",
                      "ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White",
                      "RO_Asian",	"RO_Black",	"RO_Mixed",	"RO_Other",	"RO_Unknown_NA",	"RO_White",
                      "TRp_Asian",	"TRp_Black",	"TRp_Mixed",	"TRp_Other",	"TRp_Unknown_NA",	"TRp_White",
                      "TR_Asian",	"TR_Black",	"TR_Mixed",	"TR_Other",	"TR_Unknown_NA",	"TR_White",
                      "pTotal", "nTotal")

# Repeat values
ethnicity <- ethnicity %>% fill(Academic_Year, Cost_centre_group_v2)

# Pick the ESRC related cost centres
ethnicity <- ethnicity %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
ethnicity$discipline <-unname(cc2subjects[ethnicity[["Cost_centre_v2"]]])

## Plot all ethnicities ----
# Plot the ethnicity - RO and TR
ethnicity %>% pivot_longer(
                           cols = c("ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White",
                                    "TRp_Asian",	"TRp_Black",	"TRp_Mixed",	"TRp_Other",	"TRp_Unknown_NA",	"TRp_White"),
                           names_to = "ethnicity",
                           values_to = "percent"
                         )                         %>%
              filter(!is.na(percent))              %>%
              group_by(discipline)                 %>%
              mutate(pos = sum(percent))           %>%
              mutate(ethnicity = factor(ethnicity, levels = c("ROp_Asian",	"ROp_Black",	"ROp_Mixed",	"ROp_Other",	"ROp_Unknown_NA",	"ROp_White",
                                                              "TRp_Asian",	"TRp_Black",	"TRp_Mixed",	"TRp_Other",	"TRp_Unknown_NA",	"TRp_White"),
                                        ordered = TRUE)) %>%
              ggplot(aes(y = discipline, x = percent, fill = ethnicity)) +
              geom_col(colour = "black") +
              theme_bw() +
              scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.15)) +
              ylab("Research discipline") +
              xlab("Percent") + labs(fill = "Ethnicity") +
              geom_text(aes(y = discipline, x = pos, label = comma(nTotal)), hjust = -0.25,
                        position = "identity", inherit.aes = FALSE, size = 3) +
              scale_fill_manual(labels = c("RO Asian",	"RO Black",	"RO Mixed",	"RO Other",	"RO Unknown/NA",	"RO White",
                                          "TR Asian",	"TR Black",	"TR Mixed",	"TR Other",	"TR Unknown/NA",	"TR White"),
                                values = viridis(12))

# Colour map to use
colormap <- viridis(6)

## Plot ethnicity RO only ----
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
                                values = colormap)

## Plot filled cols ethnicity RO only ----
# Plot the ethnicity - RO only (filling values to compare proportions)
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
  geom_col(colour = "black", position = "fill") +
  theme_bw() +
  scale_x_continuous(labels = percent_format(accuracy = 1)) +
  ylab("Research discipline") +
  xlab("Percent") + labs(fill = "Ethnicity") +
  scale_fill_manual(labels = c("RO Asian",	"RO Black",	"RO Mixed",	"RO Other",	"RO Unknown/NA",	"RO White"),
                    values = colormap)

## Plot ethnicity TR only ----
# Plot the ethnicity - TR only
ethnicity %>% pivot_longer(
                          cols = c("TRp_Asian",	"TRp_Black",	"TRp_Mixed",	"TRp_Other",	"TRp_Unknown_NA",	"TRp_White"),
                          names_to = "ethnicity",
                          values_to = "percent"
                          )                                    %>%
                          filter(!is.na(percent))              %>%
                          group_by(discipline)                 %>%
                          mutate(pos = sum(percent))           %>%
                          mutate(ethnicity = factor(ethnicity, levels = c("TRp_Asian",	"TRp_Black",	"TRp_Mixed",	"TRp_Other",	"TRp_Unknown_NA",	"TRp_White"),
                                                    ordered = TRUE)) %>%
                          ggplot(aes(y = discipline, x = percent, fill = ethnicity)) +
                          geom_col(colour = "black") +
                          theme_bw() +
                          scale_x_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1.02)) +
                          ylab("Research discipline") +
                          xlab("Percent") + labs(fill = "Ethnicity") +
                          geom_text(aes(y = discipline, x = pos, label = comma(nTotal)), hjust = -0.25,
                                    position = "identity", inherit.aes = FALSE, size = 3) +
                          scale_fill_manual(labels = c("TR Asian",	"TR Black",	"TR Mixed",	"TR Other",	"TR Unknown/NA",	"TR White"),
                                            values = colormap)

## Plot filled cols ethnicity TR only ----
# Plot the ethnicity - TR only (with the position filled to compare proportions)
ethnicity %>% pivot_longer(
  cols = c("TRp_Asian",	"TRp_Black",	"TRp_Mixed",	"TRp_Other",	"TRp_Unknown_NA",	"TRp_White"),
  names_to = "ethnicity",
  values_to = "percent"
)                                      %>%
  filter(!is.na(percent))              %>%
  group_by(discipline)                 %>%
  mutate(pos = sum(percent))           %>%
  mutate(ethnicity = factor(ethnicity, levels = c("TRp_Asian",	"TRp_Black",	"TRp_Mixed",	"TRp_Other",	"TRp_Unknown_NA",	"TRp_White"),
                            ordered = TRUE)) %>%
  ggplot(aes(y = discipline, x = percent, fill = ethnicity)) +
  geom_col(colour = "black", position = "fill") +
  theme_bw() +
  scale_x_continuous(labels = percent_format(accuracy = 1)) +
  ylab("Research discipline") +
  xlab("Percent") + labs(fill = "Ethnicity") +
  # geom_text(aes(y = discipline, x = pos, label = comma(nTotal)), hjust = -0.25,
  #           position = "identity", inherit.aes = FALSE, size = 3) +
  scale_fill_manual(labels = c("TR Asian",	"TR Black",	"TR Mixed",	"TR Other",	"TR Unknown/NA",	"TR White"),
                    values = colormap)

# Institutions ----

## Read in data ----
# Read in the data
provider <-  read_xlsx("../Data/hesa.xlsx", sheet = "Provider", skip = 2)

# Rename the columns
# RO - Research Only
# ROp - Research Only percentage
# TR - Teaching & Research
# TRp - Teaching & Research percentage
names(provider) <-  c("Academic_Year", "Cost_centre_group_v2", "Cost_centre_v2", "ukprn",
                      "RO", "ROp", "TR",	"TRp", "Total",	"Totalp")

# Repeat values
provider <- provider %>% fill(Academic_Year, Cost_centre_group_v2, Cost_centre_v2)

# Pick the ESRC related cost centres
provider <- provider %>% filter(Cost_centre_v2 %in% esrc_cc)

# Map cost centres to a new column of subjects
provider$discipline <-unname(cc2subjects[provider[["Cost_centre_v2"]]])

# Need to download the unistat dataset from:
#
# https://www.hesa.ac.uk/support/tools-and-downloads/unistats
#
# UKPRN to institution can be obtained from the AccreditationByHep.csv but needs
# a bit of massaging.
#
# The following source would be better but the code below works with the unistat
# data.
#
# https://www.hesa.ac.uk/files/ProviderAllHESA.csv?20220621
#
institutions <-  read_csv("../Data/on_2022_03_15_13_26_06/AccreditationByHep.csv",
                          show_col_types = FALSE)

# Keep only the institutions
institutions <- unique(institutions$HEP)

# Create a new data frame with the UKPRN and institution
ukprn2inst <- data.frame(ukprn = sub("^\\((\\d+)\\)\\s+(.*)$", "\\1", institutions, perl = TRUE),
                         institution = sub("^\\((\\d+)\\)\\s+(.*)$", "\\2", institutions, perl = TRUE))

# Join the two data sets
provider <- provider %>% left_join(ukprn2inst, by = "ukprn")

## Loop to plot TR and RO by institutions ----
# Plot the results by RO and TR %s for research disciplines
for(disc in unique(provider$discipline)){

  print(paste("Research discipline:", disc))

  # Need to print to get the plots to show
  print(
          provider %>% pivot_longer(cols = c("ROp", "TRp"),
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
                        scale_fill_manual(labels = c("Research Only", "Teaching & Research"),
                                          values = viridis(2)) +
                        ggtitle(paste0("Research discipline: ", disc))
    )
}

## Loop to plot numbers institution numbers for each CC ----
# Plot the FPEs for research disciplines
for(disc in unique(provider$discipline)){

  print(paste("Research discipline:", disc))

  # Need to print to get the plots to show
  print(
      provider %>%
      filter(!is.na(institution))         %>%
      filter(Total > 0)                   %>%
      filter(discipline == disc)          %>%
      ggplot(aes(y = institution, x = Total, fill = Total)) +
      geom_col(colour = "black") +
      theme_bw() +
      theme(axis.text.y = element_text(size = 6), legend.position = "None") +
      ylab("Institutions") + xlab("Full Person Equivalent") +
      scale_fill_viridis(option="magma") +
      ggtitle(paste0("Research discipline: ", disc))
  )
}

## Tuned CC for institutions ----
# Tune the plots (a lot of them are too busy)
disc <- "Business & management studies"
N <- 100
provider %>%  filter(!is.na(institution))         %>%
              filter(Total > N)                   %>%
              filter(discipline == disc)          %>%
              ggplot(aes(y = institution, x = Total, fill = Total)) +
              geom_col(colour = "black") +
              theme_bw() +
              theme(axis.text.y = element_text(size = 8), legend.position = "None") +
              ylab("Institutions") + xlab("Full Person Equivalent") +
              scale_fill_viridis(option="magma") +
              ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Architecture, built environment & planning"
N <- 10
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Education"
N <- 50
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Continuing education"
N <- 0
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc))

disc <- "Area studies"
N <- 0
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc))

disc <- "Psychology & behavioural sciences"
N <- 50
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Geography & environmental studies"
N <- 20
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Anthropology & development studies"
N <- 0
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc))

disc <- "Politics & international studies"
N <- 20
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Economics & econometrics"
N <- 20
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Law"
N <- 40
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Social work & social policy"
N <- 10
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Sociology"
N <- 20
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))

disc <- "Media studies"
N <- 20
provider %>%  filter(!is.na(institution))         %>%
  filter(Total > N)                   %>%
  filter(discipline == disc)          %>%
  ggplot(aes(y = institution, x = Total, fill = Total)) +
  geom_col(colour = "black") +
  theme_bw() +
  theme(axis.text.y = element_text(size = 8), legend.position = "None") +
  ylab("Institutions") + xlab("Full Person Equivalent") +
  scale_fill_viridis(option="magma") +
  ggtitle(paste0("Research discipline: ", disc," for N > ", N))


# Plot the total ESRC FPEs per institution
N <-  250
provider %>% filter(!is.na(institution))         %>%
             group_by(institution)               %>%
             summarise(rTotal = sum(Total))      %>%
             filter(rTotal > N)                  %>%
             ggplot(aes(y = institution, x = rTotal, fill = rTotal)) +
             geom_col(colour = "black") +
             theme_bw() +
             theme(axis.text.y = element_text(size = 8), legend.position = "None") +
             ylab("Institutions") + xlab("Full Person Equivalent") +
             scale_fill_viridis(option="magma") +
             ggtitle(paste0("ESRC FPE staff for N > ", N))
