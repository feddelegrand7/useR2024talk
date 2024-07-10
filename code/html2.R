
ui <- shiny::fluidPage(
  shinyjs::useShinyjs(),
  shiny::h2("plot"),
  shiny::actionButton(inputId = "show_hide", "show/hide"),
  shiny::plotOutput(outputId = "plt")
  
)

server <- function(input, output, session) {
  
  output$plt <- shiny::renderPlot({
    hist(mtcars$mpg)
  })
  
  shiny::observeEvent(input$show_hide, {
    shinyjs::toggle(id = "plt")
  })
  
  
}

shinyApp(ui, server)