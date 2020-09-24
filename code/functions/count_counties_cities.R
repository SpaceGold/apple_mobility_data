# Function that takes in one subregion/state's data from Apple's COVID-19
# mobility data and returns a tally csv of cities and counties by transit.

# Adam Zimmerman, September 23, 2020
# adam.eric.zimmerman@gmail.com

# load dyplyr, readr
library("dplyr")
library("readr")

# create a function to take in a csv of mobility data and return city tally
count_cities_counties <- function(input_filename) {

  # load the dataset from the previous script
  state_data <- read_csv(input_filename)

  # identify state/subregion for saved file
  subregion <- state_data$sub.region[1]

  # defensive programming check: do headers contain "geo_type"?
  if ("geo_type" %in% names(state_data) == 0) {
    stop("Imported CSV is missing correct headers; please review.")
  }

  # filter data with dplyr chains
  count_cities_counties_transit <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # write out the result of dyplr chain
  write.csv(count_cities_counties_transit,
          paste("output/", subregion, "_cities_counties_counts.csv", sep = ""))
}
