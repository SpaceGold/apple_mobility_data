# Script to read in a csv file of Apple's mobility data from covid 2020,
# and subset the data to rows of data from one subregion (e.g. US state).

# Adam Zimmerman, September 23, 2020
# adam.eric.zimmerman@gmail.com

# Update the 01 script to run inside a for loop, that will iterate over a
# character vector of at least 5 and no more than 10 subregions, to produce
# output files properly named from the input files. For testing, I chose to
# import a list of 51 US states and randomly select 5-10 of them to analyze.

input_filename <- "data/raw_data/applemobilitytrends-2020-09-19.csv"
us_states <- read.csv("data/raw_data/all_US_state_names.csv",
                      fileEncoding = 'UTF-8-BOM')

# RNG from 5 to 9 subregions, rounded; RNG that many subregions
subregion_vector <- round(runif(round(runif(1,5,9)), 1, 51))

# create empty vector of US states to analyze
us_states_to_analyze <- vector()

# create vector from full_name column of us_states for analysis
us_state_names_vector <- us_states$full_name

# assign US state indices
for (subregion_index in subregion_vector) {
  
  # concatenate US state to vector by full_name, index
  us_states_to_analyze <- c(us_states_to_analyze, us_state_names_vector
                            [subregion_index])
}

# read in complete mobility dataset
all_covid_data <- read.csv(input_filename)

# check that raw data has subregion data in it
if ("sub.region" %in% names(all_covid_data) == 0) {
  stop("ERROR: Raw data is missing correct headers or variables.")
}

# subset raw data into multiple subregion dataframes
for (subregion in us_states_to_analyze) {
  
  #subregion = us_states_to_analyze[subregion_index]
  output_data <- all_covid_data[all_covid_data$sub.region == subregion, ]
  
  # save file
  full_output_path <- paste0("output/", subregion, "_covid_mobility_data_",
                             ".csv", sep = "")
  write.csv(output_data, file = full_output_path)
  }
