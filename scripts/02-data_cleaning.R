#### Preamble ####
# Purpose: Cleans the raw crime victim data into an analysis dataset
# Author: Kevin Roe
# Date: 22 September 2024
# Contact: kevin.roe@mail.utoronto.ca
# License: MIT
# Pre-requisites: Make sure to download the dataset
# Any other information needed? None.

#### Workspace setup ####
#install.packages("tidyverse")
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  
  # Only include the columns of interest 
  select('_id','REPORT_YEAR','SUBTYPE','ASSAULT_SUBTYPE','SEX',
         'COUNT_') |>
  
  # Rename column headers for clarity
  rename('id' = '_id',
         'Year' = 'REPORT_YEAR',
         'CrimeType' = 'SUBTYPE',
         'AssaultType' = 'ASSAULT_SUBTYPE',
         'Sex' = 'SEX',
         'Number of Victims' = 'COUNT_') |>
  
# Rename Sex for clarity purposes
  mutate(Sex = case_when(
    Sex == "M" ~ "Male",
    Sex == "F" ~ "Female",
    Sex == "U" ~ "Unknown",
    TRUE ~ "Unknown"
  )) |>

# Rename Assault Type for Clarity Purposes
mutate(AssaultType = case_when(
  AssaultType == "Assault Peace Officer" ~ "Assault on a Peace Officer",
  AssaultType == "Assault Resist Arrest" ~ "Resisting Arrest",
  AssaultType == "Other" ~ "Other",
  AssaultType == "N/A" ~ "N/A",
  AssaultType == "Assault Peace Officer Weapon/Bodily Harm" ~ 
    "Assaulting a Peace Officer with a Weapon",
  AssaultType == "Aggravated Peace Officer" ~ 
    "Aggravated Assault on a Peace Officer",
  TRUE ~ AssaultType
))
  
#### Suppress the column type messages ####
options(tibble.show_col_types = FALSE)


  
#### Save the Cleaned Dataset ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
