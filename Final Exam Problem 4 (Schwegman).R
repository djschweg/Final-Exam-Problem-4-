library(shiny)
library(tidyverse)
library(shinyWidgets)

ui <- fluidPage(
  tags$h2("David J. Schwegman", style = "color:blue"),
  h3("FINAL EXAM Shiny App Iris Data",
     style = "color:red"),
  setBackgroundColor("yellow"),
  selectInput("vars", "Iris variables", choices = names(iris)),
  
  mainPanel(
    plotOutput(outputId = "Histogramplotvar1"),
    plotOutput(outputId = "Boxplotvar1"),
    verbatimTextOutput("summary")
  )
)

  server <- function(input,output) {
        output$Histogramplotvar1 <- renderPlot({
      ggplot(iris, aes(x = .data[[input$vars]])) +
        geom_histogram(fill = "blue", col = "red")
    })
        output$Boxplotvar1 <- renderPlot({
          ggplot(iris, aes(x = .data[[input$vars]])) +
            geom_boxplot(fill = "red", col = "blue")
        })
        
    output$summary <- renderPrint({
      summary(iris)     
      
    })
    
  }

shinyApp(ui = ui, server = server)


