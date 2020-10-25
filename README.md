# COVID-19 Mobility Data Analysis

Adam Zimmerman
adam.eric.zimmerman@gmail.com

This project interpreted data from Apple Maps, available at:
https://covid19.apple.com/mobility

This project also interprets COVID-19 sequencing data, available at:
https://www.ncbi.nlm.nih.gov/sars-cov-2/

Current focus is on using ssh, Tmux, zgrep, zcat, and bioawk on fasta data.

### Log
* 2020-10-26: Built an sh script to interpret  
* 2020-10-21: Introduced an analysis of COVID-19 sequencing data from a remote server.
* 2020-10-14: Adapted R markdown file to run from a bash script.
* 2020-10-07: Developed R markdown file that knits all functions together.
* 2020-09-25 Pushed function flip_dataset.R to GitHub, successfully debugging. It uses pivot_longer() to tidy up the 250x4700 mobility dataframe into an 8x100k+ dataframe.
* 2020-09-24 Updated the 02 script to run inside a for loop that will iterate over all output files formatted as output from the 01 script. 
* 2020-09-23 Updated the 01 script to run inside a for loop that will iterate over a character vector of at least 5 and no more than 10 states, to produce output files properly named from the input files.
* 2020-09-23 Added dyplr function to tally cities and counties by state and transit type.
* 2020-09-22 Added dyplr script and to tally cities and counties by state and transit type; got new data.
* 2020-09-14: A new version of the data was downloaded and the code was refactored to be more general and accept larger files.
* 2020-08-31 Data first downloaded.
 * The first verison of the project is used for subsetting the data by subregion/state.
