library(shiny)

ui <- fluidPage(
  DT::DTOutput(outputId = "dt")
)

server <- function(input, output, session) {
  output$dt <- DT::renderDT({
    DT::datatable(mtcars)
  })
}

shinyApp(ui, server)