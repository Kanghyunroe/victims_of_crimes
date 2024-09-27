#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Kevin Roe
# Date: 21 September 2024
# Contact: kevin.roe@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
# Code is adapted from OpenDataToronto
# get package
package <- show_package("police-annual-statistical-report-victims-of-crime")

# get all resources for this package
resources <- list_package_resources("police-annual-statistical-report-victims-of-crime")

# identify Datasource Resources
datastore_resources <- filter(resources, tolower(format) %in% c("csv", "geojson"))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% 
  get_resource()

#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv") 
