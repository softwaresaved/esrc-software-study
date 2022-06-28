#!/usr/bin/env Rscript
#
# A playground to look at data downloaded from the Gateway to Research.
#
# GtR data dictionary:
#
#    https://gtr.ukri.org/resources/GtRDataDictionary.pdf
#

# Load required packages -------------------------------------------------------

# Load packages to be used
library(readr, quietly = TRUE)
library(tidyr)
library(lubridate, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)
library(ggplot2, quietly = TRUE)
library(stringr, warn.conflicts = FALSE)
library(rvest, warn.conflicts = FALSE)
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
# Data snapshot from 24th February 2022.
gtrdat <- read_csv("../Data/projectsearch-1646403729132.csv.gz",
                   col_types = input_cols)

# Explore the data --------------------------------------------------------
#
# The number in comments correspond to values returned for one of the GtR
# snapshots which may change from snapshot to snapshot.
#

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

# Find out how many rows (equivalent to projects)
nrow(esrcdat)
nrow(esrcdat[esrcdat$Status == "Active",])
nrow(esrcdat[esrcdat$Status == "Closed",])

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

# More than one subject may be assigned to a project so assign a fraction for
# each contribution (this may not reflect the reality of the situation where
# one of the subjects should dominate over the others but it is not possible to determine
# this from the raw data).
nrow(subjects[subjects$grantReference == "ES/H005536/1",]) # should be 3
subjects[subjects$grantReference == "ES/H005536/1",]

subjects %>% select(grantReference)         %>%
             group_by(grantReference)       %>%
             mutate(N = n())                %>%
             mutate(fracContrib = 1/N)

# Add a number of subjects assigned and a fraction contribution column to the data
subjects <- subjects                       %>%
            group_by(grantReference)       %>%
            mutate(Nsub = n())             %>%
            mutate(fracContrib = 1/N)

# decode subject
subjects$decodedText <- gsub("\\+", " ", URLdecode(subjects$encodedText))
any(subjects$text != subjects$decodedText) # Fields are equivalent

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
# also from: https://gtr.ukri.org/resources/classificationlists.html
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

# Look at subjects and topics combined
sub_top <- subjects %>%
           left_join(topics, by = c("grantReference"), suffix = c(".s", ".t"))

# There duplicates in the data
nrow(sub_top)

nrow(subjects)   # 15903
length(unique(subjects$grantReference)) # 7180

nrow(topics) # 23708
length(unique(topics$grantReference)) #11382


### Topics investigation ----

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

# Define topics column types  to read from file
columns <- cols(
  id = col_character(),
  text = col_character(),
  encodedText = col_character(),
  percentage = col_character(),
  status = col_character(),
  grantReference = col_character(),
  grantCategory = col_character()
)

# read in the topics data
topics <- read_csv(file = "../Data/topics.csv", col_types = columns)

# Add a number of topics assigned and a fraction contribution column to the data
topics <- topics                                  %>%
          group_by(grantReference)                %>%
          mutate(Nsub = n())                      %>%
          mutate(fracContrib = round(1/Nsub, 3))  %>%
          rename(topic = text, encodedTopic = encodedText)

# Plot topic distribution
topics %>% ggplot(aes(x = Nsub)) + geom_bar() + theme_bw()

# Join with the ESRC data
esrc_topics <- esrcdat %>%
               left_join(topics, by = c("ProjectReference" = "grantReference")) %>%
               select( -percentage, -status, -grantCategory)

# Provide values for Nsub (1) and the fracContrib (1) when there is no subject
esrc_topics$Nsub[is.na(esrc_topics$topic)] <- 1
esrc_topics$fracContrib[is.na(esrc_topics$topic)] <- 1

# Create new column
esrc_topics$category <- rep("-",nrow(esrc_topics))

# Set an uncategorised label
esrc_topics$category[is.na(esrc_topics$topic)] <- "Uncategorised"


# Function to select the right entries and reduce typing - only assign topics that have not been assigned yet
sel <- function(parseString){
  return(grepl(parseString, esrc_topics$topic, ignore.case = TRUE) &
         (esrc_topics$category == "-") )
}

