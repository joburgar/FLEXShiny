# Copyright 2021 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#===========================================================================================#
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
#===========================================================================================#

# global.R

# Have you set the project up yet? If not, got to git_submodule_project_setup.R
# rstudioapi::navigateToFile("git_submodule_init_update.R")

# FLEX model packages (specified versions below, where needed)
# bypass the automated package checking workflow for now
# use remotes::install_version() to get specific version from CRAN (not sure if actually needed)

# require(remotes)

# remotes::install_version("NetLogoR",
#                          version = "0.3.9",
#                          repos = "http://cran.us.r-project.org")


## Install and load required packages
source("R/installAndLoadPkgs.R")
installAndLoadPkgs()


# require(NetLogoR) # Version: 0.3.9
# require(SpaDES.core) # Version: 1.0.10, this the current version on CRAN
# require(reproducible)
# 
# require(magrittr)
# require(dplyr)
# require(Cairo)
# require(stringr)
# require(tidyr)
# require(data.table)
# require(qs)
# require(PNWColors)
# require(sf)
# require(raster)


# load required packages
require(devtools)
require(DT)
require(bsplus)
require(config)
require(data.table)
require(dplyr)
require(ggplot2)
require(plotly)
require(purrr)
require(rintrojs)
require(rmarkdown)
require(shiny)
require(shinyBS)
require(shinycssloaders)
require(shinydashboard)
require(shinydashboardPlus)
require(shinyjs)
require(shinyFeedback)
require(attempt)
require(config)
require(reshape2)
require(tidyverse)
require(dynutils)
require(plotly)
require(DT)


## Setting up working directory paths for SpaDES module framework
## checkPath() checks for formatting consistency and will paste the correct path
## SpaDES.core::setPaths() accesses spades options and sets directory paths

## Setting up paths
setPaths(cachePath = checkPath(file.path(getwd(), "cache"), create = TRUE),
         inputPath = checkPath(file.path(getwd(), "inputs"), create = TRUE),
         outputPath = checkPath(file.path(getwd(), "outputs"), create = TRUE),
         modulePath = checkPath(file.path(getwd(), "modules"), create = TRUE),
         rasterPath = checkPath(file.path(getwd(), "tempDir"), create = TRUE))

## Setting up simulation time 
## to use the scheduler as expected.
simTimes <- list(start = 0, end = 2) # need to figure out how to get it to be dynamic # have to add in clus object piece


## Setting up modules list 
moduleList <- list("FLEX") # Name of the modules to run

## Setting up parameter defaults (the UI selectors will default to these)
## If you provide an empty list of parameters, these are below are the 
## defaults
## NOTE: If you provide an empty list of parameters, these are below are the 
## defaults
parameters <- list(
  FLEX = list(
    "simulations" = 5, # using 5 for ease of testing, change to 100 once running (number of simulations)
    "calculateInterval" = 1, # the simulation time at which adult female established territories are calculated
    "propFemales" = 0.3, 
    "maxAgeFemale" = 9,
    "D2_param" = c("Max","SD")
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

