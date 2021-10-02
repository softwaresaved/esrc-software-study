#!/usr/bin/env Rscript
#
# Code Written for the Software Sustainability Institute.
# Copyright 2021 The University of Edinburgh
#
# Author: Mario Antonioletti
#
# Code is made available under a BSD-2 License.
#
# Get a list of the ESRC Doctoral Training Partnerships (DTPs).
#


# Load packages -----------------------------------------------------------

library(rvest)
library(xml2)
library(dplyr)
library(readr)

# Get the data ------------------------------------------------------------

# Where the data is stored
dtp_url <- paste0("https://esrc.ukri.org/skills-and-careers/doctoral-training/",
                 "doctoral-training-partnerships/",
                 "doctoral-training-partnership-dtp-contacts/")

# Read the page
page <- read_html(dtp_url)

# Extract the table
table <- page %>%
         html_table()

# Extract the table data frame from the list
table <- table[[1]]

# Rename columns
names(table) <- c("DTP","Orgs")

# Get rid of additional newlines and non-breaking space
# Manipulate rows to do the manipulation of the data
# library(stringi)
# stri_escape_unicode(table$DTP[12]) # View invisible characters

table$DTP <-  gsub("\u00A0+"," ", table$DTP) # Substitute non-breaking spaces with normal ones
table$DTP <-  gsub("\\n ","", table$DTP)  # Multiple newlines to one
# Add a lead to single institutions - to split the data
table$Orgs <-  gsub("University of Cambridge","University of Cambridge (lead)", table$Orgs)
table$Orgs <-  gsub("London School of Economics & Political Science",
                    "London School of Economics & Political Science (lead)", table$Orgs)
# Get rid of some repeated text
table$DTP <-  gsub("\nUCL, SOAS, UEL, Birkbeck & LSHTM enquiries:","", table$DTP)

# Split the data into more appropriate columns
table <- table %>%
         separate(col = Orgs, into = c("Lead_Org","Associated_Orgs"),
                  sep="\\(lead\\)", extra = "merge") %>%
         separate(col = DTP,
                  into = c("DTP","Director","Enquiries"),
                  sep="\n", extra = "merge")

# Remove the Director tag and Enquieries
table$Director <- gsub("Director: ", "", table$Director)
table$Enquiries <- gsub("Enquiries: ", "", table$Enquiries)

# Separate associated orgs with a semi-colon
table$Associated_Orgs <- gsub("^\\n","", table$Associated_Orgs)
table$Associated_Orgs <- gsub("\\n","; ", table$Associated_Orgs)

# Make sure the Saving directory
if(!dir.exists("../Data")){
  stop("Data directory does not exist. Make sure you set the working directory ",
       "to where this file lives.")
}

# Save the files
write_csv(table, file = "../Data/DTPs.csv")
