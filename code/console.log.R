library(shiny)

user_name <- "mihaddaden"
group <- "ADMIN-GROUP"

ui <- fluidPage(
  shinyjs::useShinyjs(), 
  shiny::h1("console.log( ) in Shiny")
)

server <- function(input, output, session) {
  shinyjs::runjs(
    glue::glue(
      "console.log('You are {user_name} and you belong to the group {group}')"
    )
  )
}

shinyApp(ui, server)