# assign the categories based on the topics
esrc_topics$category[sel("area")] <- "Area Studies"
# This also takes Demography and human geography, the latter being another category
esrc_topics$category[sel("demography|popul|geront")] <- "Demography"
esrc_topics$category[sel("development studies|devel")] <- "Development studies"
esrc_topics$category[sel("economics|econo|employ|admin")] <- "Economics"
esrc_topics$category[sel("education")] <-  "Education"
esrc_topics$category[sel("environmental planning|environ|rural|ecology|wind|ocean|water|crop|animal|tox|weather|hydro|solar|carbon|lives|exper|plant|scale|waste|earth")] <- "Environmental planning"
esrc_topics$category[sel("history")] <- "History"
esrc_topics$category[sel("\\bgeography|urban|carto|spatial|geohaz")] <- "Human Geography"
esrc_topics$category[sel("law|crimin|legal|ethics")] <- "Law & legal studies"
esrc_topics$category[sel("languages|linguistics|phonetic|^language|lingui|epist|semant|lex|syntax|translation|morph")] <- "Linguistics"
esrc_topics$category[sel("management|business|r&d|finance|leader|entrep|industrial|organ")] <- "Management & business studies"
esrc_topics$category[sel("pol\\.")] <- "Political science. & international studies"
esrc_topics$category[sel("politic|international")] <- "Political science. & international studies"
esrc_topics$category[sel("america|africa|asiatic|european|middle|peace|colonial|conflict|war|religion|intern|elections|govern|rights")] <- "Political science. & international studies"
esrc_topics$category[sel("women")] <- "Political science. & international studies"
esrc_topics$category[sel("psychology|psych")] <- "Psychology"
esrc_topics$category[sel("^science")] <- "Science and Technology Studies"
esrc_topics$category[sel("anthropology|ethnic")] <- "Social anthropology"
esrc_topics$category[sel("policy")] <- "Social policy"
esrc_topics$category[sel("\\bwork")] <- "Social work"
esrc_topics$category[sel("sociology|social")] <- "Sociology"
esrc_topics$category[sel("tools|instrument|measurement|method|statistics|secur|ict|numerical|comput|math|intelli|emerg|robot")] <- "Tools, technologies & methods"
# Things that do not seem to fit any of the above categories
esrc_topics$category[sel(paste0("rcuk|astro|dance|music|gene|museum|art\\b|cultural|digital|compos|",
                                  "theology|science(s)?$|engineering$|drama|network|secular|acoust|aest|",
                                  "philo|arch|^omic|bio|info|class|child|sport|tourism|computing|arts|strat|innov|",
                                  "atmos|design|vis|med|^cat|mar|ener|health|sound|literature|immun|choreo|",
                                  "manu|materi|clim|poll|terr|civ|food|sex|disease|agric|survey|journa|project|",
                                  "photo|budd|surf|complex|micro|publish|celtic|genomic|writing|musc|cells|prot|",
                                  "drug|control|optical|theat|safe|faith|organelles|metabol|meteo|library|mineral|islam")
)] <- "Other"

unique(esrc_topics$topic[sel("strat")])

# Check all have been assigned
if(any(esrc_topics$category == "-")) {
  warning("There are some unassigned categories (",length(unique(esrc_topics$topic[esrc_topics$category == "-"])),") :",
          paste(unique(esrc_topics$topic[esrc_topics$category == "-"]), sep = ", "))
}

# Generate stats for the categories
esrc_topics %>% select(category, AwardPounds, fracContrib)        %>%
  group_by(category)                                              %>%
  summarise(Contribution = round(sum(fracContrib),1),
            Amount = sum(fracContrib*AwardPounds))                %>%
  mutate(totContrib = sum(Contribution), totAmount = sum(Amount)) %>%
  mutate(percContrib = round(Contribution/totContrib,2)*100,
         perAward = round(Amount/totAmount,2) * 100)              %>%

  select(-totContrib, -totAmount)                                 %>%
  relocate(percContrib, .after = Contribution)                    %>%
  relocate(perAward, .after = Amount)                             %>%
  mutate(across(where(is.numeric), ~ format(., big.mark = ",")))  %>%
  arrange(desc(Amount))                                           %>%
  kable(format="pipe", align= rep("l",5),
        col.names = c("Category", "Number of awards","Number %", "Award (£)",
                      "Award %"))

