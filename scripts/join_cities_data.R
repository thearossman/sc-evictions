# Description

# Read CSV: SC city boundaries data; 
# https://data-downloads.evictionlab.org 
# SC --> cities.geojson

# Author: Thea Rossman
# Version: 2020-01-30

# Libraries
library(tidyverse)
library(vroom)
library(sf)

# Parameters

vars_types <- 
  c(
    `GEOID` = col_integer(),
    `year` = col_integer(),
    `name` = col_character(),
    `evictions` = col_integer()
  )

file_evict <- here::here("/data/cities_evict.rds")
file_geo <- here::here("/data/cities_geo.rds")

# Output file
file_out <- here::here("/data/joined.rds")


#===============================================================================


file_evict %>%
  read_rds() %>%
  full_join(read_rds(file_geo), by = c("geoid" = "city_id")) %>%
  write_rds(file_out)
  
