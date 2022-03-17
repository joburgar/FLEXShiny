## Install and load required packages
installAndLoadPkgs <- function(){
  
  if(!require("Require")){
    install.packages("Require")
  }
  library("Require")
    flds <- list.dirs(.libPaths()[1], recursive = FALSE)
    if (length(flds) == 0){
      Require(packageVersionFile = file.path(getwd(), "packageVersions.txt"), 
              libPaths = .libPaths()[1], require = FALSE)
      print("Packages installed. Your R Session will restart. Please re-run fisherLandscapPlanningTool-project.R again")
      .rs.restartR()
    } else {
      Require("terra")
      Require("raster")
      Require("reproducible")
      Require("SpaDES.core")
      Require("NetLogoR")
      Require("magrittr")
      Require("dplyr")
      Require("Cairo")
      Require("stringr")
      Require("tidyr")
      Require("data.table")
      Require("qs")
      Require("PNWColors")
      Require("sf")
    }
  }
