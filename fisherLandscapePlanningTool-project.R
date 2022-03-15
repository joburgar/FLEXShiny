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

## Load Data
# Reproductive rates from manuscript
repro.CI <- read.csv(file.path(Paths[["modulePath"]], "FLEX/data/repro.CI.csv", 
                               header = TRUE)

simTimes <- c(start = 0, end = 10)

moduleList <- list("module1", "module2") # rename module1 and module2

parameters <- list(
  module1 = list(), # rename module1 and provide named list of params
  module2 = list()  # rename module2 and provide named list of params
)

#?inputs
#?outputs

mySim <- simInit(
  times = simTimes,
  modules = moduleList,
  params = parameters
)

## run the simulation
mySimOut <- spades(mySim) # opitonally, use `spades(Copy(mySim))`

## run a simulation experiment
# see `?experiment`
