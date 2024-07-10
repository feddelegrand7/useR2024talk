
get_mpg_data <- function() {
  mpg_data <- ggplot2::mpg
  mpg_data
}

mpg_plot_ui <- function() {
  
  shiny::tagList(
    shiny::h1("Mpg plot"),
    shiny::sliderInput(
      inputId = "bins", 
      label = "", 
      min = 1, 
      max = 100, 
      value = 10
    ),
    shiny::plotOutput(outputId = "plt")
  )
  
}

mpg_plot_server <- function(input, output) {
  
  data_to_use <- get_mpg_data()
  
  output$plt <- shiny::renderPlot({
    hist(data_to_use$hwy, breaks = input$bins)
  })
  
}


ui <- shiny::fluidPage(
  mpg_plot_ui()
)

server <- function(input, output, session) {
  mpg_plot_server(input, output)
}

shiny::shinyApp(ui, server)






