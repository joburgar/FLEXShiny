# Fisher Landscape Planning Tool

## Overview  

# This document outlines the usage of the modules in the project Fisher Landscape Planning Tool, which the main module is the Fisher Landscape Explorer (FLEX) tool (located in the modules' folder as a submodule to this project).

## Checking directory
wd <- getwd()
if (!grepl(pattern = "fisherLandscapePlanningTool", x = getwd()))
  stop("Please make sure you either open the project file in RStudio (fisherLandscapePlanningTool.RProj) or check the working directory if in R command before running this script. It needs to match the current file's directory (~/fisherLandscapePlanningTool/).")

## Downloading and initializing submodules:
# To properly run this model, please make sure all submodules of interest have also been downloaded and, if using GitHub,  initialized (to check if a module has been initialized, please go to the module's folder and check for existing files. If no files can be found, please run the following command).  

updateSubmodules <- FALSE # Should the submodules be updated?
whichSubmodules <- "FLEX" # Specify which modules to be added
hostLink <- "git@github.com:tati-micheletti/FLEX.git" # Specify the github (SSH) paths to the modules

names(hostLink) <- whichSubmodules
submoduleExist <- grepl(x = list.dirs(file.path(wd, "modules/"), recursive = TRUE),
                         pattern = paste(whichSubmodules, collapse = "|"))
if (!all(submoduleExist)){
  lapply(whichSubmodules[!submoduleExist], function(submodule){
    system(paste0("cd ", file.path(getwd(), "modules"), " && git submodule add ", hostLink[submodule]),
           wait = TRUE)
  })
} else {
  # Check if the submodule has been initiated
  submodInitialized <- lapply(whichSubmodules[submoduleExist], function(submodule){
    # HERE
    if (updateSubmodules)
      system(paste0("cd ", getwd(), " && git submodule foreach git pull"),
             wait = TRUE)
  })
}

## load required packages
library(data.table)
library(sp)
library(raster)
library(SpaDES)

## environment setup
setPaths(cachePath = "cache",
         inputPath = "inputs",
         modulePath = "modules",
         outputPath = "outputs")

## simulation initialization
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
