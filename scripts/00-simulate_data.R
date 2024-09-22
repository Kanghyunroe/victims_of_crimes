#### Preamble ####
# Purpose: Simulates data
# Author: Kevin Roe
# Date: 21 September 2024
# Contact: kevin.roe@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####

# install.packages("tidyverse")
library(tidyverse)


#### Simulate data ####
set.seed(369)

data <- 
  tibble(
    # Use 1 through to 1244 to represent unique IDs
    id = 1:1244,
    
    # Randomly assign years
    report_year = sample(2014:2023, size = 1244, replace = TRUE),
    
    # Set category to "Crimes Against the Person" for all rows
    category = "Crimes Against the Person",
    
    # Randomly pick subtype
    subtype = sample(c("Assault", "Theft", "Burglary", "Other"), size = 1244, 
                       replace = TRUE),
    
    # Randomly assign assault_subtype and N/A to other crimes
    assault_subtype = ifelse(
      subtype == "Assault", 
      sample( c("Assault Peace Officer", 
                "Assault Resist Arrest", 
                "Assault Peace Officer Weapon/Bodily Harm", 
                "Aggravated Peace Officer"),
              size = sum(subtype == "Assault"), 
              replace = TRUE),"N/A"),
      
    # Randomly assign sex 
    sex = sample(c("M", "F", "U"), size = 1244, replace = TRUE), 
    
    # Randomly assign age_group
    age_group = sample(c("Adult", "Unknown", "Child", "Youth"), size = 1244, 
                         replace = TRUE),
    
    # Assign age_cohort based on age_group
    age_cohort = ifelse(age_group == "Child", "<12",
                        ifelse(age_group == "Unknown", "Unknown",
                               ifelse(age_group == "Youth", "12 to 17",
                                      sample(c("18 to 24", "25 to 34", 
                                               "35 to 44", "45 to 54", 
                                               "55 to 64", "65+"), 
                                             size = sum(age_group == "Adult"), 
                                             replace = TRUE)[1:sum(age_group == 
                                                                     "Adult")]
                               )
                        )
    ),

    # Randomly generate count values (based on reasonable estimates from data)
    count = sample(1:500, size = 1244, replace = TRUE),
  )


#### Write_csv
write_csv(data, file = "data/raw_data/simulated.csv")
