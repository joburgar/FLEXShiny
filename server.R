# server.R

#------------------------------------------------------------------# 
# The application server-side
#------------------------------------------------------------------#

server <- function( input, output, session ){
  # application server logic 
  
  # call module server functions
  
  # module_page_home_server("page_home")
  
  module_page_model_server("page_model")
  
}