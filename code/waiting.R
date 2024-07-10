library(shiny)

ui <- fluidPage(
  shiny::h1("Let's wait"), 
  shiny::actionButton("click_me", "click me to wait")
  
)

server <- function(input, output, session) {
  
  shiny::observeEvent(input$click_me, {
    Sys.sleep(5)
  })
  
}

shinyApp(ui, server)