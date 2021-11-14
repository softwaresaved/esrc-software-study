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

pat2 <- fromJSON(page, simplifyDataFrame = TRUE, flatten = TRUE)
View(pat2)

# Get the pids that are already in the database
pids <- c("") #dbQuery(mydb,"SELECT FROM;")

# Function to collapse a list and separate elements by semicolons
collapseList <- function(x){paste(unlist(x), collapse = "; ")}

# New data frames
Projects <- tibble()
Collaborations <- tibble()

# Loop round the project URLS
for(i in seq_len(nrow(esrcdat))){

  # Project id
  pid <- esrcdat[["ProjectReference"]][i]

  # Check whether we already have the project data.
  # ToDo need to populate the pids properly
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

  # Add to the project tibble.
  Projects <- add_row(Projects, c(ref, lastRefresh, status, category, title,
                                  abstract, impact, valuePounds, startdate,
                                  enddate))

  # Collaboration info - a data frame with 11 columns
  collaborationOutput <- pdat$projectOverview$projectComposition$project$output$collaborationOutput
  # add the grant ref to the data frame
  collaborationOutput$grantRef <- rep(ref, nrow(collaborationOutput))

  section <- pdat$projectOverview$projectComposition$project$output

  # ToDo this is a list.
  intelProp <- section$intellectualPropertyOutput

  # Data frame with 8 columns
  policy <- section$policyInfluenceOutput

  # Collapse the area column which is composed of lists (notalways populated)
  policy$area <- sapply(policy$area, collapseList)

  Policy <- add_row(Policy, policy)

  # ToDo check list output
  productOutput <- section$productOutput

  # ToDo - data frame with 9 columns
  researchMaterialOutput <- section$researchMaterialOutput

  # ToDo - data frame with 8 columns
  researchDBandModelOutputs <-  section$researchDatabaseAndModelOutput

  # ToDo - data frame with 9 columns
  SoftTechOutputs <- section$softwareAndTechnicalProductOutput

  # ToDo - data frame with 9 columns
  DBandModOutputs <-  section$researchDatabaseAndModelOutput

  # ToDo - list
  spinOut <-  section$spinOutOutput

  # ToDo - data frame with 6 columns
  impactSummary <- section$impactSummaryOutput

  # ToDo - data frame with 14 columns
  furtherFunding <- section$furtherFundingOutput

  # ToDo - list
  otherResarch <- section$otherResearchOutput

  # ToDo - list
  exploitation <- section$exploitationOutput

  # ToDo - data frame 10 columns
  section$disseminationOutput

  # ToDo - list of length 6
  keyFindings <- section$keyFindingsOutput

  section <- pdat$projectOverview$projectComposition$project

  # ToDo - data frame with 9 columns
  publications <- section$publication

  # ToDo - data frame with 2 columns
  identifier <- section$identifier

  # ToDo - list
  healthCat <- section$healthCategory

  # ToDo - list
  reasearchAct <- section$researchActivity

  # ToDo - data frame 4 columns
  researchSubject <- section$researchSubject

  # ToDo - data frame 4 columns
  researchTopic <- section$researchTopic

  # ToDo - 4 columns
  rcukProgram <- section$rcukProgramme

  # Neglecting id and url
  section <- pdat$projectOverview$projectComposition$leadResearchOrganisation
  nameLeadOrg <- section$name
  depLeadOrg <- section$department
  addresLeadOrg <- collapseList(section$address)

  # Neglecting typeInd, id and url

  section <- pdat$projectOverview$projectComposition

  # ToDo - data frame 7 columns
  personRole <- section$personRole

  # ToDo - data frame 4 columns
  collaborator <- section$collaborator

  # ToDo - sta frame 5 columns
  organisationRole <- section$organisationRole

  # Missing most of the content in the pagedListHolder other than the source
  # that seem to be publications

  # ToDo - data frame with 9 columns
  source <- pdat$pagedListHolder$source
  source$author <- sapply(source$author, collapseList)

}

