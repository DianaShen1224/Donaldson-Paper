#### Preamble ####
# Purpose: Simulates in data from Daily Shelter & Overnight Service Occupancy & 
# Capacity of the City of Toronto and make graphs of the number of shelters each 
# categorizing homeless shelters provides and occupancy rate of the rooms 
# in shelters.
# Author: Diana Shen 
# Date: 19 September 2024 
# Contact: diana.shen@mail.utoronto.ca 
# License: MIT
# Pre-requisites: Know where to get the Daily Shelter & Overnight Service 
# Occupancy & Capacity of the City of Toronto


#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
simulated_sector <-
  tibble(
    "Division" = 1:151,
    "Sector" = sample(
      x = c("Men", "Women", "Mixed Adult","Youth","Family"),
      size = 151,
      replace = TRUE
    )
  )
write_csv(simulated_sector, file = "data/raw_data/simulated_sector.csv")
#### Simulate ####
set.seed(1097)
max_capacity=60
simulated_occupancy_data <-
  tibble(
    date = rep(x = as.Date("2023-01-01") + c(0:364), times = 3),
    shelter = c(
      rep(x = "Shelter 1", times = 365),
      rep(x = "Shelter 2", times = 365),
      rep(x = "Shelter 3", times = 365)
    ),
    number_occupied =
      rpois(
        n = 365 * 3,
        lambda = 30
      ),occupancy_rate=number_occupied/max_capacity
  )

head(simulated_occupancy_data)
write_csv(simulated_occupancy_data, file = "data/raw_data/simulated_occupancy.csv")

