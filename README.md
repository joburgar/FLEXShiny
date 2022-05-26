
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FLEXshiny

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## A Shiny app to explore impacts of landscape changes on fisher (*Pekania pennanti*) populations in BC


### Description and Usage

This repository hosts the Shiny app platform for the Fisher Landscape Explorer (FLEX) tool, which is a spatial population model built in a [Spatial Discrete Event Simulation (SpaDES) framework](https://spades.predictiveecology.org/). The FLEX tool will use BC government warehouse publicly available layers to build the landbase and empirical and expert data to specify “suitable” fisher habitat (i.e., the relative probability of occupancy) as per the BC Fisher Habitat Working Group habitat retention tools guidance (https://www.bcfisherhabitat.ca/habitat-tools/) and the Weir and Corbould (2010) predictive variable for “openness”. This input layer may change but regardless of the underlying data, the important piece is that whatever data is used will produce a single “suitable” value for the female fisher territory sized cell to be used in the fisher population model (i.e., Individual Based Model; IBM). The initial simulations used a binary value to differentiate suitable (1) from unsuitable (0) habitat. Once an actual landbase is connected to the IBM, this will be a threshold value, written as an argument function, with the ability of the user to specify. For the first beta version of the Shiny app, the assumption is that the habitat quality is static once the tool starts (i.e., not dynamically changing during the scenarios) while the fisher population will be predicted for 20 years.

The FLEX model code base is hosted in a separate repository on the official GitHub page of the [Province of British Columbia](https://github.com/bcgov/FLEX). This Shiny app interacts with the FLEX model in the git submodule paradigm. Git submodules allow a main repository (e.g., the FLEXShiny repository that you are currently in) to get code, data, or any other information from another repository (e.g., the bcgov/FLEX repository), and use this information without needing to maintain an independent hard copy of those files inside the main repository. [This GitHub article](https://gist.github.com/gitaarik/8735255) reviews the basic principles of git submodules and how to interact with them. This approach allows the Shiny app to be developed separately from the FLEX SpaDES core model, while making it easy to update the information that the Shiny app uses when the model code base changes. This prevents the Shiny App from diverging from the model, while also allowing other parent repositories (e.g. the [bcgov/fisherLandscapePlanningTool](https://github.com/bcgov/fisherLandscapePlanningTool) repository, which is a scripted workflow for using the FLEX model in the R command line) to simultaneously and independently access the information in the FLEX git submodule. 

**Note:** git modules/submodules are not to be confused with SpaDES modules. Here, 'module' is a technical term referring to part of the SpaDES modeling framework. More information about SpaDES modularity and module customization can be found [here](https://cran.r-project.org/web/packages/SpaDES.core/vignettes/i-introduction.html#spades-modules) and [here](https://cran.r-project.org/web/packages/SpaDES.core/vignettes/ii-modules.html).


### To use the Shiny app on your local computer

*To be updated as needed*

1. Please make sure you have git installed in your computer before proceeding. Information on git installation can be found here: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git  

2. Please clone the project to your desired directory using: `git clone git@github.com:essatech/FLEXShiny.git`   

3. Open the FLEXShiny.Rproj file in R Studio
 > ATTENTION: < Make sure you did ***NOT*** check the box saying: `Disable the RProfile execution on session start/resume` located in RStudio >> Tools >> Project Options >> General Tab.   

4. In R command line: Set your home drive to the project folder: i.e., `setwd("~/FLEXShiny")`   

5. Run the code from `git_submodule_init_update.R` line by line to avoid missing error messages. The code will set the correct paths to inputs and outputs for your local computer, and set up communication between the FLEXShiny parent and the bcgov/FLEX submodule. This only needs to be run during initial project setup on your computer, and then again whenever you need to bring in updates from the FLEX git submodule. You may need to generate a ssh key pair to configure your GitHub account in order to read from bcgov/FLEX. [This article](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) explains how to do this.

**Note:** A current work around for a failed submodule init is to simply download the contents of the bcgov/FLEX repo and manually move them to the FLEXShiny/modules/FLEX on your local machine. Once you have a local copy of the module, `git_submodule_init_update.R` will successfully connect to the GitHub remote repo and pull updates. 

**ATTENTION: Read any error messages. They are almost always very informative and in some cases also explain how to solve the current error.** 

6. The code will set the correct paths to inputs and outputs for your local computer, install all libraries in the correct needed versions (which will take some time when you initially set the project up).

6. Once the Shiny app has updated the information from the FLEX submodule, you can run the app by opening the `global.R` file at the top of the main directory, and then pressing the `Run App` button in the top right of the R Studio source pane. You can choose to run the app in the R Studio viewer, in a separate window, or in a browser window by selecting from the drop down options next to the `Run App` button.    


### Requirements

The model is coded using the R programming language. Thus, you will need
to [download program R](https://cran.r-project.org/bin/windows/base/) to
work with the code. 

Components of the project require git to be installed on your computer. Information on git installation can be found here: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git  

We also recommend downloading the free version of
[RStudio](https://rstudio.com/products/rstudio/download/), which
provides a nice integrated development environment for working with R.


### Core Team
*To do*


### Contributors
*To do*


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
