#' mod1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_mod1_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(

      # Section currently in progress:
      shinydashboardPlus::box(
        id = ns("introbox1"),
        title = NULL,
        width = 12,
        solidHeader = FALSE, headerBorder = FALSE,
        collapsible = FALSE, closable = FALSE,

        mod_comp_tour_ui("comp_tour_1"),

        textInput(ns("introtext"), "Enter an introduction"),
        actionButton(ns("btn"), "Press me"),

        p(),
        rintrojs::introBox(
          textOutput(ns("text")),
          data.step = 1,
          data.intro = "This is the table"
        )

      ), # end of box // tour

      # Workflows section: ------------------------------------------------

      shinydashboardPlus::box(
        id = "about_workflow",
        title = NULL,
        width = 12,
        solidHeader = FALSE, headerBorder = FALSE,
        collapsible = FALSE, closable = FALSE,

        column(
          align = "center", width = 12,

          "test"

        ) # end of column
      ) # end of box // tour

    ) # end of fluidRow
  ) # end to tagList
}

#' mod1 Server Functions
#'
#' @noRd
#'
mod_mod1_server <- function(id) {
  moduleServer( id, function(input, output, session){
    ns <- session$ns


    mod_comp_tour_server("comp_tour_1")
    output$text <- renderText({ input$introtext })

  })
}

## To be copied in the UI
# mod_mod1_ui("mod1_1")

## To be copied in the server
# mod_mod1_server("mod1_1")
