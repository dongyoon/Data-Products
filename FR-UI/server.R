library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  #max_time <- input$max_time
  #max_hrr <- input$max_hrr
  #min_time <- input$min_time
  
  source("FR-Function.R")
  

  
  output$distPlot <- renderPlot({
    
    
    max_time <- input$max_time
    max_hrr <- input$max_hrr
    min_time <- input$min_time
    
    hrr_plot(c(input$id),min=min_time,xRange=c(0,max_time),yRange=c(0,max_hrr))  
      
  })
  

})


