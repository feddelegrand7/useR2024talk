

ui <- shiny::fluidPage(
  shiny::textInput(inputId = 'text', label = ""),
  tippy::tippy_this(
    elementId = "text", 
    tooltip = "You're hovering over the text input"
  )
)


server <- function(input, output) {
  
}

shiny::shinyApp(ui, server)
