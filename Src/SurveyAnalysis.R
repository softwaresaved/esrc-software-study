#!/usr/bin/env Rscript
#
# Analyse and plot graph results
#


# Load packages ----------------------------------------------------------

library(readxl)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(RColorBrewer)
library(leaflet)
library(stringr)


# Read then data ----------------------------------------------------------

# Read in the survey results
data0 <- read_xlsx("../Data/survey-results.xlsx")

# Upload location information - long and lat for institutions
colTypes <- cols(
                  Location = col_character(),
                  Latitude = col_double(),
                  Longitude = col_double(),
                 )

locations <- read_csv("../Data/locations.csv", col_types = colTypes)

# Cleaned up software - Q5 most important software - a free text box. Cleaned up
# in OpenRefine
important_software <- read_csv("../Data/Q5-software-split.csv",
                               show_col_types = FALSE)

# Replace " "s in column names by "_"
names(important_software) <- gsub(" ", "_", names(important_software))

# Count non-NA entries per row
important_software$count <- rowSums(!is.na(important_software))

# Cleaned up locations (Q17) (used OpenRefine to cluster some of the data)
cleanlocs <- read_csv("../Data/CleanedLocations.csv", col_types = cols(Q17 = col_character()))

# Attach the cleaned locations to the data set
data0$CleanLocs <- cleanlocs[[1]]

# Data that will actually be used
data <- data0

# Remap data ------------------------------------------------------------

## Q2 Do you create or re-use data to undertake your research? --------
# 1	Create new data (including primary data collection and data generation)
# 2	Re-use existing data

# Create new data
data$Q2_1 <- gsub("1","create",data$Q2_1)

# Reusing data
data$Q2_2 <- gsub("1","reuse",data$Q2_2)

## Q2b Data sources for reusing existing data ----
# 1	UK Data Service
# 2	University / Institutional Repository
# 3	General data repository (e.g. Dryad, Figshare, Open Science Framework, Zenodo)
# 4	Shared by collaborators using a shared drive / folder
#       (e.g. DropBox, Google Drive, ...)
# 5	Personal recommendation, eg from discussion with other researchers
# 6	Other
ds <- c("UK Data Service",
        "University/Institutional Repository",
        "General data repository",
        "Shared with collaborators using shared drive/folder",
        "Personal recommendation",
        "Other")

for( i in seq_len(6)){
  q <- paste0("Q2_b_",i)
  data[q] <- gsub("1", ds[i], data[[q]])
}

## Q3 Sharing data ------------------------------------------------------------
# 1	I have not yet shared my data
# 2	I have licensed my data to allow it to be shared
# 3	I have shared my data with individuals/groups that have requested access
# 4	I created a DOI (or other unique identifier) to make my data findable
# 5	I have promoted my data as an accessible resource in my publications
# 6	I have deposited my data in a repository
# 7	Other

sharing <- c("NotShared","Licensed","RestrictedSharing","CreatedDOI",
             "Publications","Repository","Other")

for( i in seq_len(7)){
  q <- paste0("Q3_",i)
  data[q] <- gsub("1", sharing[i], data[[q]])
}

## Q4 Use of software ------------------------------------------------------
#  1	Animation and Storyboarding, e.g. Scratch, Storyteller
#  2	AudioTools, e.g. Music Algorithms, Paperphone
#  3	Authoring and publishing tools, e.g. Twine, Oppia
#  4	Code versioning, e.g. GitHub
#  5	Content Management Systems (CMS), e.g. WordPress, Mura
#  6	CrowdSourcing, e.g. AllOurIdeas
#  7	Exhibition/Collection Tools, e.g. Omeka, Neatline
#  8	Internet Research Tools, e.g. Google tools or Wikipedia tools
#  9	Machine Learning and Artificial Intelligence, e.g. leximancer
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

## Q5 Most important software in research ----------------------------------

data$Q5

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

os_reasons <- c("Policy","Support", "Interoperability","Cost","Sustainability",
                "Licensing","Usability", "Experience")

for(i in seq_len(8)){
  q <- paste0("Q6_a_", i)
  data[q] <- gsub("1", os_reasons[i], data[[q]])
}


## Q6b Reasons for not using open-source -----------------------------------
# 1	Institutional/Funder Policy
# 2	Speed of access to support
# 3	Lack of performance
# 4	Legal reasons
# 5	Continuity
# 6	Does not meet user needs/useability
# 7	Lack of expertise/requirement for training
# 8	Requirement from collaborators

no_os <- c("Policy", "PoorSupport", "NotPerformant", "Legal",
           "Continuity", "NotMeetNeeds", "NoExpertise","CollabReqs")

for(i in seq_len(8)){
  q <- paste0("Q6_b_", i)
  data[q] <- gsub("1", no_os[i], data[[q]])
}

## Q7	How is the software you use currently being supported and maintained? ----
# 1	Provided by my institution
# 2	Commercial or paid for external support
# 3	Open source community initiative
# 4	By a software specialist / research software engineer in my institution
# 5	By me or my team
# 6	No longer supported/maintained
# 7	Other

swmaintained <- c("Institution", "Commercial", "OpenSource","RSE", "MyTeam",
                  "NotMaintained", "Other")

for(i in seq_len(7)){
  q <- paste0("Q7_", i)
  data[q] <- gsub("1", swmaintained[i], data[[q]])
}

## Q8 use combinations of software -----

data %>%  select("Q8")                            %>%
          filter(!is.na(Q8))                      %>%
          mutate(s = str_wrap(Q8, width = 20))    %>%
          select(-Q8)                             %>%
          #print(n = nrow(.))                      %>%
          write_csv("../Data/wfcases.csv")

## Q9 Develop or extend software? ------------------------------------------
# 1	Yes
# 2	No
data$Q9[data$Q9 == 1] <- "Yes"
data$Q9[data$Q9 == 2] <- "No"

## Q10 if you write your own software do you: ------------------------------
# 1	Only make available for your own use
# 2	Only share within your research group
# 3	Only share with your collaborators (including at other institutions)
# 4	Share with others on request
# 5	Make widely available for use in your field / community
# 6	Other
swuse <- c("OwnUseOnly", "RGUseOnly", "CollaboratorsOnly",
           "ShareOnRequest", "ShareWidely","Other")

for(i in seq_len(6)){
  q <- paste0("Q10_", i)
  data[q] <- gsub("1", swuse[i], data[[q]])
}


