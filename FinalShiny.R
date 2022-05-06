
library(shiny)
library(jsonlite)
library(tidyverse)
library(ggplot2)
library(lubridate)
library(scales)

data <- read_csv("final_data.csv")

CurrentTime <- Sys.time()

BangTime <- with_tz(CurrentTime, tzone = "UTC") + 6*60*60

IndiaTime <- with_tz(CurrentTime, tzone = "UTC") + 11*30*60

PhilTime <- with_tz(CurrentTime, tzone = "UTC") + 8*60*60 

CamTime <- with_tz(CurrentTime, tzone = "UTC") + 7*60*60

FijiTime <- with_tz(CurrentTime, tzone = "UTC") + 12*60*60

ThaiTime <- with_tz(CurrentTime, tzone = "UTC") + 7*60*60

VietTime <- with_tz(CurrentTime, tzone = "UTC") + 7*60*60

NepTime <- with_tz(CurrentTime, tzone = "UTC") + 5.75*60*60

Times <- as.character(as.POSIXct(c(BangTime, IndiaTime, PhilTime, CamTime, FijiTime, ThaiTime, VietTime, NepTime))
         %>% format(format="%m/%d %H:%M")) 

ui <- fluidPage(

    titlePanel(
      h2("IPOP Data", align = "center") 
      ),

    sidebarLayout(
        sidebarPanel(
            
            selectInput(inputId = "var_y", 
                        label = "Select Data Point:", 
                        choices = colnames(data)[2:4]),
        ),

        mainPanel(
          
          plotOutput("bargraph"),
          
          tableOutput("maintable")
          
        )
    )
)

server <- function(input, output) {
  
    files <- reactiveValues()
  
    observe(files$data <- data)

    output$bargraph <- renderPlot({
        
      ggplot(data=files$data, aes(x = Country, y = files$data[[input$var_y]], fill = Country)) + 
        ylab(input$var_y) + geom_col() + theme(legend.position="none") + ggtitle("Country Information") +
        theme(plot.title = element_text(face = "bold", size = 18, hjust = .5)) + scale_y_continuous(n.breaks = 10, labels = comma)
        
    })
    
    output$maintable <- renderTable({files$data %>% add_column(Times)})
    
}

shinyApp(ui = ui, server = server)
