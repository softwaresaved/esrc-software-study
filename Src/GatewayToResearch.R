#!/usr/bin/env Rscript
#
# Code Written for the Software Sustainability Institute.
# Copyright 2021 The University of Edinburgh
#
# Author: Mario Antonioletti
#
# Code is made available under a BSD-2 License.
#
# Interact with the UK Gateway to Research (https://gtr.ukri.org/)
#
# API Info: https://gtr.ukri.org/resources/api.html
# Data dictionary: https://gtr.ukri.org/resources/GtRDataDictionary.pdf

library(httr)
library(jsonlite)
library(xml2)

# Following: https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html
GtR_api <- function(path){

  # Prepend the to the URL path
  path <-  paste0("/gtr/api/",path)

  # Construct the URL
  myurl <- modify_url("https://gtr.ukri.org", path = path)

  # Get the contents
  resp <- GET(myurl)

  message("Payload ", http_type(resp))

  # Extract the content
  if (http_type(resp) == "application/json") { # Check we have JSON

    # Extract the JSON payload
    message("JSON payload")
    parsed <- jsonlite::fromJSON(content(resp, as = "text"), simplifyVector = TRUE)

  } else if (http_type(resp) == "text/html") {

    message("HTML payload")
    parsed <- xml2::read_html(content(resp, as = "raw"))

  } else if(http_type(resp) == "text/xml") {

    message("XML payload")
    parsed <- xml2::read_xml(content(resp, as = "raw"))

  } else {
    stop("API did not return json, html or xml.", call. = FALSE)
  }

  # Construct a structure output
  structure(
    list(
      content = parsed,
      path = path,
      response = resp
    ),
    class = "GtR_api"
  )
}

# Print content as a response
print.GtR_api <- function(x, ...) {
  cat("<GtR ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}

r <- GtR_api("examples")


print(r)
