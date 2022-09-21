#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  vals <- reactiveValues()

  mod_mod1_server("mod1_1")
  mod_mod2_server("mod2_1")

}
