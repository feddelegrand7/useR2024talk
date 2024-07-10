library(shiny)

mtcars_rv <- shiny::reactiveVal(value = data.frame())
mpg_rv <- shiny::reactiveVal(value = data.frame())

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
  
  browser()
  
  shiny::observeEvent(input$load, {
    mtcars_rv(mtcars)
    mpg_rv(ggplot2::mpg)
  })
  
  shiny::observeEvent(input$clear,  {
    mtcars_rv(data.frame())
    mpg_rv(data.frame())
  })
  
  
  output$mtcars <- shiny::renderTable({
    
    if (nrow(mtcars_rv()) == 0) {
      return(data.frame())
    }
    
    
    head(mtcars_rv())
    
  })
  
  output$mpg <- shiny::renderTable({
    
    if (nrow(mpg_rv()) == 0) {
      return(data.frame())
    }
    
    head(mpg_rv())
    
  })
  
}

shinyApp(ui, server)