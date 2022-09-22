#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  ns <- session$ns
  vals <- reactiveValues()

  mod_tab_about_server("tab_about_1", vals = vals)
  mod_tab_sims_server("tab_sims_1", vals = vals)

  # Interactive tour:
  mod_comp_tour_server("tour_1", vals = vals)

}