?## Data and Software Outputs -----------------------------------------------

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


# Funding across RCs ------------------------------------------------------

# Trying to do a cross table to see funding across RCs.
gtrdat %>% select(FundingOrgName, PIId, StartDate)           %>%
           filter(!is.na(PIId) & year(StartDate) >= 2008)    %>%
           select(-StartDate)                                %>%
           group_by(FundingOrgName, PIId)                    %>%
           tally()                                           %>%
           pivot_wider(names_from = FundingOrgName, values_from = n, values_fill = 0, values_fn = sum) -> a

# rows (PIIds) that have more than one non-zero value, i.e. funded by more than one RC
a[apply(a[,2:ncol(a)] > 0, 1, sum) > 1,]

gtrdat %>% select(FundingOrgName, PIId, StartDate)  %>%
  filter(!is.na(PIId) & year(StartDate) >= 2008)    %>%
  select(-StartDate)                                %>%
  group_by(FundingOrgName, PIId)                    %>%
  tally()                                           %>%
  mutate(fc = FundingOrgName)                       %>%
  pivot_wider(names_from = FundingOrgName, values_from = n, values_fill = 0, values_fn = sum) -> b

gtrdat %>% select(FundingOrgName, PIId, StartDate)  %>%
  filter(!is.na(PIId) & year(StartDate) >= 2008)    %>%
  select(-StartDate)                                %>%
  group_by(FundingOrgName, PIId)                    %>%
  tally()                                           %>%
  mutate(fc = FundingOrgName)                       %>%
  pivot_wider(names_from = FundingOrgName, values_from = n, values_fill = 0, values_fn = sum)

b %>% select(-PIId) %>% group_by(fc) %>% summarise_at(.vars = names(b)[3:11], .funs = colSums(.))

b %>% group_by(fc, PIId) %>% summarise(across(where(is.numeric), ~ sum(.)))

b %>% group_by(fc) %>% summarise(across(where(is.numeric),  ~ sum(.)))

# Mapping data ----

# https://datatricks.co.uk/creating-maps-in-r-2019
# https://r-graph-gallery.com/168-load-a-shape-file-into-r.html
# https://www.blog.cultureofinsight.com/2017/06/building-dot-density-maps-with-uk-census-data-in-r/

library(leaflet)
library(rgdal)
library(rgeos)
library(tidyr)
library(broom)
library(maptools)
library(ggplot2)
library(dplyr)

# Countries: https://geoportal.statistics.gov.uk/datasets/ons::countries-december-2021-uk-bfc/explore?location=55.215430%2C-3.316939%2C6.64
# Regions: https://geoportal.statistics.gov.uk/datasets/ons::regions-december-2020-en-bfc/explore?location=52.916342%2C-2.000000%2C7.61&showTable=true
shapesfile <- readOGR(dsn="../Data/shapes")

# tells you the max and min coordinates, the kind of projection in use
summary(shapesfile)

# how many regions you have
length(shapesfile)

# the first few rows of the data slot associated with the regions
head(shapesfile@data)

# The needs to be transformed using the tidy() function of the broom package.
# The region argument of this function expect one of the column name if the
# @data slot. It will be the region name in the new dataframe.
mapdata <- tidy(shapesfile, region="RGN20NM")

ggplot() + geom_polygon(data = mapdata, aes( x = long, y = lat, group = group), fill="#69b3a2", color="white") +
            theme_void()

# Institutions - survey vs GtR ----


# Data from the GtR - institution and award numbers, rename some of the entries
# to be compatible with the survey. Rename some of the institutions to match the
# survey institutional names. Note we are looking at active projects!
esrcdat %>% filter(Status == "Active")                                                     %>%
            select(Institution=LeadROName)                                                 %>%
            mutate(Institution = ifelse(Institution == "Queen Mary, University of London",
                                        "Queen Mary University of London", Institution))   %>%
            mutate(Institution = ifelse(Institution == "University of Abertay Dundee",
                                        "Abertay University", Institution))                %>%
            mutate(Institution = ifelse(Institution == "The James Hutton Institute",
                                       "James Hutton Institute", Institution))             %>%
            mutate(Institution = ifelse(Institution == "London School of Economics & Pol Sci",
                                        "LSE", Institution))                               %>%
            group_by(Institution)                                                          %>%
            tally()                                                                        %>%
            arrange(desc(n)) -> gtr

