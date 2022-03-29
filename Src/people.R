#!/usr/bin/env Rscript
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

# Read the Gateway to Research data snapshot.
# Data snapshot from 24th February 2022.
gtrdat <- read_csv("../Data/projectsearch-1646403729132.csv.gz",
                   col_types = input_cols)

# Filter out the ESRC data
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC")

# Only take projects that started on or after 2016
esrcdat <- esrcdat %>% filter( year(StartDate) >= 2016)

esrcdat %>%  filter(ProjectCategory == "Research Grant")            %>%
             select(LeadROName, Department,PIFirstName, PISurname)  %>%
             mutate(SearchString = paste0("https://www.google.com/search?q=",
                                          PIFirstName,"+",
                                          PISurname,"+",
                                          gsub(" ","+",LeadROName))) -> org

write_csv(org, "../Data/org-dep-pifname-pisname-search.csv")
