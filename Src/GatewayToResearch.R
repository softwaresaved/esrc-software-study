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
#
#   * v1 doc: https://gtr.ukri.org/resources/GtR-1-API-v3.3.pdf
#   * v2 doc: https://gtr.ukri.org/resources/GtR-2-API-v1.7.5.pdf
#
# Data dictionary: https://gtr.ukri.org/resources/GtRDataDictionary.pdf
#


# Load packages -----------------------------------------------------------


library(httr)
library(jsonlite)
library(xml2)

# Do not use scientific notation
options(scipen=999)

# Request function --------------------------------------------------------


# Following: https://cran.r-project.org/web/packages/httr/vignettes/api-packages.html

# A generic function to query the GtR API v2 - pass in:
#
#  * path  - the path part of the query.
#  * out   - the output format can be "json" or "xml", defaults to json.
#  * version - version of the api. Can only be  "v1" or "v2".
#  * debug - boolean specifying whether to print out debug statements,
#           defaults to FALSE.
#
# A structure is returned with the parsed contents, the path query and
# the response.
GtR_api <- function(path, out = "json", version = "v2", debug = FALSE){

  # Deal with different versions of the api
  if(version == "v2"){
    # Prepend the to the URL path
    path <-  paste0("/gtr/api/", path)
  }else if ( version == "v1"){
    # Nothing for now
  } else {
    stop("Version can only be \"v1\" or \"v2\". You specified ", version, ".")
  }



  # Construct the URL
  myurl <- modify_url("https://gtr.ukri.org", path = path)

  # If debugging print out the query URL.
  if(debug){
    message("Query URL ", myurl,".")
  }

  # Set the required output format
  if ( out == "json"){
    accept <- "application/vnd.rcuk.gtr.json-v7"
  } else if(out == "xml"){
    accept <- "application/vnd.rcuk.gtr.xml-v7"
  }else {
    stop("Unknown accept format: \"", out, "\", value should on be ",
         "\"json\" or \"xml\".")
  }

  # Send the request to the URL specified
  resp <- GET(myurl,
              config = list(
                            accept(accept),
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

  # Get the response type.
  resp_type <- http_type(resp)

  # Extract the content.
  if ( resp_type == "application/json" |
       resp_type == "application/vnd.rcuk.gtr.json-v7") { # Check we have JSON

    # Extract the JSON payload
    if(debug){
      message("JSON payload: ", resp_type,".")
    }

    parsed <- jsonlite::fromJSON(content(resp, as = "text"),
                                 simplifyVector = TRUE)

  } else if (resp_type == "text/html" |
             resp_type == "application/vnd.rcuk.gtr.xml-v7") {

    if(debug){
      message("HTML payload: ", resp_type,".")
    }

    parsed <- xml2::read_html(content(resp, as = "auto"))

  } else if(resp_type == "text/xml") {

    if(debug){
      message("XML payload: ", resp_type, ".")
    }

    parsed <- xml2::read_xml(content(resp, as = "auto"))

  } else {
    message("Got ", resp_type)
    stop("API did not return json, html or xml.", call. = FALSE)
  }

  # Construct a structure output.
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

# Retrieve the example contents
r <- GtR_api("examples", debug = TRUE)

# Retrieve information about funds
r2 <- GtR_api("funds", out = "xml", version="v2", debug = TRUE)

funds <- r2$content$fund

funds$start <- as.POSIXct(funds$start/1000, origin = "1970-01-01", tz = "GMT")
funds$end <- as.POSIXct(funds$end/1000, origin = "1970-01-01", tz = "GMT")
funds$created <- as.POSIXct(funds$created/1000, origin = "1970-01-01", tz = "GMT")

View(funds)
View(r2)
print(r)

# Try a v1 type query
# http://gtr.ukri.org/search/person?term=paul&amp;page=1&amp;fetchSize=25
r3 <- GtR_api("search/person?term=paul&amp;page=1&amp;fetchSize=25",
              version = "v1", debug = TRUE)
View(r3)
