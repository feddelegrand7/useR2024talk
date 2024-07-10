ui <- shiny::fluidPage(
  
  shiny::div(
    shiny::textInput(inputId = 'text', label = ""),
    title = "You're hovering over the text input using only HTML",
    width = "150px"
  )
  
)


server <- function(input, output) {
  
}

shiny::shinyApp(ui, server)
