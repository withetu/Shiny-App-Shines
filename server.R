
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

# ===========================================================================================================
# Three R Shiny tricks to make your Shiny app shines (2/3): Semi-collapsible sidebar
# https://www.r-bloggers.com/three-r-shiny-tricks-to-make-your-shiny-app-shines-23-semi-collapsible-sidebar/
# ===========================================================================================================



library(shiny)
library(shinydashboard)
shinyServer(function(input,output,session){
  vals<-reactiveValues()
  vals$collapsed=FALSE
  observeEvent(input$SideBar_col_react,
               {
                 vals$collapsed=!vals$collapsed
               }
  )
  
  
  output$Semi_collapsible_sidebar<-renderMenu({
    if (vals$collapsed)
      sidebarMenu(
        menuItem(NULL, tabName = "dashboard", icon = icon("dashboard")),
        menuItem(NULL, icon = icon("th"), tabName = "widgets",
                 badgeColor = "green"),
        menuItem(NULL, icon = icon("bar-chart-o"),
                 menuSubItem(span(class="collapsed_text","Sub-item 1"), tabName = "subitem1"),
                 menuSubItem(span(class="collapsed_text","Sub-item 2"), tabName = "subitem2")
        ))
    else
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Widgets", icon = icon("th"), tabName = "widgets", badgeLabel = "new",
                 badgeColor = "green"),
        menuItem("Charts", icon = icon("bar-chart-o"),
                 menuSubItem("Sub-item 1", tabName = "subitem1"),
                 menuSubItem("Sub-item 2", tabName = "subitem2")
        ))
  })
})



