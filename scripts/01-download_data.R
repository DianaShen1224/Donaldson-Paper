#### Preamble ####
# Purpose: Downloads and saves the data from Toronto Open data
# Author: Diana Shen 
# Date: 19 September 2024 
# Contact: diana.shen@mail.utoronto.ca 
# License: MIT
# Pre-requisites: Know where to get the Daily Shelter & Overnight Service 
# Occupancy & Capacity of the City of Toronto


#### Workspace setup ####
#install.packages("opendatatoronto")
#install.packages("knitr")

library(knitr)
library(janitor)
library(opendatatoronto)
library(tidyverse)

#### Download data ####
#### Acquire ####
toronto_shelters <-
  list_package_resources("21c83b32-d5a8-4106-a54f-010dbe49f6f2") |>
  filter(name == 
           "daily-shelter-overnight-service-occupancy-capacity-2023.csv") |>
  get_resource()

#### Save data ####
write_csv(
  x = toronto_shelters,
  file = "~/Toronto-Shelter-Research/data/raw_data/toronto_shelters_2023.csv"
)

head(toronto_shelters)

         
