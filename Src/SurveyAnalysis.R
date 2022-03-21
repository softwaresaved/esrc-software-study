#!/usr/bin/env Rscript
#
# Analyse and plot graph results
#


# Load packages ----------------------------------------------------------

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(RColorBrewer)


# Read then data ----------------------------------------------------------

# Read in the survey results
data <- read_xlsx("../Data/survey-results.xlsx")

# Read in a question key
key <- read_xlsx("../Data/survey-results-key.xlsx")

# Remap data ------------------------------------------------------------

## Q2 Do you create or re-use data to undertake your research? --------
# 1	Create new data (including primary data collection and data generation)
# 2	Re-use existing data

# Create new data
data$Q2_1 <- gsub("0","nocreate",data$Q2_1)
data$Q2_1 <- gsub("1","create",data$Q2_1)

# Reuse data
data$Q2_2 <- gsub("0","noreuse",data$Q2_2)
data$Q2_1 <- gsub("1","create",data$Q2_1)

## Q3 Sharing data ------------------------------------------------------------
# 1	I have not yet shared my data
# 2	I have licensed my data to allow it to be shared
# 3	I have shared my data with individuals/groups that have requested access
# 4	I created a DOI (or other unique identifier) to make my data findable
# 5	I have promoted my data as an accessible resource in my publications
# 6	I have deposited my data in a repository
# 7	Other

data$Q3_1 <- gsub("1", "Not shared", data$Q3_1)
data$Q3_2 <- gsub("1", "Licensed", data$Q3_2)
data$Q3_3 <- gsub("1", "Restricted sharing", data$Q3_3)
data$Q3_4 <- gsub("1", "DOI", data$Q_4)
data$Q3_5 <- gsub("1", "Ptromoted", data$Q_5)
data$Q3_6 <- gsub("1", "In Repo", data$Q3_6)
data$Q3_7 <- gsub("1", "Other", data$Q3_7)


## Q4 Use of software ------------------------------------------------------
# 1	Animation and Storyboarding, e.g. Scratch, Storyteller
# 2	AudioTools, e.g. Music Algorithms, Paperphone
# 3	Authoring and publishing tools, e.g. Twine, Oppia
# 4	Code versioning, e.g. GitHub
# 5	Content Management Systems (CMS), e.g. WordPress, Mura
# 6	CrowdSourcing, e.g. AllOurIdeas
# 7	Exhibition/Collection Tools, e.g. Omeka, Neatline
# 8	Internet Research Tools, e.g. Google tools or Wikipedia tools
# 9	Machine Learning and Artificial Intelligence, e.g. leximancer
# 10	Mapping Tools and Platforms, Geographic Information Systems, e.g. QGIS, CartoDB, ArcGIS
# 11	MindMapping Tools, e.g. DebateGraph
# 12	Network Analysis, e.g. GEPHI
# 13	Programming Languages, e.g. Python, MATLAB
# 14	Qualitative analyses, e.g. NVivo
# 15	Simulation Tools, e.g. NetLogo
# 16	Spreadsheets, e.g. Excel, Google Sheets
# 17	Statistical analysis, e.g. R, SPSS, Stata, SAS
# 18	Text Analysis Tools, e.g. Voyant, Linguistic Corpuses, Entity Recognizers
# 19	Text Collation Tools, e.g. Juxta Commons
# 20	Text Encoding, e.g. Oxygen XML
# 21	Text and Data Wrangling, e.g. Overview, OpenRefine
# 22	Topic Modelling, e.g. Leximancer
# 23	Transcription services, e.g. otter.ai
# 24	Video and Film Analysis, e.g. Cinemetrics
# 25	Visualisation Tools, e.g. D3.js, Tableau
# 26	Other
software <-  c("AnimationStoryborarding", "Autdiotools", "AuthoringPublishing",
               "CodeVersioning", "CMS", "CrowdSourcing", "ExhibionCollection",
               "internetResearchTools", "ML_AI", "GIS", "MindMapping",
               "NetworkAnalysis", "ProgLanguagues", "QualitativeAnalysis",
               "SimulationTools","Spreadsheets","StatisticalAnalysis",
               "TextAnalysis", "TextCollation", "TextEncoding", "DataWrangling",
               "TopicModelling", "Transcription","VideoFilmAnal", "Visualisation",
               "Other")

for(i in seq_len(26)){
  q <- paste0("Q4_",i)
  data[q] <- gsub("1", software[i], data[[q]])
}


## Q6 Open source ----------------------------------------------------------
# 1	Yes
# 2	No

data$Q6 <- gsub("1", "Yes", data$Q6)
data$Q6 <- gsub("2", "No", data$Q6)
data$Q6[is.na(data$Q6)] <-  "-"


## Q6a Reasons for using open source ---------------------------------------
# 1	Institutional/Funder policy
# 2	Quality of support
# 3	Open standards/interoperability
# 4	Cost
# 5	Sustainability
# 6	Licensing
# 7	Meets user needs/usability
# 8	Staff previous experience, no need for training

os_reasons <- c("Policy","Suppoprt", "Interoperability","Cost","Sustainability",
                "Licensing","Usability", "Experience")

for(i in seq_len(8)){
  q <- paste0("Q6_a_", i)
  data[q] <- gsub("1", os_reasons[i], data[[q]])
}

