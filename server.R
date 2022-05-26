# server.R

#------------------------------------------------------------------# 
# The application server-side
#------------------------------------------------------------------#

server <- function( input, output, session ){
  # application server logic 
  
  # call module server functions
  
  # mod_page_home_server("home")
  
  mod_page_spades_server("page_spades")
  
}