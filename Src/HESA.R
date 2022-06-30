# Examine some HESA data
#

# Setup ----
library(readxl)
library(dplyr)
library(ggplot2)

# ESRC related subjects mapped to cost centres
# https://www.ukri.org/about-us/esrc/what-is-social-science/social-science-disciplines/
esrc_cc <- c( "(123) Architecture, built environment & planning",
              "(124) Geography & environmental studies",
              "(125) Area studies",
              "(127) Anthropology & development studies",
              "(128) Politics & international studies",
              "(129) Economics & econometrics",
              "(130) Law",
              "(131) Social work & social policy",
              "(132) Sociology",
              "(135) Education",
              "(145) Media studies"
)

# Gender ----

# Read the corresponding data and sheet
hesdat <- read_xlsx("../Data/hesa.xlsx", sheet = "Gender", skip = 3)

#  FPE - Full Person Equivalent
#  _RO - Research Only
# p_RO - % Research Only
#  _TO - Teaching Only
# p_TO - % Teaching Only
names(hesdat) <- c("Academic_Year",
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
hesdat <- hesdat %>% fill(Academic_Year, Cost_centre_group_v2)


