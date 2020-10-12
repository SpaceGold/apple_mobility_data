input_filename = global_file_to_process
subregion = state_to_analyze

# read in complete mobility dataset
all_covid_data <- read_csv(input_filename)

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
                           subregion,"_", core_name, ".csv")
write_csv(output_data, full_output_path)