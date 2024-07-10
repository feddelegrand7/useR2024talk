
MPGData <- R6::R6Class(
  public = list(
    ui = function() {
      shiny::tagList(
        shiny::h1("Mpg plot"),
        shiny::sliderInput(inputId = "bins", label = "", min = 1, max = 100, value = 10),
        shiny::plotOutput(outputId = "plt")
      )
    }, 
    
    server = function(input, output) {
      
      data_to_use <- private$.get_mpg_data()
      
      private$.render_mpg_plot(input, output, data_to_use)
      
      
    }
  ),
  
  private = list(
    
    .get_mpg_data = function() {
      ggplot2::mpg
    }, 
    
    .render_mpg_plot = function(input, output, data_to_use) {
      output$plt <- shiny::renderPlot({
        hist(data_to_use$hwy, breaks = input$bins)
      })
    }
    
  )
)

mpg_instance <- MPGData$new()

ui <- shiny::fluidPage(
  mpg_instance$ui()
)

server <- function(input, output, session) {
  mpg_instance$server(input, output)
}

shiny::shinyApp(ui, server)






