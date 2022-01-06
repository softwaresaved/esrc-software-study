#/usr/bin/env Rscript
#
# A playground to look at data downloaded from the Gateway to Research.
#
# GtR data dictionary:
#
#    https://gtr.ukri.org/resources/GtRDataDictionary.pdf
#

# Load required packages -------------------------------------------------------

# Load packages to be used
library(readr)
library(lubridate)
library(dplyr)
library(ggplot2)
library(stringr)
library(rvest)
library(xml2)
library(fmsb) # radar/spider charts (https://www.datanovia.com/en/blog/beautiful-radar-chart-in-r-using-fmsb-and-ggplot-packages/)

# Read the data -----------------------------------------------------------

# Columns to read
input_cols <- cols(
  FundingOrgName = col_character(),
  ProjectReference = col_character(),
  LeadROName = col_character(),
  Department = col_character(),
  ProjectCategory = col_character(),
  PISurname = col_character(),
  PIFirstName = col_character(),
  PIOtherNames = col_character(),
  `PI ORCID iD` = col_character(),
  StudentSurname = col_character(),
  StudentFirstName = col_character(),
  StudentOtherNames = col_character(),
  `Student ORCID iD` = col_character(),
  Title = col_character(),
  StartDate = col_date(format="%d/%m/%Y"),
  EndDate = col_date(format="%d/%m/%Y"),
  AwardPounds = col_double(),
  ExpenditurePounds = col_double(),
  Region = col_character(),
  Status = col_character(),
  GTRProjectUrl = col_character(),
  ProjectId = col_character(),
  FundingOrgId = col_character(),
  LeadROId = col_character(),
  PIId = col_character()
)

# Read the Gateway to Research data
# Data snapshot from 30th of September 2021.
# gtrdat <- read_csv("../Data/projectsearch-1636377694679.csv.gz",
#                    col_types = input_cols)
# Data snapshot from 28th October 2021.
# gtrdat <- read_csv("../Data/projectsearch-1633957153275.csv.gz",
#                    col_types = input_cols)
# Data snapshot from 23rd November 2021.
gtrdat <- read_csv("../Data/projectsearch-1639238843837.csv.gz",
                   col_types = input_cols)

# Explore the data --------------------------------------------------------


# Number of rows
nrow(gtrdat) # 121,119

# Period covered by the data
min(gtrdat$StartDate)             # 1973-01-01
max(gtrdat$StartDate)             # 2022-09-26
sum(is.na(gtrdat$EndDate))        # Number of NAs in the end date - 203
min(gtrdat$EndDate, na.rm = TRUE) # 2004-08-31
max(gtrdat$EndDate, na.rm = TRUE) # 3202-10-31 !!! Typo?

# identify the problem project, sent a cheeky email to the GtR folks on 12/12/21.
# It is not their responsibility to fix this data. It would have to be followed
# up with the appropriate dep through Je-s (https://je-s.rcuk.ac.uk/).
gtrdat[!is.na(gtrdat$EndDate) &
         gtrdat$EndDate == max(gtrdat$EndDate, na.rm = TRUE),
       c("GTRProjectUrl","EndDate")]

# More on project end dates problems
gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) > 2050,
       c("GTRProjectUrl","EndDate")]
gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) < 2050 & year(gtrdat$EndDate) > 2035,
       c("GTRProjectUrl","EndDate")]
sum(!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) > 2035, na.rm = TRUE) # 51
sum(is.na(gtrdat$EndDate)) # 250

# End dates beyond 2035
# "2050-03-31" "2121-10-08" "3202-10-31" "2121-03-31" "3023-03-31"
unique(gtrdat[["EndDate"]][!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) > 2035])

# How many? 51
length(gtrdat[["EndDate"]][!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) > 2035])

# Do the 2050 end dates make sense? No
gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) == 2050,
       c("FundingOrgName","ProjectCategory","AwardPounds")] # [year(gtrdat$EndDate) == 2050]
gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) == 2050,"FundingOrgName"]

# How many funding org names are missing? 0
sum(is.na(gtrdat$FundingOrgName))
sum(is.na(gtrdat[["FundingOrgName"]])) # 0

# Find unique project categories
unique(gtrdat$ProjectCategory)
length(unique(gtrdat$ProjectCategory))

# Count the different categories
gtrdat %>%  select(ProjectCategory)     %>%
            group_by(ProjectCategory)   %>%
            tally()                     %>%
            arrange(desc(n))

## Clean the data ----------------------------------------------------------

# Remove EndDate >= 2050 or is an NAs - removes 25 values, for
gtrdat <- gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) < 2050,]

# Problem data
gtrdat[!is.na(gtrdat$EndDate) & year(gtrdat$EndDate) > 2050,]

