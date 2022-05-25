# Fisher Landscape Planning Tool

## Overview  

# This document outlines the usage of the modules in the project Fisher Landscape Planning Tool, which the main module is the Fisher Landscape Explorer (FLEX) tool (located in the modules' folder as a submodule to this project).

## Checking directory
source("R/checkDirectory.R")
checkDirectory()

## Install and load required packages
source("R/installAndLoadPkgs.R")
installAndLoadPkgs()

library(raster)


## Checking modules
# To properly run this model, please make sure all submodules of interest have also been downloaded and, if using GitHub,  initialized (to check if a module has been initialized, please go to the module's folder and check for existing files. If no files can be found, please run the following command).  
source("R/checkingModules.R")
checkingModules(updateSubmodules = TRUE, # Should the submodules be updated?
                whichSubmodules = "FLEX", # Specify which modules to be added
                hostLink = "git@github.com:bcgov/FLEX.git" # Specify the github (SSH) paths to the modules
)

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
  
mySim <- simInitAndSpades(times = simTimes,
                          modules = moduleList,
                          params = parameters,
                          outputs = outputs)

# Extract results from simulation

# Simulated start world
mySim$FLEX_setup$r_start

# Population and Habitat info at start
mySim$FLEX_setup$pop_info$suitable_habitat
mySim$FLEX_setup$pop_info$total_habitat
mySim$FLEX_setup$pop_info$perc_habitat
mySim$FLEX_setup$pop_info$numAF_start


# Full dataset
mySim$FLEX_output

# Aggregated dataset
mySim$FLEX_agg_output

# Heatmap
mySim$FLEX_heatmap$raster
raster::plot(mySim$FLEX_heatmap$raster)

# Replicate simulations on which population did not crash 
# (i.e., population reach zero)
mySim$FLEX_heatmap$nozerosims

# Predicted information
# Mean number of fisher
mySim$FLEX_heatmap[[3]]$Fisher_Nmean
# SE number of fisher
mySim$FLEX_heatmap[[3]]$Fisher_Nse
# Predicted number of adult fishers with established territories at end of run
mySim$FLEX_heatmap[[3]]$Fpredicted