## Q11 How did you acquire the skills necessary to utilise software --------
# 1	I am still trying to acquire the skills
# 2	Self-led online material
# 3	From examples and posts found online
# 4	Free community-led online workshops (e.g. Riot Science Club, ReproducibiliTea)
# 5	Conference workshops and tutorials
# 6	Peers and colleagues
# 7	Undergraduate/masters course
# 8	Postgraduate training as part of my PhD/CDT/DTC
# 9	Institutional training course
# 10	National Centre for Research Methods (NCRM) training
# 11	Third-party training course (not NCRM)
# 12	Other
skills <- c("StillTrying","OnlineCourses", "OnlineExamples", "OnlineWorkshops",
            "ConferenceWorkshops", "PeersColleagues", "UG/MasterCourse",
            "PGTraining","InstituionalCourse","NCRM", "ThirdPartyCourse", "Other")

for(i in seq_len(12)){
  q <- paste0("Q11_", i)
  data[q] <- gsub("1", skills[i], data[[q]])
}

## Q11b NCRM courses ----
# 1	Data in the spotlight: International time series databanks
# 2	(Non-)Probability Survey Samples in Scientific Practice
# 3	Classification Models with Python
# 4	Principles and Practices of Quantitative Data Analysis
# 5	Scoping Reviews Short Course
# 6	UK Census Longitudinal Studies (UKcenLS) Webinar
# 7	Advanced Programming in R
# 8	Introduction to QGIS: Spatial Data
# 9	Spatial Analysis, Introduction to Spatial Data & Using R as a GIS
# 10	Structural Equation Modelling using Mplus
# 11	Testing for Mediation and Moderation using Mplus
# 12	Testing for Mediation and Moderation using SPSS (PROCESS macro)
# 13	Video Production for Anthropology and Social Research
# 14	Item Response Theory and Computer Adaptive Testing
# 15	Multilevel Modelling using Mplus
# 16	Multilevel Modelling using SPSS
# 17	Analysing interview and focus group data with NVivo
# 18	Latent Growth Curve Modelling using Mplus
# 19	Applied Data Science with R
# 20	Introduction to Sequence Analysis for Social Sciences
# 21	Video Editing
# 22	Other
ncrm_courses <- c("Data in the spotlight: International time series databanks",
                  "(Non-)Probability Survey Samples in Scientific Practice",
                  "Classification Models with Python",
                  "Principles and Practices of Quantitative Data Analysis",
                  "Scoping Reviews Short Course",
                  "UK Census Longitudinal Studies (UKcenLS) Webinar",
                  "Advanced Programming in R",
                  "Introduction to QGIS: Spatial Data",
                  "Spatial Analysis, Introduction to Spatial Data & Using R as a GIS",
                  "Structural Equation Modelling using Mplus",
                  "Testing for Mediation and Moderation using Mplus",
                  "Testing for Mediation and Moderation using SPSS (PROCESS macro)",
                  "Video Production for Anthropology and Social Research",
                  "Item Response Theory and Computer Adaptive Testing",
                  "Multilevel Modelling using Mplus",
                  "Multilevel Modelling using SPSS",
                  "Analysing interview and focus group data with NVivo",
                  "Latent Growth Curve Modelling using Mplus",
                  "Applied Data Science with R",
                  "Introduction to Sequence Analysis for Social Sciences",
                  "Video Editing",
                  "Other")

for(i in seq_len(22)){
  q <- paste0("Q11_b_", i)
  data[q] <- gsub("1", ncrm_courses[i], data[[q]])
}


## Q12 Development and maintenance of research software rewarded/recognised --------
# 1	Yes
# 2	No
# 3	Don't know
rew <- c("Yes", "No", "Don't know")

for(i in seq_len(3)){
  data["Q12"] <- gsub(i, rew[i], data[["Q12"]])
}

data["Q12"][is.na(data["Q12"])] <- "-"

## Q13 Statements abut software ----
# When answering this question, think about the most important piece of software
# you use for research that you couldn't live without. To what level do you
# agree/disagree with the following statements?
# Q13_1	I am aware of how the software I use is funded, managed and licensed
# 1	Strongly agree
# 2	Agree
# 3	Undecided
# 4	Disagree
# 5	Strongly Disagree
# Q13_2	My institution or funder's policies on how software is funded, managed and licensed are clear to me
# 1	Strongly agree
# 2	Agree
# 3	Undecided
# 4	Disagree
# 5	Strongly Disagree
# Q13_3	There is insufficient attention paid to software funding, management and licensing by the economic
#       and social sciences research community
# 1	Strongly agree
# 2	Agree
# 3	Undecided
# 4	Disagree
# 5	Strongly Disagree
# Q13_4	There is insufficient incentive for me to learn how my software is funded, managed and licensed
# 1	Strongly agree
# 2	Agree
# 3	Undecided
# 4	Disagree
# 5	Strongly Disagree

likert <- c("Strongly agree",
            "Agree",
            "Undecided",
            "Disagree",
            "Strongly disagree")

likert <- c("Strongly agree",
            "Agree",
            "Undecided",
            "Disagree",
            "Strongly disagree")

for(i in seq_len(4)){
  for(j in seq_len(5)){
    q <- paste0("Q13_", i,"_", j)
    data[q] <- gsub(1, likert[j], data[[q]])
  }
}

## Q14 Where do you normally run your digital tools/software? --------
# 1	My own laptop/desktop
# 2	Institutionally provided laptop/desktop
# 3	Server operated by research group / department
# 4	An institutional central service
# 5	Run by an individual data centre or at a data safe haven
# 6	A UK Tier 2 high performance computing service
# 7	A UK Tier 1 high performance computing service
# 8	The Cloud, e.g. Microsoft Azure or Amazon Web Services
# 9	Other

hw <- c("Own", "InstitutionallyProvided", "RG/DepServer","InstitutionalCentralService",
        "DataCentre/SafeHaven","Tier2", "Tier1", "Cloud", "Other")

for(i in seq_len(9)){
  q <- paste0("Q14_", i)
  data[q] <- gsub("1", hw[i], data[[q]])
}

## Q15 Licensing awareness -----
# A licensing policy provides instruction or guidance on what software licenses
# are preferred for the release of software.
# A publishing policy provides instruction or guidance on how software should be
# made available to others.
# Q15_1	My Institution's
# 1	Licensing
# 2	Publishing
# Q15_2	My funder's
# 1	Licensing
# 2	Publishing
# Q15_3	My Project's
# 1	Licensing
# 2	Publishing

data$Q15_1_1 <- gsub("1", "InstituionLicensing", data$Q15_1_1)
data$Q15_1_2 <- gsub("1", "InstituionPublishing", data$Q15_1_2)

data$Q15_2_1 <- gsub("1", "FunderLicensing", data$Q15_2_1)
data$Q15_2_2 <- gsub("1", "FunderPublishing", data$Q15_2_2)

