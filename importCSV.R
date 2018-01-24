# Old Way / Base R

GE1 <- read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/GEdata.csv")

# New Way / Tidyverse

library(readr)

GE2 <- read_csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/GEdata.csv")

# What is the Difference?

library(dplyr)

glimpse(GE1)
glimpse(GE2)
