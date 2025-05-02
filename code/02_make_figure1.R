# 02_make_figure1.R

here::i_am("code/02_make_figure1.R")

library(ggplot2)
library(here)

data <- readr::read_csv(here::here("data", "male_w_heartattack_analysis.csv"))

# Data management
data <- data %>%
  mutate(age_heart_attack = replace_na(age_heart_attack, 0))

# Create histogram
figure1 <- ggplot(data, aes(x = age_heart_attack)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Age at First Heart Attack",
       x = "Age at Heart Attack",
       y = "Frequency of Heart Attacks")


saveRDS(figure1, here::here("output", "figure1.rds"))

