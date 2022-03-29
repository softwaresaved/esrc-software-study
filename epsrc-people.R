#!/usr/bin/env Rscript
#
# Collect recent PI and student names.
#

library(readr)      # For reading data
library(lubridate)  # For manipulating data
library(dplyr)      # For manipulating data


# Gateway to Research (GtR) data ------------------------------------------

## Read GtR data -----------------------------------------------------------

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

# Year to get data from
YEAR <- 2016

# Read the Gateway to Research data snapshot.
# Data snapshot from 24th February 2022.
gtrdat <- read_csv("../Data/projectsearch-1646403729132.csv.gz",
                   col_types = input_cols)

# Filter out the ESRC data
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC") %>%
           filter( year(StartDate) >= YEAR)

# Filter out EPSRC data
epsrcdat <- gtrdat %>% filter(FundingOrgName == "EPSRC") %>%
            filter(year(StartDate) >= YEAR)

# Unique ESRC PIIds
esrc_piids <- unique(esrcdat$PIId)

# Unique  EPSRC PIIds
epsrc_piids <-  unique(epsrcdat$PIId)

# EPSRC PIIds not in the ESRC PIIds
valid_piids <- epsrc_piids[!(epsrc_piids %in% esrc_piids)]

# Filter out any PIs that are in the ESRC data
epsrcdat <- epsrcdat %>% filter(!is.na(PIId) & (PIId %in% valid_piids))

# Create a data frame to write out
epsrcdat %>% filter(ProjectCategory == "Research Grant")             %>%
             distinct(PIId, .keep_all = TRUE)                        %>%
             select(organisation = LeadROName,
                    Department,
                    firstname = PIFirstName,
                    othernames = PIOtherNames,
                    surname = PISurname)     -> org
# Number of rows
nrow(epsrcdat)

# Write the data out
write_csv(org, "../Data/epsrc-org-dep-pifname-pisname-search.csv")

# Students ----------------------------------------------------------------

# Filter out the ESRC data
epsrcdat <- gtrdat %>% filter(FundingOrgName == "EPSRC") %>%
            filter( year(StartDate) >= 2019)

epsrcdat <- epsrcdat %>% filter(ProjectCategory == "Studentship") %>%
                         select(organisation = LeadROName,
                                Department,
                                firstname = PIFirstName,
                                othernames = PIOtherNames,
                                surname = PISurname)   -> students

# Write the data out
write_csv(org, "../Data/epsrc-students.csv")
