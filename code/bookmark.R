library(shiny)

ui <- fluidPage(
  
  shiny::h1("Bookmarking"),
  
  shiny::numericInput(
    "num", 
    NULL, 
    10, 
    0, 
    100
  ), 
  
  shiny::selectInput(
    "food",
    "Food", 
    choices = c("kitkat", "mars", "fruit"), 
    selected = "fruit"
  ), 
  
  shiny::radioButtons(
    "sport",
    "Sport",
    choices = c("Yes", "No")
  ),
  
  shiny::bookmarkButton()
)

server <- function(input, output, session) {

    
}

shiny::enableBookmarking(store = "url")
shinyApp(ui, server)