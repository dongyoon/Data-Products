library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Heat Release Rate Diagram"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("id", 
                   label = h5("Test ID"), 
                   value = 1),
      br(),
      numericInput("max_time", 
                   label = h5("Time max value(s)"), 
                   value = 1000),
      br(),
      numericInput("max_hrr", 
                   label = h5("HRR max value(KW/m^2)"), 
                   value = 150),
      br(),
      numericInput("min_time", 
                   label = h5("Valley time"), 
                   value = 100)
 
      ),    
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))