# Use dyplr package to tally number of cities and counties that have Apple
# mobility data in a state; save to csv.

# Adam Zimmerman, September 21, 2020
# adam.eric.zimmerman@gmail.com

# load dyplyr
library("dplyr")

# We want to count cities and counties that have Apple mobility data in a state

# load the dataset from the previous script
input_file_name <- "output/covid_mobility_data_Nevada.csv"
state_data <- read.csv(input_file_name)

# starting off with dplyr chains
count_of_cities_counties_by_transit <- state_data %>% 
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()
write.csv(count_of_cities_counties_by_transit,
          "output/nevada_cities_counties_counts.csv")