data$Q15_3_1 <- gsub("1", "ProjectLicensing", data$Q15_3_1)
data$Q15_3_2 <- gsub("1", "ProjectPublishing", data$Q15_3_2)

# ## Q16 barriers to the use of software -------------------------------------
# 1	Lack of expertise within your team
# 2	Unsure how to best engage with research technical specialists such as software engineers, digital archivists, etc.
# 3	Training is not available
# 4	Training is available but you have no capacity to engage
# 5	Infrastructure is not available (Infrastructure could include: digital archives; computers with access to specialist software; data sets not digitised; etc)
# 6	No disciplinary tradition for digital methodology and tools
# 7	Concern that less value is attached to digital publications and other outputs of research, etc.
# 8	Format of data and assets you work with make them less amenable to technology
# 9	Lack of funding to support research projects/components of projects focusing on digital data and digital assets
# 10	Previous bad experience
# 11	I have not found software that is fit for my purpose
# 12	Lack of time to learn how to best use research software
# 13	Other

barriers <-  c("LackOfExpertise", "UnsureHowToEngageSpecialists", "NoTraining", "NoCapacity",
               "NoInfrastructure", "NoTradition", "ConcernAboutValue", "AssetsNotAmenable",
               "LackOfFunding", "BadExperiences", "NoPertinentSoftware", "LackOfTime", "Other")

for(i in seq_len(13)){
  q <- paste0("Q16_", i)
  data[q] <- gsub("1", barriers[i], data[[q]])
}

## Q17 Institutional affiliation -------------------------------------------

# Add longitude and Latitude coordinates for the institutions
data <- data %>% left_join(locations, by = c("CleanLocs" = "Location"))

## Q19 Research discipline -------------------------------------------------
# 1	Area Studies
# 2	Data science and artificial intelligence
# 3	Demography
# 4	Development studies
# 5	Economics
# 6	Education
# 7	Environmental planning
# 8	History
# 9	Human Geography
# 10	Information science
# 11	Law & legal studies
# 12	Linguistics
# 13	Management & business studies
# 14	Political science. & international studies
# 15	Psychology
# 16	Science and Technology Studies
# 17	Social anthropology
# 18	Social policy
# 19	Social work
# 20	Sociology
# 21	Tools, technologies & methods
# 22	Other

discipline <- c("AreaStudies", "DS_AI", "Demography","DvelopmentStudies",
                "Economics", "Education", "EnvPlanning","History","HumanGeography",
                "InfoSci","Law","Linguistics","ManBusStud","PolSci_IntStud",
                "Pyschology", "SciTechStud",
                "SocAnth", "SocPol", "SocWork","Sociology","ToolsTechMeth",
                "Other")

for(i in seq_len(22)){
  q <- paste0("Q19_", i)
  data[q] <- gsub("1", discipline[i], data[[q]])
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

career <- c("Junior", "Early", "Mid", "Senior", "Other")

for(i in seq_len(5)){
  data["Q20"] <- gsub(i, career[i], data[["Q20"]])
}

# Remap NAs to "-"
data$Q20[is.na(data$Q20)] <- "-"

# Establish a career stage order
career_order <-  c("Junior","Early","Mid","Senior","Other","-")

## Q21 Gender --------------------------------------------------------------
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

## Q22 Ethnic group ----
# 1	White: English, Welsh, Scottish, Northern Irish or British
# 2	White: Irish
# 3	White: Gypsy or Irish Traveller
# 4	White: Roma
# 5	White: Any other White background
# 6	Mixed or Multiple ethnic groups: White and Black Caribbean
# 7	Mixed or Multiple ethnic groups: White and Black African
# 8	Mixed or Multiple ethnic groups: White and Asian
# 9	Mixed or Multiple ethnic groups: Any other Mixed or Multiple background
# 10	Asian or Asian British: Indian
# 11	Asian or Asian British: Pakistani
# 12	Asian or Asian British: Bangladeshi
# 13	Asian or Asian British: Chinese
# 14	Asian or Asian British: Any other Asian background
# 15	Black, Black British, Caribbean or African: Caribbean
# 16	Black, Black British, Caribbean or African: African background
# 17	Black, Black British, Caribbean or African: Any other Black, Black British, Caribbean or African background
# 18	Other ethnic group: Arab
# 19	Prefer not to disclose
# 20	Other

ethinicity <- c("White: English, Welsh, Scottish, Northern Irish or British",
                "White: Irish",
                "White: Gypsy or Irish Traveller",
                "White: Roma",
                "White: Any other White background",
                "Mixed or Multiple ethnic groups: White and Black Caribbean",
                "Mixed or Multiple ethnic groups: White and Black African",
                "Mixed or Multiple ethnic groups: White and Asian",
                "Mixed or Multiple ethnic groups: Any other Mixed or Multiple background",
                "Asian or Asian British: Indian",
                "Asian or Asian British: Pakistani",
                "Asian or Asian British: Bangladeshi",
                "Asian or Asian British: Chinese",
                "Asian or Asian British: Any other Asian background",
                "Black, Black British, Caribbean or African: Caribbean",
                "Black, Black British, Caribbean or African: African background",
                "Black, Black British, Caribbean or African: Any other Black, Black British, Caribbean or African background",
                "Other ethnic group: Arab",
                "Prefer not to disclose",
                "Other")

# Work backwards otherwise partial numbers are substituted
for(i in 20:1){
  data["Q22"] <- gsub(i, ethinicity[i], data[["Q22"]])
}

#
# Process question data ---------------------------------------------------
#

## Q2 Do you create or re-use data to undertake your research? --------
# 1	Create new data (including primary data collection and data generation)
# 2	Re-use existing data

### Use of data segmented by career stage ---------------------------
data %>% select(num_range("Q2_", 1:2), career = Q20) %>%
         pivot_longer(cols = num_range("Q2_", 1:2), values_to = "datause")    %>%
         filter(datause != 0)                                                 %>%
         select(!name)                                                        %>%
         ggplot(aes(x = datause, fill = factor(career, levels = career_order))) +
         geom_bar(colour = "black") +
         theme_bw() +
         xlab("Use of data") + ylab("Number") +
         geom_text(aes(x = datause, label = ..count..),
                  position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
         scale_fill_brewer(palette = "Set1", name = "Career stage", breaks = career_order)

## Q2a Most important data sources ----

data %>% select(other = "Q2_a") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

# Write output to a data file
data %>% select(other = "Q2_a")    %>%
         filter(!is.na(other))     %>%
         write_csv("../Data/Q2a_OtherDataSources.csv")

## Q2b Data sources for reusing existing data ----

### Bar chart ----
data %>% select(num_range("Q2_b_",1:6))      %>%
         pivot_longer(cols = everything(),
                      names_to = "question",
                      values_to = "ds")      %>%
         filter(ds != 0)                     %>%
         ggplot(aes(x = ds)) + geom_bar(colour = "black") +
         theme_bw() + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5, size = 3) +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
         xlab("Data sources")

## Q2b Other data sources -----

data %>% select(other = "Q2_b_i") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q2c Creating data process ----

data %>% select(other = "Q2_c") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q3 Do you share data -------------------------------------------------------

### Data sharing ----------
data %>% select(num_range("Q3_", 1:7))                               %>%
        pivot_longer(cols = everything(), values_to = "DataSharing") %>%
        filter(DataSharing != 0)                                     %>%
        ggplot(aes(x = DataSharing, fill = DataSharing)) +
        geom_bar(colour = "black") + theme_bw() +
        theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
        xlab("Data sharing habits") + ylab("Number") +
        geom_text(aes(label = ..count..), stat = "count", vjust = -0.5, size = 3) +
        theme(legend.position = "none")

### Data sharing and career stage ----------
data %>% select(career = Q20, num_range("Q3_", 1:7))                                    %>%
  pivot_longer(cols = starts_with("Q3_"), names_to = "orig", values_to = "DataSharing") %>%
  filter(DataSharing != 0)                                                              %>%
  ggplot(aes(x = DataSharing, fill = career)) +
  geom_bar(colour = "black") + theme_bw() +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
  xlab("Data sharing habits") + ylab("Number") +
  geom_text(aes(label = ..count..), stat = "count", position = position_stack(vjust = 0.5)) +
  labs(fill = "Career stage")

### Data sharing and career stage percentages ----------
data %>% select(career = Q20, num_range("Q3_", 1:7))                                    %>%
  pivot_longer(cols = starts_with("Q3_"), names_to = "orig", values_to = "DataSharing") %>%
  filter(DataSharing != 0)                                                              %>%
  ggplot(aes(x = DataSharing, fill = career)) +
  geom_bar(position = "fill", colour = "black") + theme_bw() +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
  xlab("Data sharing habits") + ylab("Percentage") + scale_y_continuous(labels = scales::percent) +
  #geom_text(aes(label = ..count..), stat = "count", position = position_stack(vjust = 0.5)) +
  labs(fill = "Career stage")

## Q4 use of software ------------------------------------------------------

### bar chart of the use of software ----
data %>% select(num_range("Q4_",1:26))                              %>%
         pivot_longer(cols = everything(), values_to = "software")  %>%
         filter(software != 0)                                      %>%
         select(-name)                                              %>%
         ggplot(aes(x = software, fill = software)) +
         geom_bar(colour = "black") +
         theme_bw() +
         theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
         ylab("Number") + xlab("Software used") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5, size = 3) +
         theme(legend.position = "none")

