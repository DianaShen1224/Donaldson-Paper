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
##categorical
set.seed(1098)
num_shelters <- 151
simulated_categorical <-tibble("Division" = 1:151,"Sector" = sample(c("Men", "Women", "Mixed Adult", "Youth", "Family"), num_shelters, replace = TRUE),
"Program Model" = sample(c("Emergency", "Transitional"), num_shelters, replace = TRUE),
"Overnight service type" = sample(
  c("Shelter", "24-Hour Respite", "Motel/Hotel", "Interim Housing", 
    "Warming Centre", "24-Hour Women's Drop-in", "Isolation/Recovery Site"),
  num_shelters, replace = TRUE
),
"Program Area" = sample(
  c("Base Shelter and Overnight Services System", "Base Program - Refugee", 
    "Temporary Refugee Response", "COVID-19 Response", "Winter Response"), 
  num_shelters, replace = TRUE
))
head(simulated_categorical)
write_csv(simulated_categorical, file = "data/simulated_data/simulated_categorical.csv")

##ID 
set.seed(1098)
num_shelters <- 3
total_days <- 365
total_rows <- num_shelters * total_days

simulated_ID <- tibble(
  id = sample(1000:1100, total_rows, replace = TRUE),
  OCCUPANCY_DATE = rep(x = as.Date("2023-01-01") + c(0:(total_days - 1)), times = num_shelters),
  ORGANIZATION_ID = rep(sample(1000:1100, num_shelters, replace = TRUE), each = total_days),
  ORGANIZATION_NAME = rep(sample(c("Org 1", "Org 2", "Org 3"), num_shelters, replace = TRUE), each = total_days),
  SHELTER_ID = rep(sample(2500:4100, num_shelters, replace = TRUE), each = total_days),
  SHELTER_GROUP = rep(sample(c("Shelter Group A", "Shelter Group B", "Shelter Group C"), num_shelters, replace = TRUE), each = total_days),
  LOCATION_ID = rep(sample(5000:5100, num_shelters, replace = TRUE), each = total_days),
  LOCATION_NAME = rep(sample(c("Location 1", "Location 2", "Location 3"), num_shelters, replace = TRUE), each = total_days),
  LOCATION_ADDRESS = rep(sample(c("123 Street", "456 Avenue", "789 Road"), num_shelters, replace = TRUE), each = total_days),
  LOCATION_POSTAL_CODE = rep(sample(c("M1Y 1A3", "M5B 3F1", "M3C 3C3"), num_shelters, replace = TRUE), each = total_days),
  LOCATION_CITY = rep(sample(c("Toronto", "Markham", "North York"), num_shelters, replace = TRUE), each = total_days),
  LOCATION_PROVINCE = "Ontario",
  PROGRAM_ID = rep(sample(4000:4100, num_shelters, replace = TRUE), each = total_days),
  PROGRAM_NAME = rep(sample(c("Program A", "Program B", "Program C"), num_shelters, replace = TRUE), each = total_days)
)
head(simulated_ID)
write_csv(simulated_ID, file = "data/simulated_data/simulated_ID.csv")

##numerical
set.seed(1098)
max_capacity<-150
simulated_occupancy_data <-
  tibble(
    date = rep(x = as.Date("2023-01-01") + c(0:364), times = 3),
    shelter = c(
      rep(x = "Shelter 1", times = 365),
      rep(x = "Shelter 2", times = 365),
      rep(x = "Shelter 3", times = 365)
    ),
    CAPACITY_ACTUAL_BED = sample(100:140, 365*3, replace = TRUE),
    CAPACITY_FUNDING_BED = sample(140:150, 365*3, replace = TRUE),
    occupied_bed =rpois(n = 365 * 3,lambda = 30), 
    UNOCCUPIED_BEDS = CAPACITY_ACTUAL_BED -occupied_bed,
    UNAVAILABLE_BEDS = CAPACITY_FUNDING_BED - CAPACITY_ACTUAL_BED,
    CAPACITY_ACTUAL_ROOM = sample(100:140, 365*3, replace = TRUE),
    CAPACITY_FUNDING_ROOM = sample(140:150, 365*3, replace = TRUE),
    occupied_rooms = rpois(n = 365*3, lambda = 20),
    UNOCCUPIED_ROOMS = CAPACITY_ACTUAL_ROOM - occupied_rooms,
    UNAVAILABLE_ROOMS = CAPACITY_FUNDING_ROOM - CAPACITY_ACTUAL_ROOM,
    occupancy_rate_bed=occupied_bed/CAPACITY_ACTUAL_BED,
    occupancy_rate_rooms =occupied_rooms / CAPACITY_ACTUAL_ROOM,
    SERVICE_USER_COUNT = occupied_bed + occupied_rooms
  )|>rename_all(tolower)
head(simulated_occupancy_data)
write_csv(simulated_occupancy_data, file = "data/simulated_data/simulated_numerical.csv")
