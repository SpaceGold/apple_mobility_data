#!/bin/bash

set -euo pipefail

# A bash script to analyze sequencing data from COVID-19.

# This script expects one parameter, a fasta file, with | chars.

# This script outputs the total number of sequences in the file.
# It also tallies the number of sequences in the dataset from each
# country, sorting the output from largest to smallest.

# Adam Zimmerman
# adam.eric.zimmerman@gmail.com
# October 12, 2020

# Check for correct number of parameters
if [ $# -eq 0 ]
then
  echo "To run this script, supply a fasta.gz file of sequences."
  exit 1
fi

# Assign input file, e.g. 150 MB compressed .fasta
fasta_gz_input=$1

# If 'ALL' is passed, give a total count of sequences
if [ "$#" -eq 2 ]
then
  if [ $2 == 'ALL' ]
  then
    # Report
    echo -e "The total number of sequences is:"

    # count lines
    zgrep "^>" "$fasta_gz_input" | \
    wc -l
    echo -e " "
  fi
fi

# Report
echo -e "The numbers of sequences by country are:"

# Pipe just opening lines with grep. Don't store whole lines!
zgrep "^>" "$fasta_gz_input" | \

# Replace | with \t
sed -E 's/\|/\t/g' | \

# parse 3rd tab
awk 'BEGIN{FS="\t"}; {print $3}' | \

# then sort
sort | \

# sort and print uniques count (by country)
uniq -c | \
sort -nr