## Q20 Career stage ------------------------------------------------------
# 1	Phase 1 - Junior (e.g. PhD candidate, Junior Research Software Engineer)
# 2	Phase 2 - Early (e.g Research Assistant/Associate, first grant holder,
#             Lecturer, Research Software Engineer)
# 3	Phase 3 - Mid / Recognised (e.g. Senior Lecturer, Reader, Senior Researcher,
#             Senior Research Software Engineer, Research Software Group Leader)
# 4	Phase 4 - Established / Experienced / Senior (e.g. Professor, Director of
#             Research Computing, Distinguished Engineer, Chief Data Scientist)
# 5	Other

data$Q20 <- gsub("1", "Junior", data$Q20)
data$Q20 <- gsub("2", "Early", data$Q20)
data$Q20 <- gsub("3", "Mid", data$Q20)
data$Q20 <- gsub("4", "Senior", data$Q20)
data$Q20 <- gsub("5", "Other", data$Q20)

# Remap NAs to "-"
data$Q20[is.na(data$Q20)] <- "-"

# Establish a career stage order
career_order <-  c("Junior","Early","Mid","Senior","Other","-")

## Gender ------------------------------------------------------------------
# 1	Woman
# 2	Man
# 3	Non-binary person
# 4	Prefer not to disclose
# 5	Other
data$Q21 <- gsub( "1", "Woman", data$Q21)
data$Q21 <- gsub( "2", "Man", data$Q21)
data$Q21 <- gsub( "3", "Non-binary person", data$Q21)
data$Q21 <- gsub( "4", "Prefer not to disclose", data$Q21)
data$Q21 <- gsub( "5", "Other", data$Q21)

data$Q21[is.na(data$Q21)] <- "-"

gender_order <-  c("Woman", "Man", "Other", "Prefer not to disclose", "Non-binary person", "-")

# Question data ---------------------------------------------------

## Q2 Do you create or re-use data to undertake your research? --------
# 1	Create new data (including primary data collection and data generation)
# 2	Re-use existing data

### Use of data segmented by career stage ---------------------------
data %>% select(create = Q2_1, reuse = Q2_2, career = Q20) %>%
         pivot_longer(cols = c("create", "reuse"), values_to = "datause")     %>%
         select(!name)                                                        %>%
         ggplot(aes(x = datause, fill = factor(career, levels = career_order))) +
         geom_bar(colour = "black") +
         theme_bw() +
         xlab("Use of data") + ylab("Number of responses") +
         geom_text(aes(x = datause, label = ..count..),
                  position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
         scale_fill_brewer(palette = "Set1", name = "Career stage", breaks = career_order)

### Use of data percentage segments ------------
data %>% select(create=Q2_1, reuse=Q2_2, career=Q20)                         %>%
         pivot_longer(cols = c("create", "reuse"), values_to = "datause")     %>%
         select(!name)                                                        %>%
         ggplot(aes(x = datause, fill = factor(career, levels = career_order))) +
         geom_bar(position = "fill", colour = "black") +
         theme_bw() +
         xlab("Use of data") + ylab("Percentage of responses") +
         labs(fill = "Career stage") +
         scale_fill_brewer(palette = "Set1", name = "Career stage", breaks = career_order) +
         scale_y_continuous(labels = scales::percent)

## Q4 use of software ------------------------------------------------------
data %>% select(num_range("Q4_",1:26))                              %>%
         pivot_longer(cols = everything(), values_to = "software")  %>%
         filter(software != 0)                                      %>%
         select(-name)                                              %>%
         ggplot(aes(x = software, fill = software)) +
         geom_bar(colour = "black") +
         theme_bw() +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
         ylab("Number") + xlab("Software used") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5, size = 3) +
        theme(legend.position = "none")

## Q6 use of open source ---------------------------------------------------

### Use of software ---------------------------------------------------------
data %>% select(Q6) %>%
         ggplot(aes(x = Q6)) + geom_bar() + theme_bw() +
         xlab("Use of Open Source") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5)

### Use of software by career stage ------------------------------------------
data %>% select(Q6, career = Q20) %>%
         ggplot(aes(x = Q6, fill = career)) +
         geom_bar(color = "black") +
         theme_bw() +
         xlab("Use of Open Source") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", position = position_stack(vjust = 0.5))

## Q20 Career stage --------------------------------------------------------

# Bar chart of the career stages
data %>%  select(career = Q20) %>%
          ggplot(aes(x = factor(career, levels = career_order))) +
          geom_bar() +
          theme_bw() +
          xlab("Career stage") + ylab("Number")  +
          geom_text(aes(x = factor(career, levels = career_order), label = ..count..),
                    position = position_stack(vjust = 0.5), stat = "count", colour = "white")

## Q21 Gender --------------------------------------------------------------

# Bar chart of gender population
data %>% select(gender = Q21) %>%
         mutate(gender = factor(gender, levels = gender_order)) %>%
         ggplot(aes(x = gender)) +
         geom_bar() +
         theme_bw() +
         geom_text(aes(label = ..count..), position = position_stack(vjust = 0.5), stat = "count", colour = "white") +
         xlab("Gender") + ylab("Number")

# Gender vs Career stage
data %>% select(gender = Q21, career = Q20) %>%
         group_by(gender, career)           %>%
         mutate(size = n())                 %>%
         ggplot(aes(x = factor(gender, levels = gender_order), y = factor(career, levels = career_order), colour = size)) +
         geom_point(aes(size = size)) + theme_bw() +
         geom_text(aes(x = factor(gender, levels = gender_order), y = factor(career, levels = career_order), label = size), vjust = 2) +
         xlab("Gender") + ylab("Career stage") + theme(legend.position = "none") +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))
