# scripts/descriptive_statistics.R

library(dplyr)
library(gtsummary)

# Load the prepared data
load("data/prepared_data.RData")

# Create the summary table
summary_table <- data %>%
  select("age_group", "sex", "marriage", "heart_attack", "age_heart_attack", "Family_Income_Level", "education", "diabetes", "hypertension", "psychiatry") %>%
  tbl_summary(by = age_group) %>%
  modify_spanning_header(all_stat_cols() ~ "**Age Group**") %>%
  add_overall() %>%
  add_p()

# Save the summary table
save(summary_table, file = "data/summary_table.RData")