### bar chart of the use of software with career ----
data %>% select(num_range("Q4_",1:26), career=Q20)                 %>%
  pivot_longer(cols = starts_with("Q4_"), values_to = "software")  %>%
  filter(software != 0)                                            %>%
  select(-name)                                                    %>%
  ggplot(aes(x = software, fill = career)) +
  geom_bar(colour = "black") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
  ylab("Number") + xlab("Software used") +
  geom_text(aes(label = ..count..), stat = "count", position = position_stack(vjust = 0.5), size = 3) +
  labs(fill = "Career stage")

### bar chart of the use of software with career percentages ----
data %>% select(num_range("Q4_",1:26), career=Q20)                 %>%
  pivot_longer(cols = starts_with("Q4_"), values_to = "software")  %>%
  filter(software != 0)                                            %>%
  select(-name)                                                    %>%
  ggplot(aes(x = software, fill = career)) +
  geom_bar(position = "fill", colour = "black") +
  scale_y_continuous(labels = scales::percent) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
  ylab("Number") + xlab("Software used") +
  labs(fill = "Career stage")

## Q5 Most important software in research ----------------------------------

### Tabulate software ----
important_software %>% select(starts_with("Q5"))             %>%
                       pivot_longer(cols =  everything(),
                                    names_to = "name",
                                    values_to = "software")  %>%
                       filter(!is.na(software))              %>%
                       group_by(software)                    %>%
                       tally()                               %>%
                       arrange(desc(n))

### Plot most important software ----
important_software %>% select(starts_with("Q5"))             %>%
                       pivot_longer(cols =  everything(),
                                    names_to = "name",
                                    values_to = "software")  %>%
                       filter(!is.na(software))              %>%
                       group_by(software)                    %>%
                       tally()                               %>%
                       filter(n > 2)                         %>%
                       ggplot(aes(x = software, y = n)) +
                       geom_col() + theme_bw() +
                       theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
                       geom_text(aes(x = software, label = n), vjust = -0.5) +
                       ylab("Number") + xlab("Most important software")

### Plot most important software with career----
bind_cols(data["Q20"], important_software) %>% select( career = Q20, starts_with("Q5")) %>%
  pivot_longer(cols =  starts_with("Q5"),
               names_to = "name",
               values_to = "software")                         %>%
  filter(!is.na(software))                                     %>%
  group_by( career, software)                                  %>%
  tally()                                                      %>%
  filter(n > 2)                                                %>%
  ggplot(aes(x = software, y = n, fill = career)) +
  geom_col(colour = "black") + theme_bw() +
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
  geom_text(aes(x = software, label = n), position = position_stack(vjust = 0.5), size = 3) +
  ylab("Number") + xlab("Most important software")

### Plot most important software with career percent ----
bind_cols(data["Q20"], important_software) %>% select( career = Q20, starts_with("Q5")) %>%
  pivot_longer(cols =  starts_with("Q5"),
               names_to = "name",
               values_to = "software")                         %>%
  filter(!is.na(software))                                     %>%
  group_by( career, software)                                  %>%
  tally()                                                      %>%
  filter(n > 2)                                                %>%
  ggplot(aes(x = software, y = n, fill = career)) +
  geom_col(position = "fill", colour = "black") + theme_bw() +
  scale_y_continuous(labels = scales::percent) +
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
  ylab("Percent") + xlab("Most important software")

# Create an output file with the contents
data %>% select(Q5)           %>%
         filter(!is.na(Q5))   %>%
         write_csv("../Data/Q5_MostImportantSoftware.csv")

### ToDo - normalise software ----

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

## Q6a Reasons for using OS ----

