library(shiny)

mpg_data <- ggplot2::mpg

ui <- fluidPage(
  shiny::h1("MPG data"),
  DT::DTOutput(outputId = "mpg_data"), 
  shiny::downloadButton(outputId = "data_download", label = "download data")
)

server <- function(input, output, session) {
  
  output$mpg_data <- DT::renderDT({
    DT::datatable(
      data = mpg_data,
      extensions = 'Buttons', 
      rownames = FALSE
    )
    
  }, server = TRUE)
  
  output$data_download <- shiny::downloadHandler(
    filename = function() {
      "data.csv"
    },
    content = function(file) {
      data.table::fwrite(mpg_data, file)
    }
  
  )
  
}

shinyApp(ui, server)