#!/bin/bash

set -euo pipefail

# A bash script to drive the rendering of an Rmarkdown file using the
# command line; passing parameters from the shell

# This script expects multiple parameters.
# The first should be a US state, and the second is raw Apple Mobility Data
# filepath, and the third is

# Adam Zimmerman
# adam.eric.zimmerman@gmail.com
# October 12, 2020

if [ $# -eq 0 ]
then
  echo "Supply params: US state, raw data CSV, and seq summary."
  exit 1
fi 

state=$1
state=${state// /_}

RMD_PARAMS="params = list(state = '$1', data = '$2', seqdata = '%3')"
RMD_OUTPUT="output_dir = 'output', output_file = 'Analysis_$state'"

Rscript -e "rmarkdown::render('Analysis.Rmd', $RMD_PARAMS, $RMD_OUTPUT)"
