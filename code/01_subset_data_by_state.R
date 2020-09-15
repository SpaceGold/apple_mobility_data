# Script to read in a csv file of Apple's mobility data from covid 2020,
# and subset the data to rows of data from one subregion (e.g. state).

# Adam Zimmerman, September 14, 2020
# adam.eric.zimmerman@gmail.com

# Specify your subregion of interest, e.g. "Florida", & output path
input_filename <- "data\raw_data\applemobilitytrends-2020-09-12.csv"
subregion <- "Georgia"

# read in complete mobility dataset
all_covid_data <- read.csv(input_filename)
# check that subsetted data has data in it
subregion_data <- all_covid_data[all_covid_data$sub.region == subregion, ]

# subset all data to single sub.region (column 5)
output_data <- all_covid_data[all_covid_data$sub.region == subregion, ]

# save file
full_output_path <- paste0("output/", "covid_mobility_data_", subregion,
                           ".csv", sep = "")
write.csv(output_data, file = full_output_path)
