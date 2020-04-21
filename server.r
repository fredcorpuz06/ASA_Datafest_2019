library(shiny)

function(input, output) {
  phys_pca1 <- reactive({filter_df(phys_pca, input$psel, input$tsel1)})
  phys_pca2 <- reactive({filter_df(phys_pca, input$psel, input$tsel2)})
  ment_pca1 <- reactive({filter_df(ment_pca, input$psel, input$tsel1)})
  ment_pca2 <- reactive({filter_df(ment_pca, input$psel, input$tsel2)})
  
  callModule(timeSeries, "physPCA1", phys_pca1, "Physical Fatigue")
  callModule(timeSeries, "mentPCA1", ment_pca1, "Mental Fatigue")
  callModule(timeSeries, "physPCA2", phys_pca2, "Physical Fatigue")
  callModule(timeSeries, "mentPCA2", ment_pca2, "Mental Fatigue")
}
