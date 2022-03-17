## Install and load required packages
installAndLoadPkgs <- function(){
  
  if(!require("Require")){
    install.packages("Require")
  }
  library("Require")
  
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
    
    Require::pkgSnapshot() # Use this to be able to install packages from this file
    # i.e., automatically generates list of installed packages and versions that can
    # be used to install. :)
    
  } else {
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
}
