#' tab_about UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#'
mod_tab_about_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(

      shinydashboardPlus::box(
        id = ns("about_tour"),
        title = NULL,
        width = 12,
        solidHeader = FALSE, headerBorder = FALSE,
        collapsible = FALSE, closable = FALSE,

        column(
          align = "center", width = 12,

          br(),
          h2("How does this",
             span("application", class = "cl-sea"), "work?"),
          p(),
          mod_comp_tour_ui("tour_1"), p()

        ) # end of column (text)
      ) # end of box // tour

    ) # end of fluidRow
  ) # end to tagList
}

#' tab_about Server Functions
#'
#' @noRd
mod_tab_about_server <- function(id, vals) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns


  })
}

## To be copied in the UI
# mod_tab_about_ui("tab_about_1")

## To be copied in the server
# mod_tab_about_server("tab_about_1")
