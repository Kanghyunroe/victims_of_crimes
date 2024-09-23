#### Preamble ####
# Purpose: Check Victims of Crime Data for Any Issues 
# Author: Kevin Roe
# Date: 22 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

#### Test data ####
data <- read_csv("data/raw_data/simulated.csv")

# Test for negative numbers
data$count |> min() <= 0

# Test for NAs
all(is.na(data$count))
all(is.na(data$AssaultType))







