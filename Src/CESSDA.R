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
purls <- tibble(url = NA, originator = NA)

# Loop over the members and create a list of the member sites
for(about in mbr_pages){

  # Create the member url from the CESSDA path info
  murl <- paste0(wwwroot, about)

  # Read the page pointed to by the URL
  p <- read_html(murl)

  # Extract the partner URL for their website
  purl <- p %>% html_elements("div.content-body") %>% html_element("a") %>% html_attr("href")

  # If the url is not an NA add to the tibble
  if(!is.na(purl)){
    purls <- add_row(purls, url = purl, originator = murl)
  }
}

# Remove any NAs
purls <-  purls %>% filter(!is.na(url) | !is.na(originator))

# write the results to a csv file
write_csv(purls,"../Data/CESSDA.csv")
