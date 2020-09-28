# Script to read in a csv file of Apple's mobility data from covid 2020,
# and subset the data to rows of data from one subregion (e.g. state).

# Adam Zimmerman, August 31, 2020
# adam.eric.zimmerman@gmail.com

# Specify your subregion of interest, e.g. "Florida", & output path
subregion <- "Florida"
output_path <- "output/"

# read in complete mobility dataset
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2020-08-29.csv")

# subset all data to single sub.region (column 5)
# and be careful about any silent errors
output_data <- all_covid_data[all_covid_data$sub.region == subregion, ]

# save file
full_output_path <- paste(output_path, "covid_mobility_data_", subregion, 
                          ".csv", sep="")
write.csv(output_data, file = full_output_path)
