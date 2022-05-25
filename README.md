
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FLEXshiny

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## BC Fisher Landscape Explorer Shiny App

## A Shiny app to explore impacts of landscape changes on the fisher population in BC

### Description and Usage

### Core Team

### Contributors

### Requirements

The model is coded using the R programming language. Thus, you will need
to [download program R](https://cran.r-project.org/bin/windows/base/) to
work with the code. We also recommend downloading the free version of
[RStudio](https://rstudio.com/products/rstudio/download/), which
provides a nice integrated development environment for working with R.

### License

Copyright 2022 Province of British Columbia

Licensed under the Apache License, Version 2.0 (the “License”); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an “AS IS” BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[![Lifecycle:Experimental](https://img.shields.io/badge/Lifecycle-Experimental-339999)](<Redirect-URL>)

### OVERVIEW

This repository hosts the Shiny app platform for the Fisher Landscape Explorer (FLEX) tool, which is a spatial population model built in a [Spatial Discrete Event Simulation (SpaDES) framework](https://spades.predictiveecology.org/). The FLEX tool will use BC government warehouse publicly available layers to build the landbase and empirical and expert data to specify “suitable” fisher habitat (i.e., the relative probability of occupancy) as per the BC Fisher Habitat Working Group habitat retention tools guidance (https://www.bcfisherhabitat.ca/habitat-tools/) and the Weir and Corbould (2010) predictive variable for “openness”. This input layer may change but regardless of the underlying data, the important piece is that whatever data is used will produce a single “suitable” value for the female fisher territory sized cell to be used in the fisher population model (i.e., Individual Based Model; IBM). The initial simulations used a binary value to differentiate suitable (1) from unsuitable (0) habitat. Once an actual landbase is connected to the IBM, this will be a threshold value, written as an argument function, with the ability of the user to specify. For the first beta version of the Shiny app, the assumption is that the habitat quality is static once the tool starts (i.e., not dynamically changing during the scenarios) while the fisher population will be predicted for 20 years.

The FLEX model codebase is hosted in a separate repository on the official GitHub page of the [Province of British Columbia](https://github.com/bcgov/FLEX). This Shiny app interacts with the FLEX model following the git submodule paradigm. Git submodules allow a main repository (e.g., the FLEXShiny repository that you are currently in) to get code, data, or any other information from another repository (e.g., the bcgov/FLEX repository), and use this information without needing to keep an independent hard copy of those files inside the main repository. [This GitHub article](https://gist.github.com/gitaarik/8735255) reviews the basic principles of git submodules and how to interact with them. This Shiny app handles these details. In this case, this approach allows the Shiny app to be developed separately from the FLEX SpaDES core model, while making it easy to update the information that the Shiny app uses when the model codebase changes. This prevents the Shiny App from diverging from the model, while also allowing other parent repositories to simultaneously and independently access the information in the submodule. *Note:* git modules and submodules are not to be confused with SpaDES modules, where module is a technical term referring to a part of the SpaDES modeling framework. More information about SpaDES modularity and module customization can be found [here](https://cran.r-project.org/web/packages/SpaDES.core/vignettes/i-introduction.html#spades-modules) and [here](https://cran.r-project.org/web/packages/SpaDES.core/vignettes/ii-modules.html).

### TO USE THE MODEL

*TO BE UPDATED*

1. Please make sure you have git installed in your computer before proceeding. Information on git installation can be found here: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git  

2. Please clone the project to your desired directory using: *NEED TO UPDATE THIS* `git clone git@github.com:bcgov/fisherLandscapePlanningTool.git`   

3a. In RStudio (RECOMMENDED: https://www.rstudio.com/products/rstudio/download/#download): Open the project fisherLandscapePlanningTool.Rproj.  
 > ATTENTION: < Make sure you did ***NOT*** check the box saying: `Disable the RProfile execution on session start/resume` located in RStudio >> Tools >> Project Options >> General Tab.   

3b. In R command line: Set your home drive to the project folder: i.e., `setwd("~/fisherLandscapePlanningTool")`   

4. Run the code from `fisherLandscapePlanningTool-project.R` line by line to avoid missing error messages   

5. The code will set the correct paths to inputs and outputs, install all libraries in the correct needed versions (which will take some time), and then it will perform the simulations as expected.   

**ATTENTION: Read any error messages. They are almost always very informative and in some cases also explain how to solve the current error.** 
