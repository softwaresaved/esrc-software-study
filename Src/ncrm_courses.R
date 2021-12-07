#/usr/bin/env Rscript
#
# Get a list of National Centre for Research Method (NCRM) courses.
#

library(rvest)
library(dplyr)

courses <- NULL

# Loop round the existing courses (currently list has 6 pages)
for (page in seq(1,6)) {

  page_url <- paste0("https://www.ncrm.ac.uk/training/index.php?page=", page)

  if (is.null(courses)) {
    courses <- dat %>% html_elements(".event") %>% html_text()
  } else {
    courses <- c(courses, dat %>% html_elements(".event") %>% html_text())
  }

}

# List unique courses
unique(courses)
