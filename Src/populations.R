#!/usr/bin/env Rscript
#
# Compare sample populations.
#


# Load libraries ----------------------------------------------------------

library(readxl)     # For reading excel
library(dplyr)      # For manipulating data
#library(tidyr)
library(readr)      # For reading data
library(lubridate)  # For manipulating data
library(ggplot2)    # For plots
library(kableExtra) # For wiki friendly plots
library(fmsb)       # For Spider/Radar diagrams
library(tibble)


# Gateway to Research (GtR) data ------------------------------------------

## Read GtR data -----------------------------------------------------------

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

# Read the Gateway to Research data snapshot.
# Data snapshot from 24th January 2022.
gtrdat <- read_csv("../Data/projectsearch-1643375201476.csv.gz",
                   col_types = input_cols)

# Filter out the ESRC data
esrcdat <- gtrdat %>% filter(FundingOrgName == "ESRC")

# Only take projects that started on or before 2016
esrcdat <- esrcdat %>% filter( year(StartDate) >= 2016)

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

## Read subjects -----------------------------------------------------------

# Define subject column types  to read from file
columns <- cols(
  id = col_character(),
  text = col_character(),
  percentage = col_double(),
  encodedText = col_character(),
  status = col_character(),
  grantReference = col_character(),
  grantCategory = col_character()
)

# Read in the subject data as used by the GtR
subjects <- read_csv(file = "../Data/subjects.csv", col_types = columns)

# Add a number of subjects assigned and a fraction contribution column to the data
subjects <- subjects                      %>%
  group_by(grantReference)                %>%
  mutate(Nsub = n())                      %>%
  mutate(fracContrib = round(1/Nsub, 3))  %>%
  rename(subject = text, encodedSubject = encodedText)

# Join with the esrc data
esrc_subjects <- esrcdat %>%
  left_join(subjects, by = c("ProjectReference" = "grantReference")) %>%
  select( -percentage, -status, -grantCategory)

# Provide values for Nsub (1) and the fracContrib (1) when there is no subject
esrc_subjects$Nsub[is.na(esrc_subjects$subject)] <- 1
esrc_subjects$fracContrib[is.na(esrc_subjects$subject)] <- 1


## Map subjects to categories ----------------------------------------------

# Subject to category mappings:
#
# * **Area Studies**: Area Studies
# * **Demography**: Demography, Demography & human geography
# * **Development studies**: Development studies
# * **Economics**: Economics
# * **Education**: Education
# * **Environmental planning**: Environmental planning
# * **History**: History
# * **Human Geography**: Human Geography
# * **Law & legal studies**: Law & legal studies
# * **Linguistics**: Linguistics, Languages & Literature
# * **Management & business studies**: Management & Business Studies
# * **Political science. & international studies**: Pol. sci. & internat. studies
# * **Psychology**: Psychology
# * **Science and Technology Studies**: Science and Technology Studies
# * **Social anthropology**: Social Anthropology
# * **Social policy**: Social Policy
# * **Social work**: Social Work
# * **Sociology**: Sociology
# * **Tools, technologies & methods**: "Tools, technologies & methods"
# * **Other**: RCUK Programmes, Genetics & development, Climate & Climate Change,
#              Media, "Ecol, biodivers. & systematics", Civil eng. & built environment,
#              Info. & commun. Technol., Medical & health interface,
#              Visual arts, Design, Complexity Science, "Pollution, waste & resources",
#              Terrest. & freshwater environ., Agri-environmental science,
#              Food science & nutrition, Environmental Engineering,
#              Manufacturing, Drama & theatre studies, Cultural & museum studies,
#              Philosophy, Animal Science, Energy, Mathematical sciences, Archaeology,
#              Music, "Theology, divinity & religion", Library & information studies,
#              Astronomy - observation, Astronomy - theory,
#              Particle Astrophysics, Bioengineering, Cell biology, Process engineering,
#              Omic sciences & technologies, Systems engineering, Marine environments,
#              Atmospheric phys. & chemistry, Plant & crop science, Electrical Engineering,
#              Dance, Chemical measurement, Geosciences, Microbial sciences,
#              Mechanical Engineering, Classics, Catalysis & surfaces, Materials sciences,
#              Instrument. sensor & detectors, Materials Processing
# * **Uncategorised**: NA

# Create a new category column
esrc_subjects$category <- rep("-",nrow(esrc_subjects))

# Set an uncategorised label
esrc_subjects$category[is.na(esrc_subjects$subject)] <- "Uncategorised"

# Function to select the right entries and reduce typing
sel <- function(parseString){
  return(grepl(parseString, esrc_subjects$subject, ignore.case = TRUE))
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
                                  "manu|materi|clim|poll|terr|civ|food"))] <- "Other"

# Check all have been assigned
if(any(esrc_subjects$category == "-")) {
  warning("There are some unassigned categories: ",
          unique(esrc_subjects$subject[is.na(esrc_subjects$category)]))
}


