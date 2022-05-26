# Fisher Landscape Planning Tool

# Overview

# This document outlines the usage of the git module in the FLEXShiny shiny app
# The main module is the Fisher Landscape Explorer (FLEX) tool 
# Ensure there is a local copy of the FLEX module structure in the /modules/ directory.
# For now, manually downloaded contents from bcgov/FLEX, once contents are in modules/FLEX the git submodule update will work as expected

# Checking directory
source("R/checkDirectory.R")
checkDirectory()

# Install and load required packages
# Not desired at this point, as it will not be stable once deployed to shinyapps.io. Instead, load R packages in global.R using standard library() calls
# eventually, the shiny app should be built as a R Package which will allow specific package versions to be declared in the DESCRIPTION file.

# source("R/installAndLoadPkgs.R")
# installAndLoadPkgs()



## Checking modules
# To properly run this model, please make sure all submodules of interest have also been downloaded and, if using GitHub,  initialized (to check if a module has been initialized, please go to the module's folder and check for existing files. If no files can be found, please run the following commands).  
source("R/checkingModules.R")
checkingModules(updateSubmodules = TRUE, # Should the submodules be updated?
                whichSubmodules = "FLEX", # Specify which modules to be added
                hostLink = "git@github.com:bcgov/FLEX.git" # Specify the github (SSH) paths to the modules
)
