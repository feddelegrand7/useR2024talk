library(shiny)

mpg_data <- ggplot2::mpg

ui <- fluidPage(
  shiny::h1("MPG data"),
  DT::DTOutput(outputId = "mpg_data")
)

server <- function(input, output, session) {
 
  output$mpg_data <- DT::renderDT({
    
    DT::datatable(
      data = ggplot2::diamonds,
      extensions = 'Buttons',  
      options = list(
        dom = 'Bfrtip',  
        buttons = list(
          'csv'  
        )
      ),
      rownames = FALSE
    )
    
  }, server = FALSE)
   
}

shinyApp(ui, server)