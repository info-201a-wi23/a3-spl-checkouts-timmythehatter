library("ggplot2")
library("dplyr")
library("stringr")
library("tidyverse")

books <- read.csv("C:/Users/Tim/Documents/Info201code/2017-2023-10-Checkouts-SPL-Data.csv")

books <- books%>%mutate(Title = substr(Title, 1, 30))

top_books <- books%>%
  filter(MaterialType == "BOOK")%>%
  group_by(CheckoutYear, Title)%>%
  mutate(CheckoutsInYear = sum(Checkouts))

top_books <- top_books%>%
  group_by(CheckoutYear)%>%
  distinct(Title, .keep_all = T)%>%
  arrange(desc(CheckoutsInYear))%>%
  slice(1:5)



ggplot(top_books) +
  geom_col(aes(x = Title, y = CheckoutsInYear, fill = CheckoutYear)) +
  labs(title = "Top 5 Books from Each Year", x = "Book Names", y = "Number of Checkouts", fill = "Year In the Spotlight") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
  

  