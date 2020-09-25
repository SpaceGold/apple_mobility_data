# function to flip to read in a csv file of Apple's mobility data from covid 2020,
# and flip the dates from columns to rows.

# Adam Zimmerman, September 25, 2020
# adam.eric.zimmerman@gmail.com

# Load packages and function
library("tidyverse")
library("dplyr")
library("readr")
library("tools")

# TESTING:
input_filename <- "data/raw_data/applemobilitytrends-2020-09-19.csv"


# create a function to flip dates from columns to rows 
flip_dataset <- function(input_filename) {

  # read data
  our_dataset <- read_csv(input_filename)

# get number of columns
ncol_initial <- ncol(our_dataset)

# before flipping, try converting colnames to char
col_names_all <- colnames(our_dataset)
col_names_char <- toString(col_names_all)

#will this work?
colnames(our_dataset) <- col_names_char

# flip
our_dataset %>%
  pivot_longer(!geo_type, !region, !transportation_type, !alternative_name,
               !sub-region, !country, names_to = "dates",
               values_to = "traffic_percentage")

# get number of columns
ncol_final <- ncol(our_dataset)

# Defensive check: is dataframe longer and narrower?
if (ncol_final >= ncol_initial) {
  stop("ERROR: Flipping date and percentage data failed. Check raw data.")
}

# save
fn <- sub(".csv", "", input_filename)
fp <- paste(fn, "_long.csv",sep = "")
write.csv(fp)
}

# Call function for testing
flip_dataset(input_filename =
               "data/raw_data/applemobilitytrends-2020-09-19.csv")