# Institutions from the survey data with counts
data %>% select(Institution = CleanLocs)     %>%
         group_by(Institution)               %>%
         filter(!is.na(Institution))         %>%
         tally()                             %>%
         arrange(desc(n)) -> sur


# Do a left join by institution (gtr takes precedence so if not in the survey data
# a null value is set for the survey) in this case substitute null values in the
# survey sample with a zero
gtr %>% left_join(sur, by = "Institution", suffix = c(".gtr",".sur")) %>%
        mutate(n.sur = ifelse(is.na(n.sur), 0, n.sur)) -> gtr_sur

# Plot the values, reduce the input by only having GtR values with more than one
# count to make the diagram less busy.
gtr_sur %>% filter(n.gtr > 7) %>%
            ggplot(aes(x=reorder(Institution, -n.gtr))) + theme_bw() +
            geom_col(aes(y = n.gtr, fill = "green"), alpha = 0.25, colour = "black",  na.rm = TRUE) +
            geom_col(aes(y = n.sur, fill = "red"), alpha = 0.25, colour = "black", na.rm = TRUE) +
            theme(axis.text.x = element_text(angle= -90, hjust = 0, size = 6)) +
            scale_y_continuous(trans = pseudo_log_trans()) + #scale_y_log10(oob = squish_infinite) +
            ylab("Numbers") + labs(fill="Source") +
            xlab("Institutions") +
            scale_fill_manual(labels = c("GtR", "Survey"), values = c("green","red"))

# Use percentages instead
gtr_sur %>% mutate(Ng = sum(n.gtr), Ns = sum(n.sur)) %>%
            mutate(Pg = n.gtr/Ng, Ps = n.sur/Ns)     %>%
            filter(Pg > 0.005) %>%
            ggplot(aes(x=reorder(Institution, -n.gtr))) + theme_bw() +
            geom_col(aes(y = Pg, fill = "green"), alpha = 0.25, colour = "black",  na.rm = TRUE) +
            geom_col(aes(y = Ps, fill = "red"), alpha = 0.25, colour = "black", na.rm = TRUE) +
            theme(axis.text.x = element_text(angle= -90, hjust = 0, size = 6)) +
            scale_y_continuous(labels = percent_format(accuracy = 1)) +
            ylab("Percent") +
            labs(fill="Source") +
            xlab("Institutions") +
            scale_fill_manual(labels = c("GtR", "Survey"), values = c("green","red"))

# Create another tibble that does not have zero values when merging the gtr and
# the survey data - ignore null values that arise from the join.
gtr %>% left_join(sur, by = "Institution", suffix = c(".gtr",".sur")) %>%
        filter(!is.na(n.sur)) -> gtr_sur2

# Plot award numbers gtr and survey responses
gtr_sur2 %>% ggplot(aes(x=reorder(Institution, -n.gtr))) + theme_bw() +
             geom_col(aes(y = n.gtr, fill = "green"), alpha = 0.25, colour = "black") +
             geom_col(aes(y = n.sur, fill = "red"), alpha = 0.25, colour = "black") +
             theme(axis.text.x = element_text(angle= -90, hjust = 0)) +
             scale_y_log10() +
             ylab("Numbers") + xlab("Institution") + labs(fill="Source") +
             scale_fill_manual(labels = c("GtR", "Survey"), values = c("green","red"))

# Use percentages instead
gtr_sur2 %>% mutate(Ng = sum(n.gtr), Ns = sum(n.sur)) %>%
             mutate(Pg = n.gtr/Ng, Ps = n.sur/Ns)     %>%
             filter(Pg > 0.01)                        %>%
             ggplot(aes(x=reorder(Institution, -n.gtr))) + theme_bw() +
             geom_col(aes(y = Pg, fill = "green"), alpha = 0.25, colour = "black",  na.rm = TRUE) +
             geom_col(aes(y = Ps, fill = "red"), alpha = 0.25, colour = "black", na.rm = TRUE) +
             theme(axis.text.x = element_text(angle= -90, hjust = 0, size = 6)) +
             scale_y_continuous(labels = percent_format(accuracy = 1)) +
             ylab("Percent") +
             labs(fill="Source") +
             xlab("Institutions") +
             scale_fill_manual(labels = c("GtR", "Survey"), values = c("green","red"))


