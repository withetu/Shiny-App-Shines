
# This is the user-interface definition of a Shiny web application.
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

dashboardPage(
  dashboardHeader(title="Semi-collapsible Sidebar"),
  dashboardSidebar(sidebarMenuOutput("Semi_collapsible_sidebar"),              
                   tags$script("$(document).on('click', '.sidebar-toggle', function () {
                               Shiny.onInputChange('SideBar_col_react', Math.random())});"),
                   tags$script("$(document).on('click', '.treeview.active', function () {
                               $(this).removeClass('active');
                               $(this).find( 'ul' ).removeClass('menu-open'); 
                               $(this).find( 'ul' ).css('display', 'none'); 
                               
                               
                               });")),
  dashboardBody(tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")))
  )
