
ui <- shiny::fluidPage(
  shiny::h1("Let's wait"), 
  shinybusy::add_busy_spinner(spin = "fading-circle"),
  shiny::actionButton("click_me", "click me to wait")
  
)

server <- function(input, output, session) {
  
  shiny::observeEvent(input$click_me, {
    Sys.sleep(10)
  })
  
}

shinyApp(ui, server)