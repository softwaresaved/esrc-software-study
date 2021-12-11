#/usr/bin/env Rscript
#
# Get a list of National Centre for Research Method (NCRM) courses.
#

library(rvest)
library(dplyr)

# Variable for the courses
courses <- NULL

# Loop round the existing courses
for (page in seq(1,5)) {

  # Set the url
  page_url <- paste0("https://www.ncrm.ac.uk/training/index.php?page=", page)

  # Get the contents
  dat <- read_html(page_url)

  # Get the courses from the page
  newcourses <-  dat %>% html_elements(".event") %>% html_text()

  # Create or append content
  if (is.null(courses)) {
    courses <- newcourses
  } else {
    courses <- c(courses, newcourses)
  }

}

# List unique courses
sort(unique(courses))
