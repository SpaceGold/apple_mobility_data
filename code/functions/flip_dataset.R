# function to flip to read in a csv file of Apple's mobility data from covid
# 2020, and flip the dates from columns to rows.

# Adam Zimmerman, September 25, 2020
# adam.eric.zimmerman@gmail.com

# create a function to flip dates from columns to rows
flip_dataset <- function(file_name_in) {

  # read data
  our_dataset <- read_csv(file_name_in)

  # get number of columns
  ncol_initial <- ncol(our_dataset)

  # flip. Currently this is clumsy, relying on literal names
  final_dataset <- our_dataset %>%
    pivot_longer("2020-01-13":"2020-09-19", names_to = "dates",
                 values_to = "rel_mobility")

  # get number of columns
  ncol_final <- ncol(final_dataset)

    # Defensive check: is dataframe longer and narrower?
  if (ncol_final >= ncol_initial) {
    stop("ERROR: Flipping date and relative mobility data failed. Check raw
         data.")
  }

  # save without spaces in name
  fn <- sub("wide", "long", file_name_in)
  fp <- paste0("subsetted_states_long", fn, "_long.csv", sep = "")
  fp <- gsub("\\s", "_", fp)
  write_csv(final_dataset, fp)
}
