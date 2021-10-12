#/usr/bin/env Rscript
#
# A playground to look at data downloaded from the Gageway to Research.
#


# Required packages -------------------------------------------------------

# Load packages to be used
library(readr)
library(lubridate)
library(dplyr)
library(ggplot2)


# Read the data -----------------------------------------------------------

# Columns to read
input_cols <- cols(
  FundingOrgName = col_character(),
  ProjectReference = col_character(),
  LeadROName = col_character(),
  Department = col_character(),
  ProjectCategory = col_character(),
  PISurname = col_character(),
  PIFirstName = col_character(),
  PIOtherNames = col_character(),
  `PI ORCID iD` = col_character(),
  StudentSurname = col_character(),
  StudentFirstName = col_character(),
  StudentOtherNames = col_character(),
  `Student ORCID iD` = col_character(),
  Title = col_character(),
  StartDate = col_date(format="%d/%m/%Y"),
  EndDate = col_date(format="%d/%m/%Y"),
  AwardPounds = col_double(),
  ExpenditurePounds = col_double(),
  Region = col_character(),
  Status = col_character(),
  GTRProjectUrl = col_character(),
  ProjectId = col_character(),
  FundingOrgId = col_character(),
  LeadROId = col_character(),
  PIId = col_character()
)

# Read the Gateway to Research data
gtrdat <- read_csv("../Data/projectsearch-1633957153275.csv.gz", col_types = input_cols)


# Explore the data --------------------------------------------------------


# Number of rows
nrow(gtrdat) # 121,119

# Period covered by the data
min(gtrdat$StartDate)             # 1973-01-01
max(gtrdat$StartDate)             # 2022-09-26
sum(is.na(gtrdat$EndDate))        # Number of NAs in the end date - 203
min(gtrdat$EndDate, na.rm = TRUE) # 2004-08-31
max(gtrdat$EndDate, na.rm = TRUE) # 3202-10-31 !!! Typo?

# More on project end dates
gtrdat[max(gtrdat$EndDate, na.rm = TRUE) == "3202-10-31"]
sum(year(gtrdat$EndDate) > 2035, na.rm = TRUE) # 51
sum(is.na(gtrdat$EndDate)) # 250

# "2050-03-31" "2121-10-08" "3202-10-31" "2121-03-31" "3023-03-31"
unique(gtrdat[["EndDate"]][!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) > 2035])

# How many? 51
length(gtrdat[["EndDate"]][!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) > 2035])

# Do the 2050 end dates make sense? No
gtrdat[year(gtrdat$EndDate) == 2050, c("FundingOrgName","ProjectCategory","AwardPounds")] # [year(gtrdat$EndDate) == 2050]
gtrdat[year(gtrdat$EndDate) == 2050,"FundingOrgName"]

# How many funding org names are missing? 0
sum(is.na(gtrdat$FundingOrgName))
sum(is.na(gtrdat[["FundingOrgName"]])) # 0

# Find unique project categories
unique(gtrdat$ProjectCategory)

# Clean the data ----------------------------------------------------------

# Remove EndDate >= 2050 or is an NAs - removes 25 values
gtrdat <- gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) < 2050,]



# Look at the ESRC data ---------------------------------------------------


# Filter ESRC data - 10834 rows (about 8.9% of the data)
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC")

# Look at the project categories
esrcdat %>% select(ProjectCategory, AwardPounds)                   %>%
            group_by(ProjectCategory)                              %>%
            summarise(Number = n(), TotalAward = sum(AwardPounds)) %>%
            mutate(AverageAward = TotalAward/Number)               %>%
            arrange(desc(AverageAward))
