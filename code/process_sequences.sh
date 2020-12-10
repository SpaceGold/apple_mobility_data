#!/bin/bash

set -euo pipefail

# A bash script to analyze sequencing data from COVID-19.

# This script expects one parameter, a fasta file, with | chars,
# and optionally "ALL" as a second parameter.

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
fasta_gz_input=$1 | \

# Pipe just opening lines with grep. Don't store whole lines!
zgrep "^>" "$fasta_gz_input" | \

# Replace space with \s; Replace | with \t
sed -E 's/\|/\t/g' | \

# parse 3rd tab
awk 'BEGIN{FS="\t"}; {print $3}'

# sort lines alphabetically
sort | \

# If 'ALL' is passed, give a total count of sequences
if [ "$#" -eq 2 ]
then
  if [ $2 == 'ALL' ]
  then
    echo "The total number of sequences is:"
    -l wc -l
    echo " "
  fi
fi | \

# tally unique lines
uniq -c | \

# sort numerically, reverse
sort -nr
