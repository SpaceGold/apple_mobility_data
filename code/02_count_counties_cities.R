# Use dyplr package to tally number of cities and counties that have Apple
# mobility data in a state; save to csv.

# Adam Zimmerman, September 21, 2020
# adam.eric.zimmerman@gmail.com

# load dyplyr
library("dplyr")

# We want to count cities and counties that have Apple mobility data in a state

# set folder to check, e.g. /output/
folder <- "output/"
folder_contents <- dir(folder)

for (subregion_data in folder_contents) {

  # NOTE: don't do paste (folder, folder_contents[subregion_data]) THIS time.
  us_state_fn <- paste(folder, subregion_data, sep = "")
  us_state_data <- read.csv(us_state_fn)

  # extract state name for naming output from title
  us_state_name <- us_state_data$sub.region[1]

  # starting off with dplyr chains
  count_cities_counties_transit <- us_state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # write out the result of dyplr chain
  us_state_name <- gsub("\\s", "_", us_state_name)
  write.csv(count_cities_counties_transit,
            paste("output/", us_state_name, "_cities_counties_counts.csv",
                  sep = ""))
}
