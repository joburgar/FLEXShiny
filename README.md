# OVERVIEW

This project hosts the Fisher Landscape Planning Tool, which the main module is the Fisher Landscape Explorer (FLEX) tool (located in the modules' folder as a submodule to this project). The FLEX tool will use BC government warehouse publicly available layers to build the landbase and empirical and expert data to specify “suitable” fisher habitat (i.e., the relative probability of occupancy) as per the BC Fisher Habitat Working Group habitat retention tools guidance (https://www.bcfisherhabitat.ca/habitat-tools/) and the Weir and Corbould (2010) predictive variable for “openness”. This input layer may change but regardless of the underlying data, the important piece is that whatever data is used will produce a single “suitable” value for the female fisher territory sized cell to be used in the fisher population model (i.e., Individual Based Model; IBM). The initial simulations used a binary value to differentiate suitable (1) from unsuitable (0) habitat. Once an actual landbase is connected to the IBM, this will be a threshold value, written as an argument function, with the ability of the user to specify. For the first beta version of the R shiny app, the assumption is that the habitat quality is static once the tool starts (i.e., not dynamically changing during the scenarios) while the fisher population will be predicted for 20 years.

# TO USE THE MODEL

1. Please make sure you have git installed in your computer before proceeding. Information on git installation can be found here: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
2. Please clone the project to your desired directory using: `git clone git@github.com:tati-micheletti/fisherLandscapePlanningTool.git`
3a. In RStudio (RECOMMENDED: https://www.rstudio.com/products/rstudio/download/#download): Open the project fisherLandscapePlanningTool.Rproj.  
 >>> ATTENTION: <<< Make sure you did ***NOT*** check the box saying: `Disable the RProfile execution on session start/resume` located in RStudio >> Tools >> Project Options >> General Tab.
3b. In R command line: Set your home drive to the project folder: i.e., `setwd("~/fisherLandscapePlanningTool")`
4. Run the code from `fisherLandscapePlanningTool-project.R` line by line to avoid missing error messages
5. The code will set the correct paths to inputs and outputs, install all libraries in the correct needed versions (which will take some time), and then it will perform the simulations as expected.

**ATTENTION: Read any error messages. They are almost always very informative and in some cases also explain how to solve the current error.** 
