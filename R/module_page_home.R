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
module_page_home_ui <- function(id){
  
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
    # ,
    # fluidRow(
    #   column(
    #     width = 8,
    #     actionButton(ns("help"), "Take a tour") %>%
    #       bsplus::bs_embed_tooltip(
    #         "Click the button for instructions",
    #         "right"
    #       ),
    #     align = "center",
    #     style = "margin-bottom: 10px;",
    #     style = "margin-top: -10px;"
    #   )
    # )
    )
  )
}


# no server functionality needed at this point. Placeholder for now

#' #' 
#' #' "page-home" server function
#' #' 
#' #' @importFrom shiny reactive reactiveVal observeEvent req callModule eventReactive
#' #' @importFrom dplyr tbl collect mutate arrange select filter pull
#' #' @importFrom shinyFeedback showFeedbackDanger hideFeedback showToast
#' #' 
#' #' @param id The ID for this module
#' #' 
#' #' @return None
#' 
# module_page_home_server <- function(id){
#   moduleServer( id, function(input, output, session){
#     ns <- session$ns
#     
#     # # .. introjs steps ----
#     # steps <- reactive(
#     #   data.frame(
#     #     element = c(
#     #       ".sidebar-menu",
#     #       ".model",
#     #       ".report"
#     #     ),
#     #     intro = c(
#     #       "Step 1: This is the navigation sidebar for the app. Currently, the main feature of the app is in the Spatial Population Model.",
#     #       "Step 2: This is where you define the area of interest and select the landscape scenarios to use in the FLEX model. You can also adjust population model parameters such as survival for each fisher population. Default rates are based on empirical data and expert knowledge.",
#     #       
#     #       "Step 3: When the simulations are done, you can download a summary PDF report"
#     #     ),
#     #     position = c("right", "right", "right")
#     #   )
#     # )
#     # 
#     # observeEvent(
#     #   input$help,
#     #   introjs(
#     #     session,
#     #     options = list(
#     #       steps = steps(),
#     #       "nextLabel" = "Next",
#     #       "prevLabel" = "Previous",
#     #       "skipLabel" = "Skip"
#     #     )
#     #   )
#     # )
#     
#   })
# }
