# Script to read in a csv file of Apple's mobility data from covid 2020,
# and subset the data to rows of data from one subregion (e.g. state).

# Adam Zimmerman, September 14, 2020
# adam.eric.zimmerman@gmail.com

# create a function to subset any subregion/US state out of the full dataset
# this should also create an output CSV with the name of the subregion
subset_mobility_data_to_state <- function(input_filename, subregion) {

  # read in complete mobility dataset
  all_covid_data <- readr::read_csv(input_filename)

  # subset all data to single sub-region (column 5)
  output_data <- all_covid_data %>%
    dplyr::filter(`sub-region` == subregion)

  # check that subsetted data has data in it
  if (nrow(output_data) == 0) {
    stop("ERROR: No rows matching subregion query.")
  }

  # save file
  subregion <- gsub("\\s", "_", subregion)
  full_output_path <- paste0("output/subsetted_states_wide/",
                             subregion, "_", core_name, ".csv")
  readr::write_csv(output_data, full_output_path)
}
