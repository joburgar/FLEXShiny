# ui.R

#------------------------------------------------------------------# 
# The application User-Interface
#------------------------------------------------------------------#


ui <- dashboardPage(
  
  skin = "black",
  
  
  dashboardHeader(
    title = tags$span(
      tags$img(src = "./img/gov3_bc_logo.png"),
      "Fisher Landscape Explorer"
    ),
    titleWidth = 475
  ),
  
  dashboardSidebar(
    tags$style(
      tags$link(rel = "stylesheet", type = "text/css", href = "all.css")
    ),
    introjsUI(),
    sidebarMenu(
      # Home page
      menuItem("Home",
               tabName = "home",
               icon = icon("home")),
      # Main model page
      add_class(
         menuItem(
           "SpaDES simulation",
           tabName = "spades",
           icon = icon("sliders-h")
         ),
        "model"
      )
    )
  ),
  
  #--------------------------------------------#
  # associated modules for dashboard menu items
  #--------------------------------------------#
  
  dashboardBody(
    shinyjs::useShinyjs(),
    tags$head(tags$style(
      HTML(
        '.small-box.bg-blue {background-color: rgba(192,192,192,0.2) !important; color: #000000 !important; } .small_icon_test { font-size: 50px; } .info-box {min-height: 75px;} .info-box-icon {height: 75px; line-height: 75px;} .info-box-content {padding-top: 0px; padding-bottom: 0px; font-size: 110%;}'
      )
    ),
    # Import custom css files to html head tag
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    )),
    
    tabItems(
      tabItem(tabName = "home",
             mod_page_home_ui("home")),
      
      tabItem(tabName = "model",
              mod_page_model_ui("spades"))
    ),
    
    
    # navigation footers (BC Gov site)
    # 
    # To check: need to link to css styles again here?
    #
    
    tags$footer(
      class = 'footer',
      tags$div(
        class = 'container',
        tags$ul(
          tags$li(
            tags$a(
              href = '.', 
              'Home'
            )
          ),
          tags$li(
            tags$a(
              href = 'https://www2.gov.bc.ca/gov/content/home/disclaimer',
              'Disclaimer'
            )
          ),
          tags$li(
            tags$a(
              href = 'https://www2.gov.bc.ca/gov/content/home/privacy',
              'Privacy'
            )
          ),
          tags$li(
            tags$a(
              href = 'https://www2.gov.bc.ca/gov/content/home/accessibility', 
              'Accessibility')
          ),
          tags$li(
            tags$a(
              href = 'https://www2.gov.bc.ca/gov/content/home/copyright',
              'Copyright')
          ),
          tags$li(
            tags$a(
              href = 'https://github.com/bcgov/devhub-app-web/issues', 
              'Contact Us')
          )
        )
      )
    )
  )
)