# This time use the survey data as the basis for the left join
sur %>% left_join(gtr, by = "Institution", suffix = c(".sur",".gtr")) %>%
        filter(!is.na(n.gtr)) -> sur_gtr

# Plot the data - bar graphs
sur_gtr %>% ggplot(aes(x=reorder(Institution, -n.gtr))) + theme_bw() +
            geom_col(aes(y = n.gtr, fill = "green"), alpha = 0.25, colour = "black") +
            geom_col(aes(y = n.sur, fill = "red"), alpha = 0.25, colour = "black") +
            theme(axis.text.x = element_text(angle= -90, hjust = 0)) +
            scale_y_log10() +
            ylab("Numbers") + xlab("Institution") + labs(fill="Source") +
            scale_fill_manual(labels = c("GtR", "Survey"), values = c("green","red"))

## Emails vs survey responses ----

# Compare institution survey responses with the email list we used

# The first email lists - cleaned
pi_emails <- read_csv("../Data/Mailmerge_clean_list.csv", show_col_types = FALSE)

# The second email list - not cleaned
pi_emails2 <- read_csv("../Data/fname-sname-org-email.csv", show_col_types = FALSE)

# The student data
student_emails <- read_csv("../Data/esrc-students.csv", show_col_types = FALSE)

# Vector of all the emails
emails <- c(pi_emails[["Email"]], pi_emails2[["constructed email"]],
            student_emails[["constructed email"]])

# Remove any duplicated emails
emails <- emails[!duplicated(emails)]

# Get the domains
domains <- str_split(emails, "@", simplify = TRUE)[,2]

# Get the institution names for the domains
insts <- read_csv("~/Git/gateway-to-research-playing-about/output/uni_and_email_address_construction.csv",
                  show_col_types = FALSE)

# Tally the results for emails sent out
tibble(domain = domains) %>% left_join(insts, by = "domain")                                                %>%
                             filter(!is.na(university))                                                     %>%
                             select(domain, Institution = university) %>%
                             mutate(Institution = ifelse(Institution == "Queen Mary, University of London",
                                                        "Queen Mary University of London", Institution))    %>%
                             mutate(Institution = ifelse(Institution == "University of Abertay Dundee",
                                                        "Abertay University", Institution))                 %>%
                             mutate(Institution = ifelse(Institution == "The James Hutton Institute",
                                                        "James Hutton Institute", Institution))             %>%
                             mutate(Institution = ifelse(Institution == "London School of Economics & Pol Sci",
                                                         "LSE", Institution))                               %>%
                             group_by(Institution)                                                          %>%
                             tally()                                                                        %>%
                             arrange(desc(n)) -> ems

# Survey data
data %>% select(Institution = CleanLocs)  %>%
         filter(!is.na(Institution))      %>%
         group_by(Institution)            %>%
         tally()                          %>%
         arrange(desc(n)) -> sur2

# Join the email data with the survey responses
ems %>% left_join(sur2, by = "Institution", suffix = c(".ems",".sur")) %>%
        mutate(n.sur = ifelse(is.na(n.sur), 0, n.sur)) -> ems_sur

# Join the data but ignore null values
ems %>% left_join(sur2, by = "Institution", suffix = c(".ems",".sur")) %>%
        mutate(!is.na(n.sur)) -> ems_sur2

# Plot the results
ems_sur %>%  #filter(n.sur > 0) %>%
       ggplot(aes(x=reorder(Institution, -n.ems))) +
       theme_bw() +
       geom_col(aes(y = n.ems, fill = "blue"), alpha = 0.25, colour = "black",  na.rm = TRUE) +
       geom_col(aes(y = n.sur, fill = "red"), alpha = 0.25, colour = "black", na.rm = TRUE) +
       theme(axis.text.x = element_text(angle= -90, hjust = 0)) +
       scale_y_continuous(trans = pseudo_log_trans(base = 10)) + #scale_y_log10() +
       ylab("Numbers") + xlab("Institution") + labs(fill="Source") +
       scale_fill_manual(labels = c("Emails", "Survey"), values = c("blue","red"))


