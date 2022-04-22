#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(jsonlite)
library(tidyverse)
library(ggplot2)

data <- read_csv("final_data.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("IPOP Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "var_y",
                        label = "Select Data Point to Compare:",
                        choices = colnames(data))
        ),

        # Show a plot of the generated distribution
        mainPanel(
          
          plotOutput("bargraph"),
          
          tableOutput("maintable"),
          
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
    files <- reactiveValues()
  
    observe(files$data <- data)

    output$bargraph <- renderPlot({
        
      ggplot(data=files$data, aes(x = Country, y = files$data[[input$var_y]]))+ geom_col() +
         + theme_bw()
      
    }                      )
    
    output$maintable <- renderTable({file$data})
    
}

# Run the application 
shinyApp(ui = ui, server = server)
