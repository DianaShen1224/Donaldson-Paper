#### Preamble ####
# Purpose: Tests for Data
# Author: Diana Shen 
# Date: 19 September 2024
# Contact:diana.shen@mail.utoronto.ca 
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Test data ####
data1 <- read_csv("data/raw_data/simulated_sector.csv")
data2 <- read_csv("data/raw_data/simulated_occupancy.csv")
# Test for negative numbers
data1$number_occupied|>min()<=0
#Test for NAs
all(is.na(data1))
all(is.na(data2))