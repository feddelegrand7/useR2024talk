
ui <- shiny::fluidPage(
  shiny::h2("plot"),
  shiny::tags$details(
    open = NA,
    shiny::tags$summary(
      "click to toggle the plot"
    ),
    
    shiny::plotOutput(outputId = "plt")
  )
  
  
)

server <- function(input, output, session) {
  
  output$plt <- shiny::renderPlot({
    hist(mtcars$mpg)
  })
  

  
}

shinyApp(ui, server)