### Plot bar chart ----
data %>% select(starts_with("Q6_a"))        %>%
         pivot_longer(cols = everything(),
                      names_to = "names",
                      values_to = "UseOS")  %>%
         filter(UseOS != 0)                 %>%
         ggplot(aes(x = UseOS)) + geom_bar() + theme_bw() +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
         xlab("Reasons for using Open Source") + ylab("Number")

### Plot bar chart with career stage ----
data %>% select(career = Q20, starts_with("Q6_a"))        %>%
         pivot_longer(cols = starts_with("Q6_a"),
                      names_to = "names",
                      values_to = "UseOS")                %>%
         filter(UseOS != 0)                               %>%
         ggplot(aes(x = UseOS, fill = career)) +
         geom_bar(colour = "black") +
         theme_bw() +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
         xlab("Reasons for using Open Source") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", position = position_stack(vjust = 0.5))

## Q6b Reasons for not using OS ----

### Plot bar chart ----
data %>% select(starts_with("Q6_b"))        %>%
         pivot_longer(cols = everything(),
                      names_to = "names",
                      values_to = "UseOS")  %>%
         filter(UseOS != 0)                 %>%
         ggplot(aes(x = UseOS)) + geom_bar() + theme_bw() +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
         xlab("Reasons for not using Open Source") + ylab("Number")

### Plot bar chart with career stage ----
data %>% select(career = Q20, starts_with("Q6_b"))        %>%
         pivot_longer(cols = starts_with("Q6_b"),
                      names_to = "names",
                      values_to = "UseOS")                %>%
         filter(UseOS != 0)                               %>%
         ggplot(aes(x = UseOS, fill = career)) +
         geom_bar(colour = "black") +
         theme_bw() +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
         xlab("Reasons for not using Open Source") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", position = position_stack(vjust = 0.5))

## Q7 How software is maintained -------------------------------------------

### Bar chart of software maintenance ----
data %>% select(num_range("Q7_", 1:7))              %>%
         pivot_longer(cols = num_range("Q7_", 1:7),
                      names_to = "questions",
                      values_to = "swmaint")        %>%
         filter(swmaint != 0)                       %>%
         ggplot(aes(x = swmaint)) + geom_bar() +
         theme_bw() +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0)) +
         xlab("How Software is being maintained") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5)

## Q8 Using software in combination (workflow) -------

data %>% select(other = "Q8") %>%
  filter(!is.na(other))   -> a

data %>% select(other = "Q8") %>%
  filter(!is.na(other)) %>%
  write_csv("../Data/Q8_worfklows.csv"
            )
# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q9 Develop or extend software -------

### Bar chart -----
data %>% select("Q9") %>%
         ggplot(aes(x = Q9)) + geom_bar() +
         theme_bw() +
         xlab("Do you develop software?") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5)

### Bar chart segmented by career stage ----

data %>% select("Q9", career = "Q20")         %>%
         group_by(Q9, career)                 %>%
         mutate(n = n())                     %>%
         ggplot(aes(x = Q9, fill = career)) + geom_bar(colour = "black") +
         theme_bw() +
         xlab("Do you develop software?") + ylab("Number") + labs(fill = "Career stage") +
         geom_text(aes(label = n), position = position_stack(vjust = 0.5),
                  stat = "count", colour = "black", size = 3)

### Bar chart segmented by career stage with percentage  -----
N <- nrow(data)

data %>% select("Q9", career = "Q20")         %>%
         group_by(Q9, career)                 %>%
         mutate(per = scales::percent(n()/N, accuracy = 0.1)) %>%
         mutate(lab = paste(n(),"(",per,")")) %>%
         ggplot(aes(x = Q9, fill = career)) + geom_bar(colour = "black") +
         theme_bw() +
         xlab("Do you develop software?") + ylab("Number") + labs(fill = "Career stage") +
         geom_text(aes(label = lab), position = position_stack(vjust = 0.5),
                   stat = "count", colour = "black", size = 3)

## Q9a what software do you extend? ----------------------------------------

data %>% select(other = "Q9_a") %>%
  filter(!is.na(other))   -> a

nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q10 if you write your own software do yo: ------------------------------

### Bar chart ----
data %>% select(num_range("Q10_", 1:7))                 %>%
         select(num_range("Q10_", 1:7))                 %>%
         pivot_longer(cols = num_range("Q10_", 1:7),
                      names_to = "questions",
                      values_to = "swuse")              %>%
         filter(swuse != 0)                             %>%
         ggplot(aes(x = swuse)) + geom_bar() +
         theme_bw() +
         xlab("Who do you share your software with?") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

## Q10a Other ways of sharing data ----

data %>% select(other = "Q10_a") %>%
         filter(!is.na(other))   -> a

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q11 How did you acquire the skills necessary to utilise software --------

### Bar chart ----
data %>% select(num_range("Q11_", 1:12))                 %>%
         pivot_longer(cols = num_range("Q11_", 1:12),
                      names_to = "questions",
                      values_to = "skills")              %>%
         filter(skills != 0)                             %>%
         ggplot(aes(x = skills)) + geom_bar() +
         theme_bw() +
         xlab("Where skills are acquired") + ylab("Number") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Bar chart ----
