Thea Rossman
2020-01-30

``` r
# Libraries
library(tidyverse)

# Parameters

filepath <- here::here("/data/cities_evict.rds")

#===============================================================================

# Code
```

``` r
sc_evictions_2016 <- read_rds(filepath)

sc_evictions_2016 %>%
  arrange(desc(evictions))
```

    ## # A tibble: 397 x 4
    ##      geoid  year name             evictions
    ##      <int> <int> <chr>                <dbl>
    ##  1 4550875  2016 North Charleston     3660.
    ##  2 4516000  2016 Columbia             2225.
    ##  3 4513330  2016 Charleston           1546.
    ##  4 4562395  2016 St. Andrews          1383.
    ##  5 4525810  2016 Florence             1097.
    ##  6 4519285  2016 Dentsville            769.
    ##  7 4549075  2016 Myrtle Beach          729.
    ##  8 4501360  2016 Anderson              642.
    ##  9 4532065  2016 Hanahan               529.
    ## 10 4529815  2016 Goose Creek           480.
    ## # … with 387 more rows

*North Charleston had the most evictions.*
