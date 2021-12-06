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

# Loop round projects
for (file in projects) {

  # Read the json
  jsondat <-  read_json(file, simplifyVector = TRUE)

  # Get the project status (Active/Inactive)
  status <- jsondat$projectOverview$projectComposition$project$status

  # Get the grant reference
  grantRef <- jsondat$projectOverview$projectComposition$project$grantReference

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
    df$grantReference <- rep(grantRef, nrow(df))

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

# Print diagnostic message
message(count," software outputs out of ",length(projects),
        " projects.")

# Write data to file
write_csv(softout, "../Data/softwareoutputs.csv")

# Research database and model outputs --------------------------------------

# Count the number of outputs
count <- 1

# Storage to collect data outputs
#dataout <- list()
dataout <-  NULL

# Columns that can appear in a software output df
datacols <- c("id", "outcomeId", "title", "description", "type", "impact",
              "url", "providedToOthers", "yearFirstProvided")

# Combine active and inactive projects
projects <- c(active_projs, inactive_projs)
#projects <- c(active_projs)

# Loop round active projects
for (file in projects) {

  # Read the json
  jsondat <-  read_json(file, simplifyVector = TRUE)

  # Get the project status (Active/Inactive)
  status <- jsondat$projectOverview$projectComposition$project$status

  # Get the grant reference
  grantRef <- jsondat$projectOverview$projectComposition$project$grantReference

  # Output section of the json
  output <- jsondat$projectOverview$projectComposition$project$output

  # Check for software outputs
  if (length(output$researchDatabaseAndModelOutput) > 0){

    # Copy of the data frame
    df <- output$researchDatabaseAndModelOutput

    # Convert all columns to character, other get type issues in the next line
    df <- df %>% mutate(across(everything(), as.character))

    # Add any missing columns if they are not there and populate with "-"s
    # otherwise not possible to combine data frames.
    df[datacols[!(datacols %in% names(df))]] <- rep("-", nrow(df))

    # Add the project status and grant reference to the data frame
    df$status <- rep(status, nrow(df))
    df$grantReference <- rep(grantRef, nrow(df))

    # Store the data frame
    if (is.null(dataout)) {
      dataout <- df
    } else {
      dataout <- add_row(dataout, df)
    }
    #message("File has software outputs ",file)
    #dataout[[count]] <- output$researchDatabaseAndModelOutput
    count <-  count + 1
  }

}

# Print diagnostic message
message(count," data outputs out of ",length(projects),
        " projects.")

# Write data to file
write_csv(dataout, "../Data/dataoutputs.csv")

# Research Topic and Subject ----------------------------------------------

# Collect classification of topics and research project for each project

# Columns that can appear in a software output data frame
cols <- c("id", "text", "percentage","encodedText")

# Combine active and inactive projects
projects <- c(active_projs, inactive_projs)

# Data frames to store content
subjectdf <- NULL
topicdf <- NULL

# count the number of subjects/topics
subject_count <- 0
topic_count <- 0

# Loop round active projects
for (file in projects) {

  # Read the json
  jsondat <-  read_json(file, simplifyVector = TRUE)

  # Pointer to project content
  project <- jsondat$projectOverview$projectComposition$project

  # Get the project status (Active/Inactive)
  status <- project$status

  # Get the grant reference
  grantRef <- project$grantReference

  # Grant category (Studentships do not appear to have outputs populated)
  grantCategory <- project$grantCategory

  # Get the project category
  subject <- project$researchSubject

  if (!is.null(subject) & length(subject) > 0) {

    # Convert content into characters
    subject <- subject %>% mutate(across(everything(), as.character))

    # Fill any missing columns
    subject[cols[!(cols %in% names(subject))]] <- rep("-", nrow(subject))

    # Add some additional columns
    subject$status <- rep(status, nrow(subject))
    subject$grantReference <- rep(grantRef, nrow(subject))
    subject$grantCategory <- rep(grantCategory, nrow(subject))

    # Store the content
    if (is.null(subjectdf)) {
      subjectdf <-  subject
    } else {
      subjectdf <- add_row(subjectdf, subject)
    }
    subject_count <- subject_count + 1
  }

  # Grab the topic
  topic <- project$researchTopic

  if (!is.null(topic) & length(topic) > 0) {

    # Convert content into characters
    topic <- topic %>% mutate(across(everything(), as.character))

    # Fill any missing columns
    topic[cols[!(cols %in% names(topic))]] <- rep("-", nrow(topic))

    # Add some additional columns
    topic$status <- rep(status, nrow(topic))
    topic$grantReference <- rep(grantRef, nrow(topic))
    topic$grantCategory <- rep(grantCategory, nrow(topic))

    # Store the content
    if (is.null(topicdf)) {
      topicdf <-  topic
    } else {
      topicdf <- add_row(topicdf, topic)
    }

    topic_count <- topic_count + 1

  }
}

# Print diagnostic messages
message(subject_count," data subjects out of ",length(projects),
        " projects.")
message(topic_count," data topics out of ",length(projects),
        " projects.")

# Save the data
# Write data to file
write_csv(subjectdf, "../Data/subjects.csv")
write_csv(topicdf, "../Data/topics.csv")