# Emails numbers vs Award numbers (not quite counting the same things)
gtr %>%  left_join(ems, by = "Institution", suffix = c(".gtr",".ems")) %>%
         mutate(n.ems = ifelse(is.na(n.ems), 0, n.ems)) %>%
         ggplot(aes(x=reorder(Institution, -n.ems))) + theme_bw() +
         geom_col(aes(y = n.ems, fill = "blue"), alpha = 0.25, colour = "black", na.rm = TRUE) +
         geom_col(aes(y = n.gtr, fill = "green"), alpha = 0.25, colour = "black", na.rm = TRUE) +
         theme(axis.text.x = element_text(angle= -90, hjust = 0, size = 6)) +
         scale_y_continuous(trans = pseudo_log_trans()) + #scale_y_log10() +
         ylab("Numbers") + xlab("Institution") + labs(fill="Source") +
         scale_fill_manual(labels = c("Gtr (awards)", "Emails"), values = c("green","blue"))

# Distribution by research discipline ----

# Plot Gtr research categories obtained from research subjects and research
# topics. combined is defined in the ESRC.Rmd file.
combined %>% filter(!(category %in% c("Other", "Uncategorised")))                 %>%
             mutate(Nt = sum(Contribution.topic), Ns = sum(Contribution.subject)) %>%
             mutate(cs = Contribution.subject/Ns, ct = Contribution.topic/Nt)     %>%
             ggplot(aes(x = reorder(category, -Contribution.subject))) +
             geom_col(aes(y = cs, fill = "red"), colour = "black", alpha = 0.25) +
             geom_col(aes(y = ct, fill = "blue"), colour = "black", alpha = 0.25) +
             scale_y_continuous(labels = percent_format(accuracy = 1)) +
             theme_bw() + theme(axis.text.x = element_text(angle = -90, hjust = 0)) +
             xlab("Category") + ylab("Number of awards") + labs(fill = "Research") +
             scale_fill_manual(labels = c("Topic", "Subject"), values = c("blue", "red"))

# Same information but only using active projects
a_combined %>% filter(!(category %in% c("Other", "Uncategorised")))                 %>%
               mutate(Nt = sum(Contribution.topic), Ns = sum(Contribution.subject)) %>%
               mutate(cs = Contribution.subject/Ns, ct = Contribution.topic/Nt)     %>%
               ggplot(aes(x = reorder(category, -Contribution.subject))) +
               geom_col(aes(y = cs, fill = "red"), colour = "black", alpha = 0.25) +
               geom_col(aes(y = ct, fill = "blue"), colour = "black", alpha = 0.25) +
               scale_y_continuous(labels = percent_format(accuracy = 1)) +
               theme_bw() + theme(axis.text.x = element_text(angle = -90, hjust = 0)) +
               xlab("Category") + ylab("Number of awards") + labs(fill = "Research") +
               scale_fill_manual(labels = c("Topic", "Subject"), values = c("blue", "red"))

# Normalise the research disciplines by the numbers and plot the output
data %>%  select(URN, num_range("Q19_", 1:22))          %>%
          pivot_longer(cols = num_range("Q19_", 1:22),
                       names_to = NULL,
                       values_to = "disciplines")       %>%
          filter(disciplines != 0)                      %>%
          group_by(URN)                                 %>%
          mutate(n = n())                               %>%
          group_by(disciplines)                         %>%
          summarise(Con = round(sum(1/n), 2))           %>%
          mutate(Tot = sum(Con))                        %>%
          mutate(Per = Con/Tot)                         %>%
          ggplot(aes(x = reorder(disciplines, -Per), y = Per, fill = Per)) +
          geom_col(colour ="black") +
          scale_y_continuous(labels = percent_format(accuracy = 1)) +
          theme_bw() + scale_fill_distiller(palette = "Blues", direction = 1) +
          xlab("Normalised research disciplines") +
          ylab("Percent") +
          theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "None") +
          geom_text(aes(label = percent(Per, accuracy = 1)), size = 3, vjust = -0.5)

