library("ggplot2")
library("dplyr")
library("stringr")
library("tidyverse")

books <- read.csv("C:/Users/Tim/Documents/Info201code/2017-2023-10-Checkouts-SPL-Data.csv")

medium_per_year <- books%>%group_by(UsageClass, CheckoutYear)%>%summarise(checkouts = sum(Checkouts))

ggplot(data = medium_per_year) + 
  geom_col(aes(x = CheckoutYear, y = checkouts, fill = UsageClass)) +
  labs(title = "Digital v Physical Checkouts", x = "Year", y = "Number of Checkouts", fill = "Type") +
  scale_y_continuous(breaks = seq(0, 4000000, 250000))
