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

## Q20 career stage ------------------------------------------------------
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

# Look at the questions ---------------------------------------------------

## Q2 Do you create or re-use data to undertake your research? --------
# 1	Create new data (including primary data collection and data generation)
# 2	Re-use existing data

# Bar chart of the use of data ßsegmented by career stage
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

# Percentage segments
data %>% select(create=Q2_1, reuse=Q2_2, career=Q20)                   %>%
  pivot_longer(cols = c("create", "reuse"), values_to = "datause")     %>%
  select(!name)                                                        %>%
  ggplot(aes(x = datause, fill = factor(career, levels = career_order))) +
  geom_bar(position = "fill", colour = "black") +
  theme_bw() +
  xlab("Use of data") + ylab("Number of responses") +
  labs(fill = "Career stage") +
  scale_fill_brewer(palette = "Set1", name = "Career stage", breaks = career_order) +
  scale_y_continuous(labels = scales::percent)


## Q20 career stage --------------------------------------------------------



## Q21 Gender --------------------------------------------------------------

data %>% select(gender = Q21) %>%
         mutate(gender = factor(gender, levels = gender_order)) %>%
         ggplot(aes(x = gender)) + geom_bar() +
         theme_bw() +
         xlab("Gender") + ylab("Number")

