#!/usr/bin/env Rscript
#
# Code Written for the Software Sustainability Institute.
# Copyright 2021 The University of Edinburgh
#
# Author: Mario Antonioletti
#
# Code is made available under a BSD-2 License.
#
# Interact with the UK Gateway to Research (GtR) (https://gtr.ukri.org/)
#
# Data from GtR is made available under an Open Government Licence
# (https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
#
# API Info: https://gtr.ukri.org/resources/api.html
# Data dictionary: https://gtr.ukri.org/resources/GtRDataDictionary.pdf
#


# Load packages -----------------------------------------------------------


library(httr)
library(jsonlite)
library(xml2)


# Request function --------------------------------------------------------


# Following: https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html

# A generic function to query the gtr interface - pass in the path.
# A structure is returned with the parsed contents, the path query and
# the response.
GtR_api <- function(path, debug = FALSE){

  # Prepend the to the URL path
  path <-  paste0("/gtr/api/", path)

  # Construct the URL
  myurl <- modify_url("https://gtr.ukri.org", path = path)

  if(debug){
    message("Query URL ", myurl,".")
  }

  # Get the contents
  # Accept request required by the API either:
  # Accept: application/vnd.rcuk.gtr.json-v7
  # or
  # Accept: application/vnd.rcuk.gtr.xml-v7
  # Earlier versions are apparently also available. Up to v7 on 05/10/21.
  resp <- GET(myurl,
              accept("application/vnd.rcuk.gtr.json-v7")
              #accept("application/vnd.rcuk.gtr.xml-v7")
              )

  if(debug){
    message("Payload ", http_type(resp))
  }

  # Check for errors
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

  # Extract the content
  if (http_type(resp) == "application/json" |
      http_type(resp) == "application/vnd.rcuk.gtr.json-v7") { # Check we have JSON

    # Extract the JSON payload
    if(debug){
      message("JSON payload.")
    }

    parsed <- jsonlite::fromJSON(content(resp, as = "text"), simplifyVector = FALSE)

  } else if (http_type(resp) == "text/html" |
             http_type(resp) == "application/vnd.rcuk.gtr.xml-v7") {

    if(debug){
      message("HTML payload.")
    }

    parsed <- xml2::read_html(content(resp, as = "auto"))

  } else if(http_type(resp) == "text/xml") {

    if(debug){
      message("XML payload.")
    }

    parsed <- xml2::read_xml(content(resp, as = "auto"))

  } else {
    message("Got ",http_type(resp))
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

# Print responses ---------------------------------------------------------

# Print content as a response
print.GtR_api <- function(x, ...) {
  cat("<GtR ", x$path, ">\n", sep = "")
  str(x$content)
  invisible(x)
}

# Perform queries ---------------------------------------------------------

# Error
rr <-  GtR_api("example")

# Retrieve the example contents
r <- GtR_api("examples")

r2 <- GtR_api("funds", debug = TRUE)

r3 <- fromJSON("https://gtr.ukri.org/gtr/api/funds")

r2$response$content
r2$response$parsed
funds <- r2$content$fund
View(funds)

print(r)
