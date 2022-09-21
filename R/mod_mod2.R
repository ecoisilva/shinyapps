#' mod2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_mod2_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(

      shinydashboardPlus::box(
        title = "Select movement data:",
        id = ns("select_intro"),
        width = NULL,
        solidHeader = FALSE, headerBorder = FALSE,
        collapsible = TRUE, closable = FALSE,

        textInput(ns('xcol'), 'X Variable', value = "Sepal.Length"),
        textInput(ns('ycol'), 'Y Variable', value = "Sepal.Width"),
        numericInput(ns('clusters'), 'Cluster count', 3, min = 1, max = 9),
        plotOutput(ns('plot1'))

      ) # end of box // select_intro

    ) # end of fluidRow
  ) # end of tagList
}

#' mod2 Server Functions
#'
#' @noRd
mod_mod2_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # Combine the selected variables into a new data frame
    selectedData <- reactive({
      iris[, c(input$xcol, input$ycol)]
    })

    clusters <- reactive({
      kmeans(selectedData(), input$clusters)
    })

    output$plot1 <- renderPlot({
      palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

      par(mar = c(5.1, 4.1, 0, 1))
      plot(selectedData(),
           col = clusters()$cluster,
           pch = 20, cex = 3)
      points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })

  })
}

## To be copied in the UI
# mod_mod2_ui("mod2_1")

## To be copied in the server
# mod_mod2_server("mod2_1")
