
library(dplyr)
library(magrittr)
library(purrr)
library(tidyr)
library(broom)
library(tibble)
library(readr)


#Loading training data
Master <-read.csv("https://raw.githubusercontent.com/RWorkshop/workshopdatasets/master/loanprediction/LoanPrediction.csv")

#Looking at the structure of the data
glimpse(Master)
