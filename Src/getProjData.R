#/usr/bin/env Rscript
#
# Get more data than is available from the Gateway to Research data snapshot.
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
# Data snapshot from 24th February 2022.
gtrdat <- read_csv("../Data/projectsearch-1646403729132.csv.gz", col_types = input_cols)

# Clean the data ----------------------------------------------------------

# Remove EndDate >= 2050 or is an NAs - removes 25 values
gtrdat <- gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) < 2050,]

# Look at the ESRC data ---------------------------------------------------

# Filter ESRC data - 10834 rows (about 8.9% of the data)
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC")

## ESRC projects -----------------------------------------------------------

# Database file name
dbfile <- "../Data/esrc.sqlite"

# Create a sqlite database if it does not exist.
# DO NOT RUN THIS IF THE DATABASE ALREADY EXISTS AND HAS BEEN POPULATED!
if(!file.exists(dbfile)){
  mydb <- dbConnect(RSQLite::SQLite(), dbfile)
}

## Get additonal data for ESRC projects -------------------------------

#
# Temporary test
page <- "https://gtr.ukri.org:443/projects?ref=ES/P008003/1"
pat <- fromJSON(page, simplifyVector = TRUE)
View(pat)

pat2 <- fromJSON(page, simplifyDataFrame = TRUE, flatten = TRUE)
View(pat2)

# End Temporary test
#

# Get the pids that are already in the database
pids <- c("") #dbQuery(mydb,"SELECT FROM;")

# Function to collapse a list and separate elements by semicolons
collapseList <- function(x){paste(unlist(x), collapse = "; ")}
collapseDF <- function(x){paste(x, collapse = ", ")}

# New data frames that are to become sqlite tables
Projects <- tibble()
Collaborations <- tibble()
Organisations <- tibble()
Persons <- tibble()
OrgRole <- tibble()

# Loop round the ESRC project URLS
for(i in seq_len(nrow(esrcdat))){

  # Reset variables
  policy <- NULL

  # Project id
  pid <- esrcdat[["ProjectReference"]][i]

  # Check whether we already have the project data.
  # ToDo need to populate the pids properly
  if(pid %in% pids){
    next
  }

  # Project URL
  purl <- esrcdat[["GTRProjectUrl"]][i]

  # Get the project data
  pdat <- fromJSON(purl, simplifyVector = TRUE)

  # Get the bits of the data that we want
  lastRefresh <- pdat$lastRefreshDate

  ### Project Overview ------
  # Project composition - project section in the data
  section <- pdat$projectOverview$projectComposition$project
  title <- section$title
  status <- section$status
  grantCategory <- section$grantCategory
  grantReference <- section$grantReference
  abstract <- section$abstractText
  impact <- section$potentialImpactText
  section <- pdat$projectOverview$projectComposition$project$fund
  valuePounds <- section$valuePounds
  startdate <- section$start
  endate <- section$end

  ### Lead Research Organisation ------
  section <- pdat$projectOverview$projectComposition$leadResearchOrganisation
  nameLeadOrg <- section$name
  departmentLeadOrg <- section$department
  addressLeadOrg <- collapseList(section$address)
  # Neglecting id and url entries

  section <- pdat$projectOverview$projectComposition

  # Information about people involved in the project
  personRole <- section$personRole
  presonRole$grantReference <- rep(grantReference, nrow(personRole))

  # Information involved in the bid
  organisationRole <- section$organisationRole
  organisationRole$address <- paste(organisationRole$address, collapse = ", ")
  organisationRole$grantReference <- rep(grantReference, nrow(organisationRole))

  # Studentships do not seem to have entries populated
  if(grantCategory != "Studentship"){

    # ToDo - data frame 4 columns
    collaborator <- section$collaborator

    # Collaboration info - a data frame with 11 columns
    collaborationOutput <- pdat$projectOverview$projectComposition$project$output$collaborationOutput

    # add the grant ref to the data frame
    collaborationOutput$grantRef <- rep(grantReference, nrow(collaborationOutput))

    section <- pdat$projectOverview$projectComposition$project$output

    # ToDo - add to Projects
    intelProp <- paste(unlist(section$intellectualPropertyOutput), collapse="; ")

    # Data frame with 8 columns
    policy <- section$policyInfluenceOutput

    # Collapse the area column which is composed of lists (not always populated)
    policy$area <- sapply(policy$area, collapseList)

    # Collapse list
    productOutput <- paste(unlist(section$productOutput),collapse = "; ")

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
    healthCategoty <- section$healthCategory

    # ToDo - list
    reasearchActivity <- section$researchActivity

    # ToDo - data frame 4 columns
    researchSubject <- section$researchSubject

    # ToDo - data frame 4 columns
    researchTopic <- section$researchTopic

    # ToDo - 4 columns
    rcukProgram <- section$rcukProgramme

    # Neglecting typeInd, id and url entries
    # Missing most of the content in the pagedListHolder other than the source
    # that seem to be publications

    ### pagedListHolder section ----
    # ToDo - data frame with 9 columns
    source <- pdat$pagedListHolder$source
    source$author <- sapply(source$author, collapseList)


  } # End of no Studentship



  ## Append data to tibbles -----
  # These will be used to create db tables.
  Projects <- add_row(Projects, c(grantReference, lastRefresh, status, grantCategory, title,
                                  abstract, impact, valuePounds, startdate,
                                  enddate, intelProp, productOutput))

  Policy <- add_row(Policy, policy)

  Organisations <- add_row(Organisations,c(grantReference, nameLeadOrg, departmentLeadOrg, addressLeadOrg))

  Persons <- add_row(Persons, personRole)

  OrgRole <- add_row(OrgRole, organisationRole)


}

# Write the output
dbWriteTable(mysql, "Projects",Projects)
dbWriteTable(mysql, "Collaborations",Collaborations)
dbWriteTable(mysql, "Organisations",Organisations)
dbWriteTable(mysql, "OrgRole",OrgRole)
