library("ggplot2")
library("dplyr")
library("stringr")
library("tidyverse")

books <- read.csv("C:/Users/Tim/Documents/Info201code/2017-2023-10-Checkouts-SPL-Data.csv")

interesting_types <- c("BOOK", "EBOOK", "COMIC", "AUDIOBOOK", "VIDEODISC", "MUSIC", "MAGAINE", "MOVIE")

type_per_year <- books%>%
  filter(MaterialType %in% interesting_types)%>%
  group_by(MaterialType, CheckoutYear)%>%
  filter(CheckoutYear != 2023)%>%
  summarise(checkouts = sum(Checkouts))

ggplot(data = type_per_year) +
  geom_line(aes(x = CheckoutYear, y = checkouts, color = MaterialType)) +
  labs(title = "Type of Checkouts", x = "Year", y = "Number of Checkouts", color = "Publication Type")