# Look at the ESRC data ---------------------------------------------------

# Filter ESRC data - changes for different data snapshots
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC")

# Find out how many rows
nrow(esrcdat)

## ESRC Project categories -------------------------------------------------


# Look at the project categories
esrcdat %>% select(ProjectCategory, AwardPounds)                   %>%
            group_by(ProjectCategory)                              %>%
            summarise(Number = n(), TotalAward = sum(AwardPounds)) %>%
            mutate(AverageAward = TotalAward/Number)               %>%
            arrange(desc(AverageAward))


## Subjects and Topics -----------------------------------------------------


### Subjects ----------------------------------------------------------------


# Define subject column types
columns <- cols(
  id = col_character(),
  text = col_character(),
  percentage = col_double(),
  encodedText = col_character(),
  status = col_character(),
  grantReference = col_character(),
  grantCategory = col_character()
)

# read in the subject data
subjects <- read_csv(file = "../Data/subjects.csv", col_types = columns)

# Grant categories - no studentships
unique(subjects$grantCategory) # "Research Grant", "Fellowship", "Training Grant"

# Number of unique subjects
length(unique(subjects$text)) # 70

# Number of unique active subjects
nrow(unique(subjects[subjects$status == "Active", "text"])) # 63

# Enumerate subjects for active projects
subjects %>% filter(status == "Active") %>%
             select(text)               %>%
             group_by(text)             %>%
             tally()                    %>%
             arrange(desc(n))

# decode subject
subjects$decodedText <- gsub("\\+", " ", URLdecode(subjects$encodedText))

# Show the unique subjects
unique(subjects$decodedText)  # 70 of them

# percentages
subjects$percentage[subjects$percentage > 0]
length(subjects$percentage[subjects$percentage > 0]) # Only 7 entries > 0

# Join with the original data
esrc_subjects <- esrcdat %>%
                 left_join(subjects, by = c("ProjectReference" = "grantReference")) %>%
                 select( -percentage, -status, -grantCategory)

# Categories to use
categories <- c("Area Studies",
                "Demography",
                "Development studies",
                "Economics",
                "Education",
                "Environmental planning",
                "History",
                "Human Geography",
                "Law & legal studies",
                "Linguistics",
                "Management & business studies",
                "Political science. & international studies",
                "Psychology",
                "Science and Technology Studies",
                "Social anthropology",
                "Social policy",
                "Social work",
                "Sociology",
                "Tools, technologies & methods",
                "Other")

# is the decoded text the same as the text?
nrow(esrc_subjects) # 20019
sum(esrc_subjects$text == esrc_subjects$decodedText, na.rm = TRUE) # 15819
sum(is.na(esrc_subjects$text)) # 4200
sum(is.na(esrc_subjects$decodedText)) # 4200

# check if there are differences in the values between the text column and the
# decodedText column.
for (i in seq_len(nrow(esrc_subjects))) {
  if(!is.na(esrc_subjects$text[i]) & !is.na(esrc_subjects$decodedText[i]) &
     esrc_subjects$text[i] != esrc_subjects$decodedText[i]){
    message("Different ", esrc_subjects$text[i], " vs ",
            esrc_subjects$decodedText[i])
  }
}


# Create new column
esrc_subjects$category <- rep("-",nrow(esrc_subjects))

# Set an uncategorised label
esrc_subjects$category[is.na(esrc_subjects$text)] <- "Uncategorised"

# Need to reduce the following 71 categories to the above 21 categories
# including "Other" and "Uncategorised:
#
# Management & Business Studies, Development studies, RCUK Programmes,
# Social Policy, Climate & Climate Change, Education, Human Geography, NA,
# Genetics & development, Psychology, Social Work, Environmental planning,
# Sociology, Media, Science and Technology Studies,
# "Tools, technologies & methods", Pol. sci. & internat. studies,
# Law & legal studies, "Ecol, biodivers. & systematics",
# Civil eng. & built environment, Social Anthropology, Economics,
# Info. & commun. Technol., Languages & Literature, Linguistics,
# Medical & health interface, History, Visual arts, Demography, Design,
# Demography & human geography, Complexity Science,
# "Pollution, waste & resources", Terrest. & freshwater environ.,
# Agri-environmental science, Food science & nutrition,
# Environmental Engineering, Manufacturing, Drama & theatre studies,
# Area Studies, Cultural & museum studies, Philosophy, Animal Science, Energy,
# Mathematical sciences, Archaeology, Music, "Theology, divinity & religion"
# Library & information studies, Astronomy - observation, Astronomy - theory,
# Particle Astrophysics, Bioengineering, Cell biology, Process engineering,
# Omic sciences & technologies, Systems engineering, Marine environments,
# Atmospheric phys. & chemistry, Plant & crop science, Electrical Engineering,
# Dance, Chemical measurement, Geosciences, Microbial sciences,
# Mechanical Engineering, Classics, Catalysis & surfaces, Materials sciences,
# Instrument. sensor & detectors, Materials Processing


