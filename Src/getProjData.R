#/usr/bin/env Rscript
#
# Get more data from the Gateway to Research.
#


# Required packages -------------------------------------------------------

# Load packages to be used
library(readr)
library(lubridate)
library(dplyr)
library(jsonlite)
library(stringr)
library(DBI)

# Read the GtR data -----------------------------------------------------------

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
  StartDate = col_date(format = "%d/%m/%Y"),
  EndDate = col_date(format = "%d/%m/%Y"),
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
# Data snapshot from 30th of September 2021.
# gtrdat <- read_csv("../Data/projectsearch-1636377694679.csv.gz", col_types = input_cols)
# Data snapshot from 28th October 2021.
gtrdat <- read_csv("../Data/projectsearch-1633957153275.csv.gz", col_types = input_cols)

# Clean the data ----------------------------------------------------------

# Remove EndDate >= 2050 or is an NAs - removes 25 values
gtrdat <- gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) < 2050,]

# Look at the ESRC data ---------------------------------------------------


## ESRC projects -----------------------------------------------------------

# Filter ESRC data - 10834 rows (about 8.9% of the data)
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC")

# Create a sqlite database if it does not exist.
# DO NOT RUN THIS IF THE DATABASE ALREADY EXISTS AND HAS BEEN POPULATED!
dbfile <- "../Data/esrc.sqlite"
if(!file.exists(dbfile)){
  mydb <- dbConnect(RSQLite::SQLite(), dbfile)

  # Create the tables
  dbQuery(mydb, "
           CREATE TABLE name();
          ")
}

## Get additonal data for ESRC projects -------------------------------

# Temporary test
page <- "https://gtr.ukri.org:443/projects?ref=ES/P008003/1"
pat <- fromJSON(page, simplifyVector = TRUE)
View(pat)


# Get the pids that are already in the database
pids <- c("") #dbQuery(mydb,"SELECT FROM;")

# Function to collapse a list and separate elements by semicolons
collapseList <- function(x){paste(unlist(x), collapse = "; ")}

# Loop round the project URLS
for(i in seq_len(nrow(esrcdat))){

  # Project id
  pid <- esrcdat[["ProjectReference"]][i]

  # Check whether we already have the project data
  if(pid %in% pids){
    next
  }

  # Project url
  purl <- esrcdat[["GTRProjectUrl"]][i]

  # Get the project data
  pdat <- fromJSON(purl, simplifyVector = TRUE)

  # Get the bits of the data that we want
  lastRefresh <- pdat$lastRefreshDate

  # Project section in the data
  section <- pdat$projectOverview$projectComposition$project
  title <- section$title
  status <- section$status
  category <- section$grantCategory
  ref <- section$grantReference
  abstract <- section$abstractText
  impact <- section$potentialImpactText
  section <- pdat$projectOverview$projectComposition$project$fund
  valuePounds <- section$valuePounds
  startdate <- section$start
  endate <- section$end

  # Collaboration info - a data frame with 11 columns
  collaborationOutput <- pdat$projectOverview$projectComposition$project$output$collaborationOutput
  # add the grant ref to the dataframe
  collaborationOutput$grantRef <- rep(ref, nrow(collaborationOutput))

  section <- pdat$projectOverview$projectComposition$project$output
  intelProp <- section$intellectualPropertyOutput

  # Data frame with 8 columns
  policy <- section$policyInfluenceOutput

  # Collapse the area column which is composed of lists (notalways populated)
  policy$area <- sapply(policy$area, collapseList)
}

