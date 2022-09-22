#' tab_sims UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom stats runif
#'
mod_tab_sims_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(

      shinydashboardPlus::box(

        title = span("Simulate movement data:", class = "ttl-tab"),
        icon = fontawesome::fa(name = "file-signature",
                               height = "21px",
                               margin_left = "14px",
                               margin_right = "8px",
                               fill = "var(--sea-dark)"),
        id = ns("sims_intro"),
        width = NULL,
        solidHeader = FALSE, headerBorder = FALSE,
        collapsible = FALSE, closable = FALSE,

        column(
          align = "center", width = 12,

          p("Choose parameters that reflect your intended",
            "study species, then click the",
            icon("seedling", class = "cl-sea"),
            span("Generate seed", class = "cl-sea"), "and",
            icon("bolt", class = "cl-mdn"),
            HTML(paste0(span("Run simulation", class = "cl-mdn"))),
            "buttons (in that order). If needed, re-adjust any",
            "value until you achieve a simulation that behaves",
            "similarly to your study species.")

        ) # end of column (for text)

      ) # end of box // sims_intro
    ) # end of fluidRow

  ) # end of tagList
}

#' tab_sims Server Functions
#'
#' @noRd
mod_tab_sims_server <- function(id, vals) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns


  }) # end of moduleServer
}

## To be copied in the UI
# mod_tab_sims_ui("tab_sims_1")

## To be copied in the server
# mod_tab_sims_server("tab_sims_1")
