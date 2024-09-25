#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers
# Author: Diana Shen 
# Date: 19 September 2024
# Contact:diana.shen@mail.utoronto.ca 
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(janitor)
library(lubridate)
library(tidyr)
#### Clean data ####
raw_data <- read_csv("data/raw_data/toronto_shelters_2023.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names()|>
  separate(col = occupancy_date,
           into=c("year","month","day"),
           sep="-")|>
  mutate(date=lubridate::ymd(paste(year,month,day,sep="-")))
#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

#### Test cleaned data ####
data_shelter <- read_csv("data/raw_data/toronto_shelters_2023.csv")
# Test for negative numbers
## function for testing the negative numbers
check_non_negative <- function(data) {
  negative_test <- data %>%
    summarise_all(~ min(.)) %>%
    gather(key = "column", value = "min_value") %>%
    filter(min_value < 0)
  if (nrow(negative_test) == 0) {
    print("All columns have non-negative values.")
  } else {
    print("Negative values found in the following columns:") ##print when there's negative numbers
    print(negative_test)
  }
}
## check raw data
check_non_negative(data_shelter )

# Test for NAs
all(is.na(data_shelter)) ## If there is missing values in our raw dataset
