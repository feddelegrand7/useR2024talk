library(shiny)

ui <- fluidPage(
  shiny::h1("UI shifting"), 
  DT::DTOutput("tbl"), 
  shiny::actionButton("load_data", "Load data")
)

server <- function(input, output, session) {
  
  shiny::observeEvent(input$load_data, {
    output$tbl <- DT::renderDT({
      head(ggplot2::mpg)
    })
  })
  
}

shinyApp(ui, server)