# global.R

## Install and load required packages
source("R/installAndLoadPkgs.R")
installAndLoadPkgs()

library(raster)
library(devtools)
library(DT)
library(bsplus)
library(config)
library(data.table)
library(dplyr)
library(ggplot2)
library(golem)
library(leaflet)
library(plotly)
library(purrr)
library(rintrojs)
library(rmarkdown)
library(sf)
library(shiny)
library(shinyBS)
library(shinycssloaders)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyjs)
library(covrpage)
library(shinyFeedback)
library(attempt)
library(config)
library(reshape2)
library(tidyverse)
library(dynutils)
library(plotly)
library(DT)

## Setting up paths
setPaths(cachePath = checkPath(file.path(getwd(), "cache"), create = TRUE),
         inputPath = checkPath(file.path(getwd(), "inputs"), create = TRUE),
         outputPath = checkPath(file.path(getwd(), "outputs"), create = TRUE),
         modulePath = checkPath(file.path(getwd(), "modules"), create = TRUE),
         rasterPath = checkPath(file.path(getwd(), "tempDir"), create = TRUE))

## Setting up simulation time 
## NOTE: Currently, the functions are looping on their own over years. 
## Some work is needed to desconstruct the FEMALE_IBM_simulation_same_world() 
## to use the scheduler as expected.
simTimes <- list(start = 1, end = 1) # need to figure out how to get it to be dynamic # have to add in clus object piece

## Setting up modules list 
moduleList <- list("FLEX") # Name of the modules to run

## Setting up parameters needed
## NOTE: If you provide an empty list of parameters, these are below are the 
## defaults
parameters <- list(
  FLEX = list(
    "iterations" = 5, # using 5 for ease of testing, change to 100 once running
    # "yrs.to.run" = 10, # not sure this is necessary - part of simTimes above
    "propFemales" = 0.3, 
    "maxAgeFemale" = 9,
    # "TS" = 5,  # using clus_yrs instead
    "D2_param" = "Max",
    # "name_out" = "Cariboo", # not using this anymore
    # "sim_order" = 2, # not using this anymore
    "clus_yrs" = 5
  )
)

## Setting up the outputs to be saved
outputs <- data.frame(
  objectName = "FLEX_output",
  saveTime = seq(simTimes[["start"]],
                 simTimes[["end"]], 
                 by = 1)
)


#-------------------------------------------------#
#                 specify timezone
#-------------------------------------------------#

tz = Sys.timezone()

#-------------------------------------------------#
#               load Shiny options
#-------------------------------------------------#

options(warn = -1)
options(spinner.color = "#F0F4F8")
options(spinner.size = 1)
options(spinner.type = 3)


#-------------------------------------------------#
#               
#-------------------------------------------------#

