# Create a bar plot of family income levels
ggplot(data, aes(x = factor(Family_Income_Level, levels = c("<$25K", "$25K-$50K", "$50K-$100K", "$100K-$200K", ">=$200K")))) +
  geom_bar(fill = "lightgreen", color = "black") +
  labs(title = "Family Income Level Distribution in Men Who Have Presented a Heart Attack",
       x = "Income Level",
       y = "Frequency") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("output/figure2.png", plot = figure2)