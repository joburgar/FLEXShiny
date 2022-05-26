## Checking modules
checkingModules <- function(updateSubmodules = FALSE, # Should the submodules be updated?
                            whichSubmodules = "FLEX", # Specify which modules to be added
                            hostLink = "git@github.com:bcgov/FLEX.git"){ # Specify the github (SSH) paths to the modules
  wd <- getwd()
  names(hostLink) <- whichSubmodules
  submoduleExist <- grepl(x = list.dirs(file.path(wd, "modules/"), recursive = FALSE),
                          pattern = paste(whichSubmodules, collapse = "|"))
  if (!all(submoduleExist)){
    lapply(whichSubmodules[!submoduleExist], function(submodule){
      addSubMCommand <- paste0("cd ", file.path(getwd(), "modules"), " && git submodule add ", hostLink[submodule])
      ex <- system(addSubMCommand, wait = TRUE)
      if (ex == 127)
        stop(paste0("Automatic submodule cloning did not work (possibly due to ",
                    "Windows use). Please paste the following in your command", 
                    " line (which can be accessed using the Terminal in RStudio): ",
                    paste0("cd ", getwd(), " && git submodule update")))
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
                    paste0("cd ", getwd(), " && git submodule update")))
      }
    })
  }
  print(paste0("The following submodules exist and have been initialized: ", 
               whichSubmodules))
}

