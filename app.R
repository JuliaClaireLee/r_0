#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(numDeriv)
library(ggplot2)
library(deSolve)
library(shiny)
library(shiny)
require(ggplot2)
require(ggplot2)
require(ggforce)
require(devtools)
require(shinythemes)

expont <- function(y){
    c<-curve(y^(x),from = 0, to = 10, n = 10000,type="l",col="red",ylab="number of cases",main="Number of Cases After 10  layers")
    return(c)
}
ui <- fluidPage(theme = shinytheme("united"),
                # Application title
                titlePanel("Contagion"),
                sidebarPanel(
                    numericInput("obs1", "Basic Reproduction Number:", 1.3, min = 1)
      
                    
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                    plotOutput("distPlot"),
                    h5("the proportion of the population that needs to be effectively immunized to prevent sustained spread:", align = "left"),
                    verbatimTextOutput("val2"),
                    plotOutput("Plot")
                )
)


# Server logic
server <- function(input, output) {
    x1 <- 0:10
    output$distPlot <- renderPlot({
        if (input$obs1 != 1){
            expont(input$obs1)  
        }
        else{
          x=0:10
          y=x
          plot(x,y,ylab="number of cases",main="Number of Cases After 10  layers")
          lines(x=0:10, y=x, col="red")  
        }
    })
    output$val2 <- renderText({1-(1/input$obs1)})
 
}

# Complete app with UI and server components
shinyApp(ui, server)