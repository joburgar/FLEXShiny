## Initialization functions

## Checking directory
checkDirectory <- function(){
  wd <- getwd()
  if (!grepl(pattern = "fisherLandscapePlanningTool", x = getwd()))
    stop("Please make sure you either open the project file in RStudio (fisherLandscapePlanningTool.RProj) or check the working directory if in R command before running this script. It needs to match the current file's directory (~/fisherLandscapePlanningTool/).")
  print(paste0("Directory correct: ", wd))
}

## Checking modules
checkingModules <- function(updateSubmodules = FALSE, # Should the submodules be updated?
                            whichSubmodules = "FLEX", # Specify which modules to be added
                            hostLink = "git@github.com:tati-micheletti/FLEX.git"){ # Specify the github (SSH) paths to the modules
  wd <- getwd()
  names(hostLink) <- whichSubmodules
  submoduleExist <- grepl(x = list.dirs(file.path(wd, "modules/"), recursive = FALSE),
                          pattern = paste(whichSubmodules, collapse = "|"))
  if (!all(submoduleExist)){
    lapply(whichSubmodules[!submoduleExist], function(submodule){
      addSubMCommand <- paste0("cd ", file.path(getwd(), "modules"), " && git submodule add ", hostLink[submodule])
      ex <- system(addSubMCommand, wait = TRUE)
      if (ex == 127)
        stop(paste0("Automatic submodule clonning did not work (possibly due to ",
                    "Windows use). Please paste the following in your command", 
                    " line (which can be accessed using the Terminal in RStudio): ",
                    addSubMCommand))
      print(paste0("Submodule ", submodule, " added"))
    })
  } else {
    # Check if the submodule has been initiated
    submodInitialized <- lapply(whichSubmodules[submoduleExist], function(submodule){
      if (updateSubmodules)
        system(paste0("cd ", getwd(), " && git submodule foreach git pull"),
               wait = TRUE)
      if (!file.exists(file.path(wd, "modules", submodule, paste0(submodule, ".R")))){
        stop(paste0("Automatic init of submodule did not work (possibly due to ",
                    "older version of git). Please paste the following in your command", 
                    " line (which can be accessed using the Terminal in RStudio): ",
                    paste0("cd ", file.path(getwd(), "modules"), 
                           " && git submodule init ")))
      }
    })
  }
  print(paste0("The following submodules exist and have been initialized: ", 
               whichSubmodules))
}

## Install and load required packages
installAndLoadPkgs <- function(){
  
  if(!require("Require")){
    install.packages("Require")
  }
  library("Require")
  
  setLibPaths(file.path(getwd(), "libraries/4.1/")) 
  
  if (!file.exists(file.path(getwd(), "packageVersions.txt"))){
    
    # 1. Installing SpaDES
    
    Require("PredictiveEcology/SpaDES.install@development")
    if (!dir.exists(file.path(.libPaths()[1], "raster"))){
      install.packages("terra", type = "source")
      install.packages("raster", type = "source")
    }
    
    if(!Require("SpaDES.core")){
      installSpaDES(upgrade = FALSE)
    }
    
    list.of.packages <- c("tidyverse", "nnls","MASS","SpaDES.core","SpaDES.tools",
                          "Cairo","PNWColors", "Hmisc")
    
    # Check you have them and load them
    new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
    if(length(new.packages) != 0) 
      lapply(list.of.packages, Require, character.only = TRUE)
    
    if (!Require("lcmix"))
      Require("lcmix", repos="http://R-Forge.R-project.org")
    
    # NetLogoR is not available on CRAN for R 4.1, but can be downloaded ans installed from here:
    if (!Require("NetLogoR"))
      install.packages("https://cran.r-project.org/src/contrib/Archive/NetLogoR/NetLogoR_0.3.9.tar.gz",
                       repos=NULL, method="libcurl")
    
    Require("reproducible")
    Require("SpaDES.core")
    Require("NetLogoR")
    Require("magrittr")
    Require("raster")
    Require("dplyr")
    Require("Cairo")
    Require("stringr")
    Require("tidyr")
    
    Require::pkgSnapshot() # Use this to be able to install packages from this file
    # i.e., automatically generates list of installed packages and versions that can
    # be used to install. :)
    
  } else {
    library("Require")
    Require(packageVersionFile = file.path(getwd(), "packageVersions.txt"), 
            libPaths = .libPaths()[1])
    Require("reproducible")
    Require("SpaDES.core")
    Require("NetLogoR")
    Require("magrittr")
    Require("raster")
    Require("dplyr")
    Require("Cairo")
    Require("stringr")
  }
}
