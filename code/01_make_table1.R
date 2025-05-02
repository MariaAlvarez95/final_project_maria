# 01_make_table1.R

here::i_am("code/01_make_table1.R")

library(readr)
library(dplyr)
library(tidyr)
library(labelled)
library(gtsummary)

data <- readr::read_csv(here::here("data", "male_w_heartattack_analysis.csv"))

# NA management
data <- data %>%
  mutate(across(where(is.character), ~ tidyr::replace_na(., "Missing"))) %>%
  mutate(across(where(is.numeric), ~ tidyr::replace_na(., 0)))

# Label variables
var_label(data) <- list(
  Interview_Year = "Interview Year",
  income = "Income",
  Family_Income_Level = "Family Income Level",
  age_group = "Age Group",
  sex = "Sex",
  marriage = "Marital Status",
  heart_attack = "Heart Attack",
  age_heart_attack = "Mean Age of First Heart Attack",
  hypertension = "Hypertension",
  diabetes = "Diabetes",
  education = "Education Level",
  race_category = "Race"
)

# Descriptive table
table1 <- data %>%
  select(age_group, sex, marriage, heart_attack, age_heart_attack, Family_Income_Level, 
         education, hypertension, diabetes) %>%
  tbl_summary(by = age_group, missing = "no") %>%
  modify_spanning_header(all_stat_cols() ~ "**Age Group**") %>%
  add_overall() %>%
  add_p()

# Save table
saveRDS(table1, here::here("output", "table1.rds"))

