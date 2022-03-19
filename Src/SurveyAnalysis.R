#!/usr/bin/env Rscript
#
# Analyse and plot graph results
#


# Load pcackages ----------------------------------------------------------

library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(RColorBrewer)


# Read then data ----------------------------------------------------------

data <- read_xlsx("../Data/survey-results.xlsx")

key <- read_xlsx("../Data/survey-results-key.xlsx")


# Q2 Do you create or re-use data to undertake your research? --------
# 1	Create new data (including primary data collection and data generation)
# 2	Re-use existing data

# Relabel career stage with NAs as other
data$Q20[is.na(data$Q20)] <- "Other"

# Establish a career stage order
career_order <-  c("Junior","Early","Mid","Senior","Other")

# Bar chart of the use of data ßsegmented by career stage
data %>% select(create=Q2_1, reuse=Q2_2, career=Q20)                         %>%
         mutate(create = recode(create, `0` = "nocreate" , `1` = "create"),
                reuse = recode(reuse, `0` = "noreuse", `1` = "reuse"),
                career = recode(career, `1` = "Junior", `2` = "Early",
                                `3` = "Mid", `4` = "Senior", `5` = "Other")) %>%
        mutate(career = factor(career, levels = career_order))               %>%
        pivot_longer(cols = c("create", "reuse"), values_to = "datause")     %>%
        select(!name)                                                        %>%
        ggplot(aes(x = datause, fill = career)) +
        geom_bar(colour = "black",) +
        theme_bw() +
        xlab("Use of data") + ylab("Number of responses") +
        geom_text(aes(x = datause, label = ..count..),
                  position = position_stack(vjust = 0.5), stat = "count", colour = "black") +
        scale_fill_brewer(palette = "Set1", name = "Career stage", breaks = career_order)

data %>% select(create=Q2_1, reuse=Q2_2, career=Q20)                   %>%
  mutate(create = recode(create, `0` = "nocreate" , `1` = "create"),
         reuse = recode(reuse, `0` = "noreuse", `1` = "reuse"),
         career = recode(career, `1` = "Junior", `2` = "Early",
                         `3` = "Mid", `4` = "Senior", `5` = "Other"))  %>%
  mutate(career = factor(career, levels = career_order))               %>%
  pivot_longer(cols = c("create", "reuse"), values_to = "datause")     %>%
  select(!name)                                                        %>%
  ggplot(aes(x = datause, fill = career)) +
  geom_bar(position = "fill", colour = "black") +
  theme_bw() +
  xlab("Use of data") + ylab("Number of responses") +
  labs(fill = "Career stage") +
  scale_fill_discrete(breaks = career_order) +
  scale_y_continuous(labels = scales::percent)

# Q20 career stage --------------------------------------------------------
#
# 1	Phase 1 - Junior (e.g. PhD candidate, Junior Research Software Engineer)
# 2	Phase 2 - Early (e.g Research Assistant/Associate, first grant holder,
#             Lecturer, Research Software Engineer)
# 3	Phase 3 - Mid / Recognised (e.g. Senior Lecturer, Reader, Senior Researcher,
#             Senior Research Software Engineer, Research Software Group Leader)
# 4	Phase 4 - Established / Experienced / Senior (e.g. Professor, Director of
#             Research Computing, Distinguished Engineer, Chief Data Scientist)
# 5	Other


# Q21 Gender --------------------------------------------------------------
# 1	Woman
# 2	Man
# 3	Non-binary person
# 4	Prefer not to disclose
# 5	Other

