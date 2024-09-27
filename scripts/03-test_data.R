#### Preamble ####
# Purpose: Check Victims of Crime Data for Any Issues 
# Author: Kevin Roe
# Date: 22 September 2024
# Contact: kevin.roe@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run the files "01-download_data.R" and "02-data_cleaning.R"
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

#### Test data ####
data <- read_csv("data/analysis_data/analysis_data.csv")

# Check the class of the columns

data$"CrimeType" |> class() == "character"

data$"AssaultType" |> class() == "character"

data$"Sex" |> class() == "character"

data$"AgeGroup" |> class() == "character"

data$"Count" |> class() == "numeric"


# Test for negative numbers
data$"Count" |> min() <= 0

# Test for NAs
all(is.na(data$"Count"))
all(is.na(data$"AssaultType"))

# Check that the only Sex types listed are  Male, Female, and Unknown
data$"Sex" |> 
  unique() |>
  sort() ==  sort(c("Male", "Female", "Unknown"))








