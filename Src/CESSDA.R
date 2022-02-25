#!/usr/bin/env Rscript
#
# URL to get the CESSDA partner web sites.
#

library(rvest)
library(dplyr)
library(tibble)
library(readr)

# The root page of the web site
wwwroot <- "https://www.cessda.eu"

# Base about CESSDA  page
aboutCessda <- paste0(wwwroot, "/About/Consortium")

# Get the page with the members
mbrs <- read_html(aboutCessda)

# Get links to the
mbrs %>% html_elements("p.title") %>% html_element("a") %>% html_attr("href") -> mbr_pages

# Tibble to store partner URLs
purls <- tibble(u = NA, o = NA)

# Loop over the members and create a list of the member sites
for(about in mbr_pages){

  # Create the member url in CESSDA
  murl <- paste0(wwwroot, about)

  # Read the page
  p <- read_html(murl)

  # Extract the partner URL
  purl <- p %>% html_elements("div.content-body") %>% html_element("a") %>% html_attr("href")

  # If not NA save
  if(!is.na(purl)){
    purls <- add_row(purls, u = purl, o = murl)
  }
}

# write the results to a csv file
write_csv(purls,"../Data/CESSDA.csv")
