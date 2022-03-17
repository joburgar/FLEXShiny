# Fisher Landscape Planning Tool

## Overview  

# This document outlines the usage of the modules in the project Fisher Landscape Planning Tool, which the main module is the Fisher Landscape Explorer (FLEX) tool (located in the modules' folder as a submodule to this project).

## Initialization
source("R/initFunctions.R")

## Checking directory
checkDirectory()

## Checking modules
# To properly run this model, please make sure all submodules of interest have also been downloaded and, if using GitHub,  initialized (to check if a module has been initialized, please go to the module's folder and check for existing files. If no files can be found, please run the following command).  

checkingModules(updateSubmodules = FALSE, # Should the submodules be updated?
                whichSubmodules = "FLEX", # Specify which modules to be added
                hostLink = "git@github.com:tati-micheletti/FLEX.git" # Specify the github (SSH) paths to the modules
                )

## Install and load required packages
installAndLoadPkgs()

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
simTimes <- list(start = 1, end = 1)

## Setting up modules list 
moduleList <- list("FLEX") # Name of the modules to run

## Setting up parameters needed
## NOTE: If you provide an empty list of parameters, these are below are the 
## defaults
parameters <- list(
  FLEX = list(
    "iterations" = 100,
    "yrs.to.run" = 10,
    "nFemales" = 10, 
    "maxAgeFemale" = 9,
    "dist_mov" = 1.0,
    "TS" = 12,
    "name_out" = "Pex2",
    "sim_order" = 2
    )
)

## Setting up the outputs to be saved
outputs <- data.frame(
  objectName = "B.w1_real.FEMALE",
  saveTime = seq(simTimes[["start"]],
                 simTimes[["end"]], 
                 by = 1)
  )
  
mySim <- simInitAndSpades(times = simTimes,
                          modules = moduleList,
                          params = parameters,
                          outputs = outputs)

# Extract results from simulation

# Simulated world
mySim$w1

# Predictions and plot
mySim$B.w1_real

# Full dataset
mySim$B.w1_real.FEMALE

# Heatmap
raster::plot(mySim$B.w1_real_heatmap$raster)

# Population information
# Mean number of fisher
mySim$B.w1_real_heatmap$Fisher_Nmean
# SE number of fisher
mySim$B.w1_real_heatmap$Fisher_Nse
# Replicat simulations on which population did not crash 
# (i.e., population reach zero)
mySim$B.w1_real_heatmap$nozerosims

