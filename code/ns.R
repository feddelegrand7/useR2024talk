mtcars_ui <- function(id) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::h1("mtcars plot"),
    shiny::plotOutput(outputId = ns("plt"))
  )
}

mtcars_server <- function(id) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      output$plt <- shiny::renderPlot({
        hist(mtcars$mpg)
      })
    }
  )
}


ui <- shiny::fluidPage(
  mtcars_ui("some_prefix")
)

server <- function(input, output, session) {
  mtcars_server("some_prefix")
}

shiny::shinyApp(ui, server)