## Poulations of categories ------------------------------------------------


# Plot the contribution of each category by number
esrc_subjects %>% group_by(category)                    %>%
                  summarise(NGrants = n(), Contributions = sum(fracContrib),
                            Money = sum(AwardPounds), PIs=length(unique(PIId))) -> GtRpop

# Tabulate basic populations
GtRpop  %>% kable(format="pipe", align= rep("l", 5),
                       col.names = c("Category", "Number of awards","Contributions",
                        "Award (£)", "Unique PIs"))

## Radar plot ---------------------------------------------------------------

# Function from:
# https://www.datanovia.com/en/blog/beautiful-radar-chart-in-r-using-fmsb-and-ggplot-packages/
create_radarchart <- function(data, color = "#00AFBB",
                              vlabels = colnames(data), vlcex = 0.7,
                              caxislabels = NULL, title = NULL, ...){
  radarchart(
    data, axistype = 1,
    # Customize the polygon
    pcol = color, pfcol = scales::alpha(color, 0.5), plwd = 2, plty = 1,
    # Customize the grid
    cglcol = "grey", cglty = 1, cglwd = 0.8,
    # Customize the axis
    axislabcol = "grey",
    # Variable labels
    vlcex = vlcex, vlabels = vlabels,
    caxislabels = caxislabels, title = title, ...
  )
}

# Normalise populations
GtRpop %>% mutate(totGrants = sum(NGrants), totContrib = sum(Contributions),
                   totMoney = sum(Money), totPIs = sum(PIs)) %>%
           group_by(category) %>%
           summarise(normGrants = sum(NGrants)/totGrants,
                   normContribs = sum(Contributions)/totContrib,
                   normMoney = sum(Money)/totMoney,
                   normPIs = sum(PIs)/totPIs) -> normGtRpop

# Create a new row with the minimum and maximum for each column
#normGtRpop <- rbind(normGtRpop, c("Min", normGtRpop %>% summarise(across(2:ncol(normGtRpop), min)) %>% as.numeric()))
#normGtRpop <- rbind(normGtRpop, c("Max", normGtRpop %>% summarise(across(2:ncol(normGtRpop), max)) %>% as.numeric()))

normGtRpop <- add_row(normGtRpop,category = "Min", normGtRpop %>% summarise(across(2:ncol(normGtRpop), min)), .after = 0)
normGtRpop <- add_row(normGtRpop,category = "Max", normGtRpop %>% summarise(across(2:ncol(normGtRpop), max)), .after = 0)

normGtRpop <- as.data.frame(normGtRpop)
row.names(normGtRpop) <- normGtRpop$category
normGtRpop[c(1,2,3),-1]
create_radarchart(normGtRpop[c(1,2,3),-1])
labels <-  c("Grants","PIs","Money","FractionalContrib")
create_radarchart(normGtRpop[c(1,2,3),-1], title = normGtRpop$category[3])




normGtRpop[c(1,22,23),]

create_radarchart(normGtRpop[c(1,22,23),])

# Survey data --------------------------------------------------------

# Read survey data --------------------------------------------------------

# File containing the survey population distribution
xlfile <- "~/Downloads/results-for-a-digital-met-2022-02-22-1223.xlsx"

# Read the survey question data
sdata <- read_excel(xlfile)

# Rename the column data, originals:
#
# 19. Research Discipline: Level one codes from the Primary Research Areas covered by ESRC
# discipline funding remit. Use the 'Other' option if your discipline is not listed.
# (Please check all that apply.)
# 19.a. If you selected Other, please specify:
#
names(sdata) <-  c("Subjects","Other")

# Produce a unique id for each row
sdata$id <- seq(1, nrow(sdata))

# Replace NAs with None
sdata$Subjects[is.na(sdata$Subjects)] <- "None"

# Split csv in the Subject column
# " Tools, technologies & methods" is one choice
# Temporary remapping
sdata$Subjects <- gsub("Tools,", "Tools_", sdata$Subjects)

# Split csv subjects into separate rows, count number (N) of contributions by
# the same submitter, create a fractional contributin 1/N by each submitter.
sdata %>% select(id, Subjects)                             %>%
          mutate(singleSubjects = strsplit(Subjects, ",")) %>%
          unnest(singleSubjects)                           %>%
          mutate(Subject = trimws(singleSubjects))         %>%
          select(-Subjects, -singleSubjects)               %>%
          group_by(id)                                     %>%
          mutate(N = n())                                  %>%
          mutate(Contrib = round(1/N, 2)) -> subjectContributions

# Undo the temporary remapping
sdata$Subjects <- gsub("Tools_", "Tools,", sdata$Subjects)
subjectContributions$Subject <- gsub("Tools_", "Tools,", subjectContributions$Subject)

# Check for consistency
unique(subjectContributions$Subject[!(subjectContributions$Subject %in% categories)])
