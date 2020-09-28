# Call a function that reads in a dataset, flips it to be long instead
# of wide, and then checks to make sure it's correct.

# Adam Zimmerman
# 2020-09-25
# adam.eric.zimmerman@gmail.com

# file.path() is best practice for filenames

# Insert filename or rewrite this to run on all *applemobilitytrends.csv
input_filename <- "data/raw_data/applemobilitytrends-2020-09-19.csv"

# Run the function
flip_dataset(input_filename)

# Report
print("Done.")
