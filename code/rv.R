library(shiny)

data <- shiny::reactiveValues(
  data_mtcars = data.frame(), 
  data_mpg = data.frame()
)

ui <- fluidPage(
  
  shiny::h1("Reactive values"), 
  shiny::actionButton("load", "Load data"), 
  shiny::actionButton("clear", "Clear data"), 
  
  shiny::fluidRow(
    shiny::column(
      width = 6, 
      shiny::tableOutput(outputId = "mtcars")
    ), 
    
    shiny::column(
      width = 6, 
      shiny::tableOutput(outputId = "mpg")
    )
  )
  
 
  
)

server <- function(input, output, session) {
  
  shiny::observeEvent(input$load, {
    data$data_mtcars <- mtcars
    data$data_mpg <- ggplot2::mpg
  })
  
  shiny::observeEvent(input$clear,  {
    data$data_mtcars <- data.frame()
    data$data_mpg <- data.frame()
  })
  
  
  output$mtcars <- shiny::renderTable({
    
    if (nrow(data$data_mtcars) == 0) {
      return(data.frame())
    }
    
    data$data_mtcars
    
  })
  
  output$mpg <- shiny::renderTable({
    
    if (nrow(data$data_mpg) == 0) {
      return(data.frame())
    }
    
    data$data_mpg
    
  })
  
  
}

shinyApp(ui, server)