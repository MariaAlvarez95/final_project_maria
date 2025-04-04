# scripts/data_preparation.R

library(readr)
library(dplyr)
library(labelled)

# Load the data
data <- read_csv("data/male_w_heartattack_analysis.csv")

# Label the variables
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

# Save the prepared data
save(data, file = "data/prepared_data.RData")
