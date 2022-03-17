## Checking directory
checkDirectory <- function(){
  wd <- getwd()
  if (!grepl(pattern = "fisherLandscapePlanningTool", x = getwd()))
    stop("Please make sure you either open the project file in RStudio (fisherLandscapePlanningTool.RProj) or check the working directory if in R command before running this script. It needs to match the current file's directory (~/fisherLandscapePlanningTool/).")
  print(paste0("Directory correct: ", wd))
}