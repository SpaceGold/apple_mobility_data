#!/bin/bash

# A bash script to analyze sequencing data from COVID-19.

# This script expects one parameter, a fasta file.

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
if [ $# -gt 1 ]
then
  echo "Too many parameters passed. Supply 1 fasta.gz file."
  exit 1
fi

# Assign input file, e.g. 150 MB compressed .fasta
fasta_gz_input=$1

# Count and report new sequence symbols to tally sequence count
sequence_count=$(zgrep -c "^>" fasta_gz_input)
echo $sequence_count "sequences found"

# Tally and report number of sequences in the dataset from each
# country, sorting the output from largest to smallest.
# Use uniq to tag and tally each country as it appears in lines with > 
# Identify string that follows ">"*|*|, and ends in |
# pipe bioawk comments into sed to remove all but that
# pipe that into wc -l?
# bioawk -c fastx '/country/ {print $comment'} filepath | sed

# Pipe just opening lines with grep. Don't store whole lines!
zgrep "^>" $fasta_gz_input | \
# Replace | with \t


# then strip everything between ^ and second |
sed -E 's/.*?\|.*?\|//g'
# then tally all uniques and prin
