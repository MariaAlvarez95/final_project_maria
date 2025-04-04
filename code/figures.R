# scripts/figures.R

library(ggplot2)

# Load the prepared data
load("data/prepared_data.RData")

# Figure 1: Distribution of Age at First Heart Attack
figure1 <- ggplot(data, aes(x = age_heart_attack)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Age at First Heart Attack",
       x = "Age at Heart Attack",
       y = "Frequency of Heart Attacks")

# Save Figure 1
ggsave("figures/figure1.png", plot = figure1)

# Figure 2: Family Income Level Distribution in Men Who Have Presented a Heart Attack
figure2 <- ggplot(data, aes(x = factor(Family_Income_Level, levels = c("<$25K", "$25K-$50K", "$50K-$100K", "$100K-$200K", ">=$200K")))) +
  geom_bar(fill = "lightgreen", color = "black") +
  labs(title = "Family Income Level Distribution in Men Who Have Presented a Heart Attack",
       x = "Income Level",
       y = "Frequency") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save Figure 2
ggsave("figures/figure2.png", plot = figure2)
