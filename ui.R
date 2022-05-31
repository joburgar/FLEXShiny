# Copyright 2021 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#===========================================================================================#
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
#===========================================================================================#

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
               tabName = "page_home",
               icon = icon("home")),
      
      # Main model page
      menuItem("SpaDES simulation",
               tabName = "page_spades",
               icon = icon("sliders-h")
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
      tabItem(tabName = "page_home",
             mod_page_home_ui("page_home")),
      
      tabItem(tabName = "page_spades",
              mod_page_spades_ui("page_spades"))
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