data %>%  select(num_range("Q11_", 1:12), career = "Q20") %>%
          pivot_longer(cols = num_range("Q11_", 1:12),
                       names_to = "questions",
                       values_to = "skills")              %>%
          filter(skills != 0)                             %>%
          ggplot(aes(x = skills, fill = career)) +
          geom_bar(colour = "black") +
          theme_bw() +
          xlab("Where skills are acquired") + ylab("Number") + labs(fill = "Career stage") +
          geom_text(aes(x = skills, label = ..count..),
                    position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
          theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

## Q11a Other ways of acquiring skills ----

data %>% select(other = "Q11_a") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n\n")

## Q11b NCRM courses ----

### Tabulate courses attended ----------
data %>% select(num_range("Q11_b_", 1:22)) %>%
         pivot_longer(cols = num_range("Q11_b_", 1:22),
                      names_to = "questions",
                      values_to = "ncrm")              %>%
         filter(ncrm != 0)                             %>%
         group_by(ncrm)                                %>%
         tally()                                       %>%
         arrange(desc(n))

# Enumerate the "Other" comments
data %>% select(other = "Q11_b_i") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q12 Development and maintenance of research software rewarded/recognised --------

### Plot a Bar chart ----
data %>%  select(rew = "Q12") %>%
          ggplot(aes(x = rew)) + geom_bar() +
          theme_bw() +
          xlab("Development/Maintenance of rsearch software rewarded/recognised") +
          ylab("Number") +
          geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
          theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Plot a Bar chart segmented by career ----
data %>%  select(rew = "Q12", career = "Q20") %>%
          ggplot(aes(x = rew, fill = career)) +
          geom_bar(colour = "black") +
          theme_bw() +
          xlab("Development/Maintenance of rsearch software rewarded/recognised") +
          ylab("Number") + labs(fill = "Career stage") +
          geom_text(aes(x = rew, label = ..count..),
                    position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
          theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Q12a Other ----

data %>% select(other = "Q12_a") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n\n")

## Q13 Questions about software ----

### Q13a I am aware of how the software I use is funded, managed and licensed ----

#### Barplot ----
data %>% select(num_range("Q13_1_",1:5))            %>%
         pivot_longer(cols = everything(),
                      names_to = "questions",
                      values_to = "understanding")  %>%
         filter(understanding != 0)                 %>%
         ggplot(aes(x = understanding)) + geom_bar(colour = "black") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme_bw() + ylab("Number") +
         xlab("Aware of how s/w I use is funded, managed and licensed")

#### Tabulation check
data %>% select(num_range("Q13_1_",1:5))            %>%
         pivot_longer(cols = everything(),
                      names_to = "questions",
                      values_to = "understanding")  %>%
         group_by(understanding)                    %>%
         tally()

### Q13b My institution/funder's policies on how software is funded, managed and licensed are clear to me ----

#### Barplot ----
data %>% select(num_range("Q13_2_",1:5))            %>%
         pivot_longer(cols = everything(),
                      names_to = "questions",
                      values_to = "understanding")  %>%
         filter(understanding != 0)                 %>%
         ggplot(aes(x = understanding)) + geom_bar(colour = "black") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme_bw() + ylab("Number") +
         xlab("Aware of how instituion/funder's policies on how s/w is funded, managed and licensed")

### Q13c There is insufficient attention paid to software funding, management and licensing by the economic and social sciences research community ----

#### Barplot ----
data %>% select(num_range("Q13_3_",1:5))            %>%
         pivot_longer(cols = everything(),
                      names_to = "questions",
                      values_to = "understanding")  %>%
         filter(understanding != 0)                 %>%
         ggplot(aes(x = understanding)) + geom_bar(colour = "black") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme_bw() + ylab("Number") +
         xlab("Insufficient awareness on how s/w is funded, managed and licensed by the community")

### Q13d There is insufficient incentive for me to learn how my software is funded, managed and licensed  ----

#### Barplot ----
data %>% select(num_range("Q13_4_",1:5))            %>%
         pivot_longer(cols = everything(),
                      names_to = "questions",
                      values_to = "understanding")  %>%
         filter(understanding != 0)                 %>%
         ggplot(aes(x = understanding)) + geom_bar(colour = "black") +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         theme_bw() + ylab("Number") +
         xlab("Insufficient incentive for me to learn how my s/w is funded, managed and licensed")

## Q14 Where do you normally run your digital tools/software? --------

### Bar chart ----
data %>%  select(num_range("Q14_", 1:9))         %>%
  pivot_longer(cols = num_range("Q14_", 1:9),
               names_to = "questions",
               values_to = "runon")              %>%
  filter(runon != 0)                             %>%
  ggplot(aes(x = runon)) +
  geom_bar(colour = "black") +
  theme_bw() +
  xlab("Where software is run") + ylab("Number") +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Bar chart with career segmentation ----
data %>%  select(num_range("Q14_", 1:9), career = "Q20") %>%
          pivot_longer(cols = num_range("Q14_", 1:9),
                       names_to = "questions",
                       values_to = "runon")              %>%
          filter(runon != 0)                             %>%
          ggplot(aes(x = runon, fill = career)) +
          geom_bar(colour = "black") +
          theme_bw() +
          xlab("Where software is run") + ylab("Number") + labs(fill = "Career stage") +
          geom_text(aes(x = runon, label = ..count..),
                       position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
          theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

## 14a Other places where software is run -----

data %>% select(other = "Q14_a") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n\n")

## Q15 Licensing Awareness -----

### Bar chart ----
data %>% select(starts_with("Q15_"), -"Q15_a") %>%
         pivot_longer(cols = everything(),
                      names_to = "columns",
                      values_to ="aware") %>%
         filter(aware != 0) %>%
         ggplot(aes(x = aware)) +
         geom_bar(colour = "black") +
         theme_bw() +
         geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
         ylab("Number") + xlab("Aware of the policy for")

### Bar chart segmented by career stage----
data %>% select(starts_with("Q15_"), -"Q15_a", career = "Q20") %>%
         pivot_longer(cols = starts_with("Q15"),
                      names_to = "columns",
                      values_to ="aware") %>%
        filter(aware != 0) %>%
        ggplot(aes(x = aware, fill = career)) +
        geom_bar(colour = "black") +
        theme_bw() +
        geom_text(aes(x = aware, label = ..count..),
                 position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
        ylab("Number") + xlab("Aware of the policy for")

### Percentage bar chart segmented by career stage----
data %>% select(starts_with("Q15_"), -"Q15_a", career = "Q20") %>%
         pivot_longer(cols = starts_with("Q15"),
                      names_to = "columns",
                      values_to ="aware") %>%
         filter(aware != 0) %>%
         ggplot(aes(x = aware, fill = career)) +
         geom_bar(position = "fill", colour = "black") +
         theme_bw() + scale_y_continuous(labels = scales::percent) +
         ylab("Percentage") + xlab("Aware of the policy for") + labs(fill = "Career stage")

## Percentage bar chart segmented by gender ----
data %>% select(starts_with("Q15_"), -"Q15_a", gender = "Q21") %>%
         pivot_longer(cols = starts_with("Q15"),
                      names_to = "columns",
                      values_to ="aware") %>%
         filter(aware != 0) %>%
         ggplot(aes(x = aware, fill = gender)) +
         geom_bar(position = "fill", colour = "black") +
         theme_bw() + scale_y_continuous(labels = scales::percent) +
        ylab("Percentage") + xlab("Aware of the policy for") + labs(fill = "Gender")

### Awareness vs institution -----
data %>% select(Institutions = CleanLocs, starts_with("Q15_"), -"Q15_a") %>%
         pivot_longer(cols = starts_with("Q15"),
                      names_to = "columns",
                      values_to ="aware")                                %>%
         filter(aware != 0)                                              %>%
         group_by(aware, Institutions)                                   %>%
         tally()                                                         %>%
         ggplot(aes(x = aware, y = Institutions, size = n)) +
         geom_point() +
         theme_bw() +
         theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
         theme(axis.text.y = element_text(size = 6)) +
         ylab("Institutions") + xlab("Aware of the policy for") +
         labs(size = "Number")

### Awareness vs discipline
data %>% select(num_range("Q19_", 1:22), starts_with("Q15_"), -"Q15_a")  %>%
         pivot_longer(cols = starts_with("Q15"),
                      names_to = "columns",
                      values_to ="aware")                                %>%
         pivot_longer(cols = num_range("Q19_", 1:22),
                      names_to = "questions",
                      values_to = "disciplines")                         %>%
        filter(disciplines != 0 & aware != 0)                            %>%
        group_by(aware, disciplines)                                     %>%
        tally()                                                          %>%
        ggplot(aes(x = aware, y = disciplines, size = n)) +
        geom_point() +
        theme_bw() +
        theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
        theme(axis.text.y = element_text(size = 6)) +
        ylab("Disciplines") + xlab("Aware of the policy for") +
        labs(size = "Number")

## Q15a Other policy awareness ----

data %>% select(other = "Q15_a") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q16 barriers to the use of software -------------------------------------

### Bar chart ----
data %>%  select(num_range("Q16_", 1:13), career = "Q20") %>%
          pivot_longer(cols = num_range("Q16_", 1:13),
                       names_to = "questions",
                       values_to = "barriers")             %>%
          filter(barriers != 0)                            %>%
          ggplot(aes(x = barriers, fill = career)) +
          geom_bar(colour = "black") +
          theme_bw() +
          xlab("Barriers to software use") + ylab("Number") + labs(fill = "Career stage") +
          geom_text(aes(x = barriers, label = ..count..),
                    position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
          theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Bar chart with career segmentation ----
data %>%  select(num_range("Q16_", 1:13))                 %>%
  pivot_longer(cols = num_range("Q16_", 1:13),
               names_to = "questions",
               values_to = "barriers")            %>%
  filter(barriers != 0)                           %>%
  ggplot(aes(x = barriers)) +
  geom_bar(colour = "black") +
  theme_bw() +
  xlab("Barriers to software use") + ylab("Number") +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

## Q16a Other barriers ------------------

data %>% select(other = "Q16_a") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n\n")

## Q17 Institutional affiliation -------------------------------------------

### Top 12 institutions ----
data %>% select(Institution = CleanLocs) %>%
         filter(!is.na(Institution))     %>%
         group_by(Institution)           %>%
         tally()                         %>%
         arrange(desc(n))                %>%
         head(n = 12)

### Map institutions - World ----
data %>%  select(Institutions = CleanLocs, Latitude, Longitude) %>%
          filter(!is.na(Institutions) & !is.na(Latitude))       %>%
          group_by(Institutions)                                %>%
          mutate(N = n())                                       %>%
          leaflet()                                             %>%
          addTiles()                                            %>%
          addCircleMarkers(lng = ~Longitude, lat = ~Latitude, radius = ~N*0.1)

### Map institutions - UK ----
data %>%  select(Institutions = CleanLocs, Latitude, Longitude) %>%
          filter(!is.na(Institutions) & !is.na(Latitude))       %>%
          filter(-7 <= Longitude & Longitude <= 1.6)            %>%
          filter(49 <= Latitude & Latitude <= 59)               %>%
          group_by(Institutions)                                %>%
          mutate(N = n())                                       %>%
          leaflet()                                             %>%
          addTiles()                                            %>%
          addCircleMarkers(lng = ~Longitude, lat = ~Latitude, radius = ~N)

### Tabulate Institutions and disciplines -----
data %>% select(Institutions = CleanLocs, num_range("Q19_", 1:22)) %>%
         pivot_longer(cols = num_range("Q19_", 1:22),
                      names_to = "questions",
                      values_to = "disciplines")                  %>%
         filter(disciplines != 0)                                 %>%
         group_by(disciplines, Institutions)                      %>%
         tally()                                                  %>%
         arrange(desc(n))

### Plot Institutions and disciplines -----
data %>% select(Institutions = CleanLocs, num_range("Q19_", 1:22)) %>%
  pivot_longer(cols = num_range("Q19_", 1:22),
               names_to = "questions",
               values_to = "disciplines")                          %>%
  filter(disciplines != 0)                                         %>%
  group_by(disciplines, Institutions)                              %>%
  tally()                                                          %>%
  ggplot(aes(x = disciplines, y = Institutions, size = n)) +
  geom_point() +
  theme_bw() +
  theme(axis.text.x = element_text(angle = -90, vjust = 0.5, hjust=0)) +
  theme(axis.text.y = element_text(size = 6)) +
  ylab("Institutions") + xlab("Discipline") + labs(size = "Number")

## Q18 Who has funded you within the last 5 years -------------

data %>% select(other = "Q18") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q19 Research discipline -------------------------------------------------

### Bar chart for research disciplines -----------
data %>%  select(num_range("Q19_", 1:22))               %>%
          pivot_longer(cols = num_range("Q19_", 1:22),
                       names_to = "questions",
                      values_to = "disciplines")        %>%
          filter(disciplines != 0)                      %>%
          ggplot(aes(x = disciplines)) +
          geom_bar(colour = "black") +
          theme_bw() +
          xlab("Discipline") + ylab("Number") +
          geom_text(aes(x = disciplines, label = ..count..),
                    position = position_stack(vjust = 0.5), stat = "count", colour = "white") +
          theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Bar chart with careers -----------
data %>%  select(num_range("Q19_", 1:22), career = "Q20")  %>%
          pivot_longer(cols = num_range("Q19_", 1:22),
                       names_to = "questions",
                       values_to = "disciplines")          %>%
          filter(disciplines != 0)                         %>%
          ggplot(aes(x = disciplines, fill = career)) +
          geom_bar(colour = "black") +
          theme_bw() +
          xlab("Discipline") + ylab("Number") + labs(fill = "Career stage") +
          geom_text(aes(x = disciplines, label = ..count..),
                    position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
          theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Bar chart with careers -----------
N <-  nrow(data)
data %>%  select(num_range("Q19_", 1:22), career = "Q20") %>%
  pivot_longer(cols = num_range("Q19_", 1:22),
               names_to = "questions",
               values_to = "disciplines")                 %>%
  filter(disciplines != 0)                                %>%
  group_by(disciplines, career)                           %>%
  mutate(n = n())                                         %>%
  mutate(per = scales::percent(n/N, accuracy = 0.1))      %>%
  ggplot(aes(x = disciplines, fill = career)) +
  geom_bar(position = "fill", colour = "black") +
  theme_bw() + scale_y_continuous(labels = scales::percent) +
  xlab("Discipline") + ylab("Percentage") + labs(fill = "Career stage") +
  # geom_text(aes(x = disciplines, y = n/N, label = per),
  #            position = position_stack(vjust = 0.5), colour = "black") +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Percentage graph ------------
data %>%  select(num_range("Q19_", 1:22), career = "Q20") %>%
  pivot_longer(cols = num_range("Q19_", 1:22),
               names_to = "questions",
               values_to = "disciplines")                 %>%
  filter(disciplines != 0)                                %>%
  group_by(disciplines, career)                           %>%
  mutate(n = n())                                         %>%
  mutate(y = n/N)                                         %>%
  mutate(per = scales::percent(n/N, accuracy = 0.1))      %>%
  distinct(disciplines, career, per, y)                   %>%
  ggplot(aes(x = disciplines, y = y, fill = career)) +
  geom_col(position = "fill", colour = "black") +
  # geom_text(aes(x = disciplines, y = y, label = per), size = 1.5,
  #             position = position_stack(vjust = 0.5), colour = "black") +
  theme_bw() + scale_y_continuous(labels = scales::percent) +
  xlab("Discipline") + ylab("Percentage") + labs(fill = "Career stage") +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Bar chart of Research discipline and Gender ----
data %>%  select(num_range("Q19_", 1:22), gender = Q21)           %>%
          pivot_longer(cols = num_range("Q19_", 1:22),
                       names_to = "questions",
                       values_to = "disciplines")                 %>%
          filter(disciplines != 0)                                %>%
  ggplot(aes(x = disciplines, fill = gender)) +
  geom_bar(colour = "black") +
  theme_bw() +
  xlab("Discipline") + ylab("Number") + labs(fill = "Gender") +
  geom_text(aes(x = disciplines, label = ..count..),
            position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Percentage bar chart of Research discipline and Gender ----
data %>%  select(num_range("Q19_", 1:22), gender = Q21)           %>%
          pivot_longer(cols = num_range("Q19_", 1:22),
                       names_to = "questions",
                       values_to = "disciplines")                 %>%
          filter(disciplines != 0)                                %>%
  ggplot(aes(x = disciplines, fill = gender)) +
  geom_bar(position = "fill", colour = "black") +
  theme_bw() + scale_y_continuous(labels = scales::percent) +
  xlab("Discipline") + ylab("Number") + labs(fill = "Gender") +
  # geom_text(aes(x = disciplines, label = ..count..),
  #           position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
  theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

## Q19a Other disciplines -------------

data %>% select(other = "Q19_a") %>%
  filter(!is.na(other))   -> a

# Number of responses
nrow(a)

# Print out the output
cat(str_wrap(a$other, width = 80), sep = "\n")

## Q20 Career stage --------------------------------------------------------

### Bar chart of the career stages ----
data %>%  select(career = Q20) %>%
          ggplot(aes(x = factor(career, levels = career_order))) +
          geom_bar() +
          theme_bw() +
          xlab("Career stage") + ylab("Number")  +
          geom_text(aes(x = factor(career, levels = career_order), label = ..count..),
                    position = position_stack(vjust = 0.5), stat = "count", colour = "white")

## Q21 Gender --------------------------------------------------------------

### Bar chart of gender population ----
data %>% select(gender = Q21)                                   %>%
         mutate(gender = factor(gender, levels = gender_order)) %>%
         ggplot(aes(x = gender)) +
         geom_bar() +
         theme_bw() +
         geom_text(aes(label = ..count..), position = position_stack(vjust = 0.5), stat = "count", colour = "white") +
         xlab("Gender") + ylab("Number")

### Gender segmented by career stage ----
data %>% select(gender = Q21, career = Q20) %>%
         group_by(gender, career)           %>%
         ggplot(aes(x = factor(gender, levels = gender_order),
                   fill = factor(career, levels = career_order))) +
         geom_bar(colour = "black") + theme_bw() +
         geom_text(aes(label = ..count..), position = position_stack(vjust = 0.5),
                   stat = "count", colour = "black", size = 2.5) +
         xlab("Gender") + ylab("Number") + labs(fill = "Career stage") +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Percentage gender segmented by career stage ----
data %>% select(gender = Q21, career = Q20) %>%
         group_by(gender, career)           %>%
         ggplot(aes(x = factor(gender, levels = gender_order),
                fill = factor(career, levels = career_order))) +
         geom_bar(position = "fill", colour = "black") + theme_bw() +
         scale_y_continuous(labels = scales::percent) +
         # geom_text(aes(label = ..count..), position = position_stack(vjust = 0.5),
         #           stat = "count", colour = "black", size = 2.5) +
        xlab("Gender") + ylab("Number") + labs(fill = "Career stage") +
        theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

### Gender vs Career stage ----
data %>% select(gender = Q21, career = Q20) %>%
         group_by(gender, career)           %>%
         mutate(size = n())                 %>%
         ggplot(aes(x = factor(gender, levels = gender_order),
                    y = factor(career, levels = career_order), colour = size)) +
         geom_point(aes(size = size)) + theme_bw() +
         geom_text(aes(x = factor(gender, levels = gender_order),
                       y = factor(career, levels = career_order), label = size), vjust = 2) +
         xlab("Gender") + ylab("Career stage") + theme(legend.position = "none") +
         theme(axis.text.x = element_text(angle = -45, vjust = 0.5, hjust=0))

## Q22 Ethnic group ----

### Tabulate ethnicity ----
data %>% select(ethnicity = "Q22") %>%
         group_by(ethnicity)       %>%
         tally()                  %>%
         arrange(desc(n))

### Tabulate ethnicity with career stage ----
data %>% select(ethnicity = "Q22", career = "Q20") %>%
         group_by(ethnicity, career)               %>%
         tally()                                   %>%
         arrange(desc(n))

### Tabulate ethnicity, career stage and gender ----
data %>% select(ethnicity = "Q22", career = "Q20", gender = "Q21") %>%
         group_by(gender, ethnicity, career)                       %>%
         tally()                                                   %>%
         arrange(desc(n))

### Graphical representation of ethnicity, gender and career stage.
data %>% select(ethnicity = "Q22", career = "Q20", gender = "Q21") %>%
         group_by(gender, ethnicity, career)                       %>%
         tally()                                                   %>%
         ggplot(aes(x = career, y = ethnicity, size = n, colour = gender)) +
         geom_point(alpha = 0.25) + geom_jitter() + theme_bw() +
         xlab("Career stage") + ylab("Ethnicity") +
  labs(colour = "Gender", size = "Number")

## Q28 Comments about the survey ----

data %>% select(comments = "Q28") %>%
         filter(!is.na(comments)) -> a

# Number of answers
nrow(a)

# Print out the output
cat(str_wrap(a$comments, width = 80), sep = "\n")
