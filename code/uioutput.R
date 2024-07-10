

ui <- shiny::fluidPage(
  
  shiny::radioButtons(
    inputId = "radio_btn", 
    label = "output type", 
    choices = c("table", "plot")
  ),
  shiny::uiOutput(outputId = "uioutput")
  
)

server <- function(input, output) {
  
  output$uioutput <- shiny::renderUI({
    if (input$radio_btn == "table") {
      shiny::tagList(
        shiny::numericInput(
          inputId = "rows_number", 
          label = "number of rows", 
          value = 10
        ),
        
        shiny::tableOutput(
          "tbl"
        )
      )
      
    } else {
      shiny::tagList(
        shiny::sliderInput(
          inputId = "bins_number", 
          label = "number of bins", 
          min = 0, 
          max = 100, 
          value = 10
        ),
        
        shiny::plotOutput("plt")
      )
    }
  })
  
  
  output$tbl <- shiny::renderTable({
    head(mtcars, input$rows_number)
  })
  
  output$plt <- shiny::renderPlot({
    hist(mtcars$mpg, breaks = input$bins_number)
  })

  
}

shiny::shinyApp(ui = ui, server = server)
