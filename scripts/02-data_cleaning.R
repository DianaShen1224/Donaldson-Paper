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
