#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using the
# command line; passing parameters from the shell

Rscript -e "rmarkdown::render('Analysis.rmd',
            params = list(state = 'West Virginia',
            data = 'data/raw_data/applemobilitytrends-2020-10-10.csv))"