# Save the normalised research topic information - ignore the other category.
data %>%  select(URN, num_range("Q19_", 1:22))          %>%
          pivot_longer(cols = num_range("Q19_", 1:22),
                       names_to = NULL,
                       values_to = "disciplines")       %>%
          filter(disciplines != 0)                      %>%
          filter(disciplines != "Other")                %>%
          group_by(URN)                                 %>%
          mutate(n = n())                               %>%
          group_by(disciplines)                         %>%
          summarise(Con = round(sum(1/n), 2))           %>%
          mutate(Tot = sum(Con))                        %>%
          mutate(Per = Con/Tot)  -> sur_research

# Rename the research disciplines - base names and name these with the shortened
# name used in the survey data thus effectively creating a look-up table.
topics <-  c("Area Studies", "Data science and artificial intelligence", "Demography",
             "Development studies", "Economics", "Education", "Environmental planning",
             "History", "Human Geography", "Information science", "Law & legal studies",
             "Linguistics", "Management & business studies", "Political science. & international studies",
             "Psychology", "Science and Technology Studies", "Social anthropology", "Social policy",
             "Social work", "Sociology", "Tools, technologies & methods", "Other")

# Short names used in the survey data
names(topics) <- c("AreaStudies", "DS_AI", "Demography","DevelopmentStudies",
                   "Economics", "Education", "EnvPlanning","History","HumanGeography",
                   "InfoSci","Law","Linguistics","ManBusStud","PolSci_IntStud",
                   "Pyschology", "SciTechStud",
                   "SocAnth", "SocPol", "SocWork","Sociology","ToolsTechMeth",
                    "Other")

# Create a new column - rs for research subjects
sur_research$rs <-  unname(topics[sur_research[["disciplines"]]])

# Check we are not missing categories we are missing out the Other and
# Uncategorised elements
rs <-  unname(topics[sur_research[["disciplines"]]])
combined %>% select(category)                     %>%
             filter(category != "Uncategorised")  %>%
             filter(category != "Other")  %>%
             filter(!(category %in% rs))

# Now join the data together for all projects
combined %>% filter(!(category %in% c("Uncategorised", "Other")))  %>%
             left_join(sur_research, by = c("category" = "rs"))    %>%
             mutate(Nt = sum(Contribution.topic),
                    Ns = sum(Contribution.subject))                %>%
             mutate(cs = Contribution.subject/Ns,
                    ct = Contribution.topic/Nt)                    %>%
             pivot_longer(cols = c("cs","ct","Per"),
                          names_to = "type",
                          values_to = "percent")                   %>%
             ggplot(aes(x = reorder(category, -Contribution.subject), fill = type, by = type)) +
             geom_col(aes(y = percent),
                      position = position_dodge2(width = 0.8, preserve = "single"), colour = "black", alpha = 0.5) +
             scale_y_continuous(labels = percent_format(accuracy = 1)) +
             theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
             xlab("Category") + ylab("Percent") + labs(fill = "Research") +
             scale_fill_manual(labels = c("Subject", "Topic", "Survey"),
                               values = c("blue", "red", "green"))


# Using only active projects
a_combined %>% filter(!(category %in% c("Uncategorised", "Other")))  %>%
                left_join(sur_research, by = c("category" = "rs"))    %>%
                mutate(Nt = sum(Contribution.topic),
                       Ns = sum(Contribution.subject))                %>%
                mutate(cs = Contribution.subject/Ns,
                       ct = Contribution.topic/Nt)                    %>%
                pivot_longer(cols = c("cs","ct","Per"),
                             names_to = "type",
                             values_to = "percent")                   %>%
                ggplot(aes(x = reorder(category, -Contribution.subject), fill = type, by = type)) +
                geom_col(aes(y = percent),
                         position = position_dodge2(width = 0.8, preserve = "single"), colour = "black", alpha = 0.5) +
                scale_y_continuous(labels = percent_format(accuracy = 1)) +
                theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
                xlab("Category") + ylab("Percent") + labs(fill = "Research") +
                scale_fill_manual(labels = c("Subject", "Topic", "Survey"),
                                  values = c("blue", "red", "green"))