# Function to select the right entries and reduce typing
sel <- function(parseString){
  return(grepl(parseString, esrc_subjects$text, ignore.case = TRUE))
}

# assign the categories based on the subjects
esrc_subjects$category[sel("area")] <- "Area Studies"
# This also takes Demography and human geography, the latter being another category
esrc_subjects$category[sel("^demography")] <- "Demography"
esrc_subjects$category[sel("^development")] <- "Development studies"
esrc_subjects$category[sel("economics")] <- "Economics"
esrc_subjects$category[sel("education")] <-  "Education"
esrc_subjects$category[sel("planning")] <- "Environmental planning"
esrc_subjects$category[sel("history")] <- "History"
esrc_subjects$category[sel("^human geography")] <- "Human Geography"
esrc_subjects$category[sel("law")] <- "Law & legal studies"
esrc_subjects$category[sel("languages|linguistics")] <- "Linguistics"
esrc_subjects$category[sel("management")] <- "Management & business studies"
esrc_subjects$category[sel("pol\\.")] <- "Political science. & international studies"
esrc_subjects$category[sel("psychology")] <- "Psychology"
esrc_subjects$category[sel("^science")] <- "Science and Technology Studies"
esrc_subjects$category[sel("anthropology")] <- "Social anthropology"
esrc_subjects$category[sel("policy")] <- "Social policy"
esrc_subjects$category[sel("work")] <- "Social work"
esrc_subjects$category[sel("sociology")] <- "Sociology"
esrc_subjects$category[sel("tools|instrument|measurement")] <- "Tools, technologies & methods"
# Things that do not seem to fit any of the above categories
esrc_subjects$category[sel(paste0("rcuk|astro|dance|music|gene|museum|",
                                  "theology|science(s)?$|engineering$|drama|",
                                  "philo|arch|^omic|bio|info|class|",
                                  "atmos|design|vis|med|^cat|mar|ener|",
                                  "manu|materi|clim|poll|terr|civ|food")
                           )] <- "Other"

# Check all have been assigned
if(any(esrc_subjects$category == "-")) {
  warning("There are some unassigned categories: ",
          unique(esrc_subjects$text[is.na(esrc_subjects$category)]))
}

unique(esrc_subjects$text[sel("^demography")])

### Topics ----------------------------------------------------------------

# Define the topic column types
topics_cols <- cols(
  id = col_character(),
  text = col_character(),
  encodedText = col_character(),
  percentage = col_character(),
  status = col_character(),
  grantReference = col_character(),
  grantCategory = col_character()
)

# Read the data
topics <- read_csv(file = "../Data/topics.csv", col_types = topics_cols)

# Grant categories - "Studentship" "Research Grant" "Training Grant" "Fellowship"
unique(topics$grantCategory)

# Number of topics
length(unique(topics$text)) # 396

# Number of topics for active projects
nrow(unique(topics[topics$status == "Active","text"])) # 328

# Top topics
topics %>%  filter(status == "Active") %>%
            select(text)               %>%
            group_by(text)             %>%
            tally()                    %>%
            arrange(desc(n)) -> topicsN

# Encoded topics
unique(topics$encodedText)

# Create a new column
topics$decodedText <- gsub("\\+", " ", URLdecode(topics$encodedText))

# Unique values
unique(topics$decodedText) # 394

## Data and Software Outputs -----------------------------------------------

# Read the software outputs data
softouts_cols = cols(
  id = col_character(),
  outcomeId = col_character(),
  title = col_character(),
  description = col_character(),
  type = col_character(),
  impact = col_character(),
  openSourceLicense = col_character(),
  yearFirstProvided = col_double(),
  url = col_character(),
  status = col_character(),
  grantReference = col_character()
)
softouts <- read_csv(file = "../Data/softwareoutputs.csv",
                     col_types = softouts_cols)

# Read the data outputs data
dataouts_cols <- cols(
  id = col_character(),
  outcomeId = col_character(),
  title = col_character(),
  description = col_character(),
  type = col_character(),
  impact = col_character(),
  providedToOthers = col_logical(),
  yearFirstProvided = col_character(),
  url = col_character(),
  status = col_character(),
  grantReference = col_character()
)
dataouts <- read_csv(file = "../Data/dataoutputs.csv",
                     col_types = dataouts_cols)
