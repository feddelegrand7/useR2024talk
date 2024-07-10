
ui <- shiny::fluidPage(
  shiny::h2("table"), 
  shiny::numericInput(
    inputId = "rows_number", 
    label = "number of rows", 
    value = 10
  ), 
  shiny::tableOutput(outputId = "tbl"),
  
  shiny::br(),
  
  shiny::h2("plot"),
  shiny::sliderInput(
    inputId = "bins_number", 
    label = "bins",
    min = 5, 
    max = 100,
    value = 30
  ),
  shiny::plotOutput(outputId = "plt")
)
server <- function(input, output) {
  
  output$tbl <- shiny::renderTable({
    head(mtcars, input$rows_number)
  })
  
  output$plt <- shiny::renderPlot({
    hist(mtcars$mpg, breaks = input$bins_number)
  })

}

shiny::shinyApp(ui = ui, server = server)