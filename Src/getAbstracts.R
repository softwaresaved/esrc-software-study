#/usr/bin/env Rscript
#
# Get the project abstracts from the Gateway to Research web site.
#


# Required packages -------------------------------------------------------

# Load packages to be used
library(readr)
library(lubridate)
library(dplyr)
library(jsonlite)

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
gtrdat <- read_csv("../Data/projectsearch-1646403729132.csv.gz",
                   col_types = input_cols)

# Clean the data ----------------------------------------------------------

# Remove EndDate >= 2050 or is an NAs - removes 25 values
gtrdat <- gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) < 2050, ]

# Look at the ESRC data ---------------------------------------------------

# Filter ESRC data - 10834 rows (about 8.9% of the data)
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC")

## Get additional data for ESRC projects -------------------------------

# Loop round the ESRC project URLS
for (i in seq_len(nrow(esrcdat))) {

  # Project id
  pid <- esrcdat[["ProjectReference"]][i]

  # Project Status
  status <- esrcdat[["Status"]][i]

  # Project URL
  purl <- esrcdat[["GTRProjectUrl"]][i]

  # Project title
  title <- esrcdat[["Title"]][i]

  # File to write out to
  outfile <- paste0(pid, ".txt")

  # Replace forward slashes with underscores in the file name
  outfile <- gsub("/", "_", outfile)
  if (status == "Active") {
    outfile <- paste0("../Data/Abstracts/Active/", outfile)
  } else {
    outfile <- paste0("../Data/Abstracts/Inactive/", outfile)
  }

  # If the file already exists move on to the next
  if(file.exists(outfile)) {
    next
  }

  # Space the downloads
  Sys.sleep(1)

  # Get the project data
  try(pdat <- fromJSON(purl, simplifyVector = TRUE))

  # Check we have data
  if (is.null(pdat)){
    next
  }

  # Project abstract
  abstract <- pdat$projectOverview$projectComposition$project$abstractText

  # Text to write out
  text <- paste0(purl, "\n\n", title, "\n\n", abstract)

  # Write to file
  write(text, outfile)

}
