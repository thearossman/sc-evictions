# Description
# Read CSV: cities.csv from SC dataset
# https://data-downloads.evictionlab.org 
# SC --> cities.csv

# Author: Thea Rossman
# Version: 2020-01-30


# Libraries
library(tidyverse)
library(vroom)

# Parameters

vars_types <- 
  cols_only(
    GEOID = col_integer(),
    year = col_integer(),
    name = col_character(),
    evictions = col_double()
  )

YEAR_SELECT <- 2016
  
url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"

# Output file
file_out <- here::here("/data/cities_evict.rds")


#===============================================================================


url_data %>%
  read_csv(col_types = vars_types) %>%
  filter(year == YEAR_SELECT) %>%
  rename_at(vars(GEOID), str_to_lower) %>%
  write_rds(file_out)


