library("dplyr")
library("stringr")
library("tidyverse")

books <- read.csv("C:/Users/Tim/Documents/Info201code/2017-2023-10-Checkouts-SPL-Data.csv")

num_digital_checkouts <- books%>%filter(UsageClass == "Digital")%>%summarise(num_checkouts = sum(Checkouts))%>%pull(num_checkouts)

num_physical_checkouts <- books%>%filter(UsageClass == "Physical")%>%summarise(num_checkouts = sum(Checkouts))%>%pull(num_checkouts)

total_checkouts <- books%>%summarise(total = sum(Checkouts))%>%pull(total)

publication_types <- books%>%summarize(types = length(unique(MaterialType)))%>%pull(types)

most_viewed <- books%>%filter(MaterialType == "BOOK")%>%group_by(Title)%>%summarise(num_checouts = sum(Checkouts))%>%filter(num_checouts == max(num_checouts))%>%pull(Title)


