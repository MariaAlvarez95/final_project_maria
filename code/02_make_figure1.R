# 02_make_figure1.R

library(readr)
library(ggplot2)

data <- read_csv("data/male_w_heartattack_analysis.csv")

# Figure 1
figure1 <- ggplot(data, aes(x = age_heart_attack)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Age at First Heart Attack",
       x = "Age at Heart Attack",
       y = "Frequency of Heart Attacks")

ggsave("output/figure1.png", plot = figure1)
