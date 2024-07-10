mtcars_ui <- function() {
  shiny::tagList(
    shiny::h1("mtcars plot"),
    shiny::plotOutput(outputId = "plt")
  )
}

mtcars_server <- function(input, output, session) {
  output$plt <- shiny::renderPlot({
    hist(mtcars$mpg)
  })
}


ui <- shiny::fluidPage(
  mtcars_ui()
)

server <- function(input, output, session) {
  mtcars_server(input, output, session)
}

shiny::shinyApp(ui, server)