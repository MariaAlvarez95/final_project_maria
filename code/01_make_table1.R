# 01_make_table1.R

library(readr)
library(dplyr)
library(labelled)
library(gtsummary)

data <- read_csv("data/male_w_heartattack_analysis.csv")

# Create descriptive table
var_label(data) <- list(
  Interview_Year = "Interview Year",
  personID = "Person ID",
  income = "Income",
  Family_Income_Level = "Family Income Level",
  age_group = "Age Group",
  sex = "Sex",
  marriage = "Marital Status",
  heart_attack = "Heart Attack",
  age_heart_attack = "Mean Age of First Heart Attack",
  MI_medication = "Heart Attack Medication",
  stroke = "Stroke",
  stroke_medication = "Stroke Medication",
  chronic_HD = "Chronic Heart Disease",
  chronic_HD_medication = "Chronic Heart Disease Medication",
  hypertension = "Hypertension",
  HTN_medication = "Hypertension Medication",
  diabetes = "Diabetes",
  psychiatry = "Psychiatric Conditions",
  insurance = "Insurance",
  education = "Education Level",
  race_category = "Race",
  children = "Number of Children",
  age = "Age"
)

table1 <- data %>%
  select("age_group", "sex", "marriage", "heart_attack", "age_heart_attack", "Family_Income_Level", "education", "diabetes", "hypertension", "psychiatry") %>%
  tbl_summary(by = age_group) %>%
  modify_spanning_header(all_stat_cols() ~ "**Age Group**") %>%
  add_overall() %>%
  add_p()

# Save table
saveRDS(table1, "output/table1.rds")

