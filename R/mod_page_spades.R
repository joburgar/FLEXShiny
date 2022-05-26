#' "page-model" UI function
#' 
#' @importFrom shiny NS tagList fluidRow column actionButton tags
#' @importFrom shinydashboard box
#'
#' @param id The id for this module
#'
#' @return a tagList containing UI elements
#'
mod_page_spades_ui <- function(id) {
  
  ns <- NS(id)
  
  tagList(
    fluidRow(
      column(width = 3,
        wellPanel(
          h3("Simulation parameters"),

          numericInput(inputId = ns("input_iterations"),
                       label = "Iterations (#)",
                       value = parameters$FLEX$iterations,
                       min = 1,
                       max = 100,
                       step = 1),
          
          numericInput(inputId = ns("input_propFemales"),
                       label = "Proportion Females (0-1)",
                       value = parameters$FLEX$propFemales,
                       min = 0,
                       max = 1,
                       step = 0.01),
          
          numericInput(inputId = ns("input_maxAgeFemale"),
                       label = "Max Age Female",
                       value = parameters$FLEX$maxAgeFemale,
                       min = 1,
                       max = 100,
                       step = 1),
          
          radioButtons(inputId = ns("input_D2_param"),
                       label = "D2 Parameter",
                       choices = c("Max" = "Max",
                                   "SD" = "SD"),
                       selected = "Max",
                       inline = TRUE),

          
          numericInput(inputId = ns("input_clus_yrs"),
                       label = "CLUS Years",
                       value = parameters$FLEX$clus_yrs,
                       min = 1,
                       max = 100,
                       step = 1),


          
          #-------------------#
          # run the model
          #-------------------#      
          
          h4("Ready?"),
          actionButton(
            inputId = ns("run_model"),
            label = "Run the model",
            class = "btn-FLEX",
            icon = icon("play")
          )
        )
      ),
      
      column(width = 9,
        fluidRow(
          uiOutput(ns("results_summary"))
                 ),
        fluidRow(
          plotOutput(ns("model_output_heatmap"), height = 600),
        ),
        fluidRow(
          plotlyOutput(ns("time_series_plot"))
        )
      )
    )
  )
}


#' "page-model" server function
#'
#' @importFrom shiny reactive reactiveVal observeEvent req callModule eventReactive
#' @importFrom dplyr tbl collect mutate arrange select filter pull
#' 
#' @importFrom shinyFeedback showFeedbackDanger hideFeedback showToast
#'
#' @param id The ID for this module
#'
#' @return None
#'
mod_page_spades_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    ns <- session$ns
    

    # Define reactive values for outputs
    rv_heatmap_data <- reactiveValues(data = NULL)
    rv_sim_full <- reactiveValues(data = NULL)
    rv_ts_data <- reactiveValues(data = NULL)
    

    #-----------------------------------------#
    # Run the model when button is clicked
    #-----------------------------------------#
    
    observeEvent(input$run_model, {
      
      print("Running model...")
      
      # Update the parameters object based on input values
      parameters$FLEX$iterations <- input$input_iterations
      parameters$FLEX$propFemales <- input$input_propFemales
      parameters$FLEX$maxAgeFemale <- input$input_maxAgeFemale
      parameters$FLEX$D2_param <- input$input_D2_param
      #parameters$FLEX$clus_yrs <- input$input_clus_yrs # THIS SEEMS TO BREAK IT
 
      # Setting up the outputs to be saved
      mySim <- simInitAndSpades(times = simTimes,
                                modules = moduleList,
                                params = parameters,
                                outputs = outputs)
      
      # Update population info
      rv_sim_full$data <- mySim
      
      
      # Update the plot data
      rv_ts_data$data <- mySim$FLEX_agg_output
      rv_heatmap_data$data <- mySim$FLEX_heatmap$raster
      
      
    })
    
    #-----------------------------------------#
    # Update results summary
    #-----------------------------------------#
    output$results_summary <- renderUI({
      
      tagList(
        fluidRow(
          column(width = 4,
                 tags$span("Suitable Habitat: "),
                 tags$span(rv_sim_full$data$FLEX_setup$pop_info$suitable_habitat)
                 ),
          column(width = 4,
                 tags$span("Total Habitat: "),
                 tags$span(rv_sim_full$data$FLEX_setup$pop_info$total_habitat)
          ),
          column(width = 4,
                 tags$span("Habitat Percentage: "),
                 tags$span(rv_sim_full$data$FLEX_setup$pop_info$perc_habitat)
          )
        ),
        fluidRow(
          column(width = 4,
                 tags$span("Num AF Start: "),
                 tags$span(rv_sim_full$data$FLEX_setup$pop_info$numAF_start)
          ),
          column(width = 4,
                 tags$span("Non Zero Sims: "),
                 tags$span(paste(rv_sim_full$data$FLEX_heatmap$nozerosims, collapse = ', '))
          )
        ),
        fluidRow(
          column(width = 4,
                 tags$span("Fisher N mean: "),
                 tags$span(rv_sim_full$data$FLEX_heatmap[[3]]$Fisher_Nmean) 
          ),
          column(width = 4,
                 tags$span("Fisher Nse: "),
                 tags$span(rv_sim_full$data$FLEX_heatmap[[3]]$Fisher_Nse)
          ),
          column(width = 4,
                 tags$span("F-predicted: "),
                 tags$span(rv_sim_full$data$FLEX_heatmap[[3]]$Fpredicted)
          )
        ),
      )
    })
    
    #-----------------------------------------#
    # Update time series plots
    #-----------------------------------------#
    # Listen for a change in rv_heatmap_data
    output$time_series_plot <- renderPlotly({
      #browser()
      dat <- rv_ts_data$data
      
      if(is.null(dat)) {
        return(NULL)
      }

      plot_ly(dat, x = ~TimeStep, y = ~Count,
              type = 'scatter', mode = 'lines', split = ~Run)
      
    })
    
    
    #-----------------------------------------#
    # Update heat map plot
    #-----------------------------------------#
    # Listen for a change in rv_heatmap_data
    output$model_output_heatmap <- renderPlot({
      #browser()
      r <- rv_heatmap_data$data
      
      if(is.null(r)) {
        return(NULL)
      }

      # Plot the raster heatmap
      raster::plot(r)
      
    })
    
    
    
  }
  )
}

