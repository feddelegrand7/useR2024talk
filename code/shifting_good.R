
ui <- shiny::fluidPage(
  shiny::h1("UI shifting"), 
  shiny::div(
    style = "min-height: 250px;",
    DT::DTOutput("tbl"), 
  ), 
  shiny::actionButton("load_data", "Load data"), 
  
  shiny::plotOutput(outputId = "plt")
)

server <- function(input, output, session) {
  
  shiny::observeEvent(input$load_data, {
    output$tbl <- DT::renderDT({
      browser()
      info <- shiny::getCurrentOutputInfo()
      head(ggplot2::mpg)
    })
  })
  
  output$plt <- shiny::renderPlot({
    browser()
    info <- shiny::getCurrentOutputInfo()
    hist(mtcars$mpg)
  })
  
}

shiny::shinyApp(ui, server)