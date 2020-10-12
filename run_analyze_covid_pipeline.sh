#!/bin/bash

# A bash script to drive the rendering of an Rmarkdown file using the
# command line; passing parameters from the shell

Rscript -e "rmarkdown::render('Analysis.rmd')"