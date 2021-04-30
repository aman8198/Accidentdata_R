
library(shiny)
library(shinydashboard)
library(ggplot2)

ui <- dashboardPage(
  
  dashboardHeader(title = "Accidents "),
  dashboardSidebar(
    sidebarMenu(
      sliderInput("bins", "Number of bins", min = 1, max = 280, value = 50),
      menuItem("Analysis", tabName = "AccidentandVehicle"),
      menuItem("NaiveBayes", tabName = "prediction")
      
     
      )
  ),
  dashboardBody(
    tabItems(
      tabItem("AccidentandVehicle",
              box(plotOutput("accident_plot"), width = 20),
              
      box(
        selectInput("types", "Features:", c("Vechile.Type","Accident.Type", "Gender")), width = 4
      ),
      
      
      box(plotOutput("acc1_plot"), width = 20)
      
      ),
      
      tabItem("prediction",
              
              box(plotOutput("acc2_plot"), width = 40),
              
              
              box(
                selectInput("types", "Features:", c("Accident.Type","Vechile.Type")), width = 4
              ),
              box(
                selectInput("types1", "Features:", c("Accident.Type","Vechile.Type")), width = 4
              ),
              
              box(
                selectInput("types2", "Features", c( "Gender", "Age")), width = 4
              )
             
              
              )
      
  )
  
    
  )

 )
  