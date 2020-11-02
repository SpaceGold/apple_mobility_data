# Function that takes in one subregion/state's data from Apple's COVID-19
# mobility data and returns a tally csv of cities and counties by transit.

# Adam Zimmerman, September 23, 2020
# adam.eric.zimmerman@gmail.com

# create a function to take in a csv of mobility data and return city tally
count_cities_counties <- function(file_name_in) {

  # load the dataset from the previous script
  subregion_data <- readr::read_csv(file_name_in)

  # defensive programming check: do headers contain "geo_type"?
  if ("geo_type" %in% names(subregion_data) == 0) {
    stop("Imported CSV is missing correct headers; please review.")
  }

  # filter data with dplyr chains
  count_cities_counties_transit <- subregion_data %>%
    dplyr::select(geo_type, region, transportation_type) %>%
    dplyr::group_by(geo_type, transportation_type) %>%
    dplyr::tally()

  # write out the result of dyplr chain
  readr::write_csv(count_cities_counties_transit,
          paste("output/subsetted_states_tallied/", state_no_spaces,
                "_cities_counties_counts.csv", sep = ""))

  # return output
  return(count_cities_counties_transit)
  }
