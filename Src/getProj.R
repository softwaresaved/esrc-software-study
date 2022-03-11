#!/usr/bin/env Rscript
#
# Code to get json dished from the Gateway to Research web site as opposed
# to hitting the web-site multiple times. This can be run again to download
# new projects.
#


# Required packages -------------------------------------------------------

# Load packages to be used
library(readr, quietly = TRUE)
library(lubridate, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)
library(jsonlite, quietly = TRUE)
library(httr)

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

# Read the Gateway to Research data snapshot.
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

# Count new projects downloaded
newproject <- 0

# Make the output directory hierarchy
outdir1 <- "../Data/Proj/Active"
outdir2 <- "../Data/Proj/Inactive"

if(!dir.exists(outdir1)){
  dir.create(outdir1, recursive = TRUE)
}

if(!dir.exists(outdir2)){
  dir.create(outdir2, recursive = TRUE)
}

# Loop round the ESRC project URLS
for (i in seq_len(nrow(esrcdat))) {

  # Project id
  pid <- esrcdat[["ProjectReference"]][i]

  # Project Status - Active/Closed
  status <- esrcdat[["Status"]][i]

  # Project URL
  purl <- esrcdat[["GTRProjectUrl"]][i]

  # Project title
  title <- esrcdat[["Title"]][i]

  # File to write out to
  outfile <- paste0(pid, ".json")

  # Replace forward slashes with underscores in the file name
  filename <- gsub("/", "_", outfile)

  # Check whether the status of a project has changed, i.e. a json file has
  # already been downloaded as an active project but the project status is now
  # Closed, if this is the case remove the existing file and download a new
  # instance.
  if (status == "Closed" & file.exists(paste0("../Data/Proj/Active/", filename))){
    file.remove(paste0("../Data/Proj/Active/", filename))
    message("Removed ", paste0("../Data/Proj/Active/", filename))
  }

  # Create the file with path
  if (status == "Active") {
    outfile <- paste0("../Data/Proj/Active/", filename)
  } else {
    outfile <- paste0("../Data/Proj/Inactive/", filename)
  }

  # If the file already exists move on to the next
  if(file.exists(outfile)) {
    next
  }

  # Space the downloads
  Sys.sleep(2)

  # Get the project data
  # Send the request to the URL specified
  resp <- GET(purl,
              config = list(
                              accept("application/vnd.rcuk.gtr.xml-v7"),
                              user_agent("httr GtR client 0.1.")
                            )
              )

  # Check for errors in the response.
  if (http_error(resp)) {
    stop(
      sprintf(
        "GtR API request failed [%s].\nURL: %s.\n",
        status_code(resp),
        resp$url
      ),
      call. = FALSE
    )
  }

  #try(pdat <- fromJSON(purl, simplifyVector = TRUE))
  # Extract the content of the response
  pdat <- jsonlite::fromJSON(content(resp, as = "text"),
                             simplifyVector = TRUE)

  # Check we have data, if not go to the next project
  if (is.null(pdat)){
    next
  }

  # count that a new project downloaded
  newproject <-  newproject + 1

  # Write to file
  write(toJSON(pdat), outfile)

}

# Print a message about the new projects downloaded
message("Data for ", newproject, " new projects were downloaded.")
