#/usr/bin/env Rscript
#
# Process local version of the data (json files).
#


# Set-up -------------------------------------------------------------------

library(jsonlite)
library(tibble)
library(dplyr)
library(readr)

# Load data ---------------------------------------------------------------

# Active project files
active_projs <- list.files(path = "../Data/Proj/Active", pattern = "*.json",
                           recursive = TRUE)

# Prepend the path
active_projs <- paste0("../Data/Proj/Active/",active_projs)

# Inactive project files
inactive_projs <- list.files(path = "../Data/Proj/Inactive", pattern = "*.json",
                           recursive = TRUE)

# Prepend the path
inactive_projs <- paste0("../Data/Proj/Inactive/",inactive_projs)


# Software and Technical Product Outputs ----------------------------------

# Count the number of software outputs
count <- 1

# Storage to collect software outputs
#softout <- list()
softout <-  NULL

# Columns that can appear in a software output df
softcols <- c("id", "outcomeId", "title", "description", "type", "impact",
              "url", "openSourceLicense", "yearFirstProvided")

# Combine active and inactive projects
projects <- c(active_projs, inactive_projs)

# Loop round active projects
for (file in projects) {

  # Read the json
  jsondat <-  read_json(file, simplifyVector = TRUE)

  # Get the project status (Active/Inactive)
  status <- pdat$projectOverview$projectComposition$project$status

  # Get the grant reference
  grantRef <- pdat$projectOverview$projectComposition$project$grantReference

  # Output section of the json
  output <- jsondat$projectOverview$projectComposition$project$output

  # Check for software outputs
  if (length(output$softwareAndTechnicalProductOutput) > 0){

    # Copy of the data frame
    df <- output$softwareAndTechnicalProductOutput

    # Convert all columns to character, other get type issues in the next line
    df <- df %>% mutate(across(everything(), as.character))

    # Add any missing columns if they are not there and populate with "-"s
    # otherwise not possible to combine data frames.
    df[softcols[!(softcols %in% names(df))]] <- rep("-", nrow(df))

    # Add the project status and grant reference to the data frame
    df$status <- rep(status, nrow(df))
    df$grntReference <- rep(grantRef, nrow(df))

    # Store the data frame
    if (is.null(softout)) {
      softout <- df
    } else {
      softout <- add_row(softout, df)
    }
    #message("File has software outputs ",file)
    # softout[[count]] <- output$softwareAndTechnicalProductOutput
    count <-  count + 1
  }

}

message(count," software outputs out of ",length(projects),
        " projects.")

# Write data to file
write_csv(softout, "../Data/softwareoutputs.csv")
