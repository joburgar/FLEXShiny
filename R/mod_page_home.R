#' "page-home" server function
#' 
#'
#' @importFrom shiny NS tagList fluidRow column actionButton tags
#' @importFrom shinydashboard box
#'
#' @param id The id for this module
#'
#' @return a tagList containing UI elements
#'
mod_page_home_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
    box(width = 12,
        fluidRow(
          column(width = 1),
          column(width = 6,
                 
                 h2("Welcome to FLEX: The BC Fisher Landscape Explorer"),
                 
                 br(),
                 
                 p("The Fisher Landscape Explorer allows you to run a spatial population model to simulate how changes to the forest landscape (e.g., timber harvesting) will affect fishers in BC. "),
                 br(), 
                 
                 p("The underlying model is a spatial individual based model of a fisher population based on empirical survival and forested habitat suitability data."),
                 
                 br(),
                 
                 p("To run the simulation, select or enter your desired simulation input values. You can adjust fisher population parameters of the underlying model for each of the Boreal and Columbian fisher populations, or you can accept the default values. Once you have specified all the inputs, you can run the model and view the displayed results. The simulation may take several minutes to run."),
                 br(),
                 
                 #   p("When the model run has completed, you can review the results and download them as a PDF.")
                 # ),
          ),
          column(width = 5,
                 align = "center",
                 br(),
                 br(),
                 img(src = "../img/fisher.png", width = 250)
          )
        )
    )
  )
}


