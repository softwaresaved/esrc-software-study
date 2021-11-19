#/usr/bin/env Rscript
#
# Get the project abstracts from the Gateway to Research data snapshot.
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
# Data snapshot from 30th of September 2021.
# gtrdat <- read_csv("../Data/projectsearch-1636377694679.csv.gz",
#                    col_types = input_cols)
# Data snapshot from 28th October 2021.
gtrdat <- read_csv("../Data/projectsearch-1633957153275.csv.gz",
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

  # Get the project data
  pdat <- fromJSON(purl, simplifyVector = TRUE)

  # Project abstract
  abstract <- pdat$projectOverview$projectComposition$project$abstractText

  # Text to write out
  text <- paste0(purl, "\n\n", title, "\n\n", abstract)

  # File to write out to
  outfile <- paste0(pid, ".txt")

  # Replace forward slashes with underscores in the file name
  outfile <- gsub("/", "_", outfile)
  # Write to file
  if (status == "Active") {
     outfile <- paste0("../Data/Abstracts/Active/", outfile)
     write(text, outfile)
  } else {
    outfile <- paste0("../Data/Abstracts/Inactive/", outfile)
    write(text, outfile)
 }

}
