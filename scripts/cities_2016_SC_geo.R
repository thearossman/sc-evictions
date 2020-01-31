#
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

cols_selected <- 
  c("city_id" = "GEOID", "city_name" = "n", "geometry")

# note that downloading from URL didn't work
url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"

# Output file
file_out <- here::here("/data/cities_geo.rds")


#===============================================================================


url_data %>%
  read_sf() %>%
  select(cols_selected) %>%
  mutate(city_id = as.integer(city_id)) %>%
  write_rds(file_out)
  
