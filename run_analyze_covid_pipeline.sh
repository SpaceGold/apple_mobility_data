#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using the
# command line; passing parameters from the shell

# This script expects two parameters.
# The first should be a US state, and the second is raw Apple Mobility Data fp

# Adam Zimmerman
# adam.eric.zimmerman@gmail.com
# October 12, 2020

if [ $# -eq 0 ]
then
  echo "To run this script, supply state and raw data .csv params."
  exit 1
fi 

state=$1
state=${state// /_}

Rscript -e "rmarkdown::render('Analysis.Rmd',\
            params = list(state = '$1',\
            data = '$2'),\
            output_dir = 'output',\
            output_file = 'Analysis_$state')"