# COVID-19 Mobility Data Analysis

Adam Zimmerman
adam.eric.zimmerman@gmail.com

This project interprets data from Apple Maps, available at:
https://covid19.apple.com/mobility

Currently uses dplyr to work with some of the tabular data. Eventually the project will incorporate ggplot2 for visualization.

### Log
* 2020-09-25 Pushed function flip_dataset.R to GitHub, successfully debugging. It uses pivot_longer() to tidy up the 250x4700 mobility dataframe into an 8x100k+ dataframe.
* 2020-09-24 Updated the 02 script to run inside a for loop that will iterate over all output files formatted as output from the 01 script. 
* 2020-09-23 Updated the 01 script to run inside a for loop that will iterate over a character vector of at least 5 and no more than 10 states, to produce output files properly named from the input files.
* 2020-09-23 Added dyplr function to tally cities and counties by state and transit type.
* 2020-09-22 Added dyplr script and to tally cities and counties by state and transit type; got new data.
* 2020-08-31 Data first downloaded.
 * The first verison of the project is used for subsetting the data by subregion/state.
* 2020-09-14: A new version of the data was downloaded and the code was refactored to be more general and accept larger files.
