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
data1 <- read_csv("data/raw_data/simulated_numerical.csv")
data2 <- read_csv("data/raw_data/simulated_categorical.csv")
data3 <- read_csv("data/raw_data/simulated_ID.csv")
# Test for negative numbers
check_non_negative <- function(data) {
  negative_test <- data %>%
    summarise_all(~ min(.)) %>%
    gather(key = "column", value = "min_value") %>%
    filter(min_value < 0)
  if (nrow(negative_test) == 0) {
    print("All columns have non-negative values.")
  } else {
    print("Negative values found in the following columns:")
    print(negative_test)
  }
}
check_non_negative(data1)
check_non_negative(data3)
#Test for NAs
all(is.na(data1))
all(is.na(data2))
all(is.na(data3))