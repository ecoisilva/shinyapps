#' comp_tour UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_comp_tour_ui <- function(id){
  ns <- NS(id)
  tagList(
    actionButton(
      inputId = ns("default_tour"),
      label = "Click here for a guided tutorial",
      icon = icon("compass"),
      width = "238px",
      class = "btn-primary")
  )
}

#' comp_tour Server Functions
#'
#' @noRd
mod_comp_tour_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # Build tours: ------------------------------------------------------

    add_action <- span("Action:", class = "tour-action")

    build_mainTour <- function(ns, vals) {
      element <- intro <- character(0)

      element <- c(element, "#Tour_start")
      intro <- c(
        intro,
        HTML(paste(
          p("test1")
        )))

      element <- c(element, ".sidebar")
      intro <- c(
        intro,
        HTML(paste(
          p("sidebar")
        )))

      element <- c(element, "#mod_mod1_1-introbox1")
      intro <- c(
        intro,
        HTML(paste(
          p("test2")
        )))

      data.frame(element = element,
                 intro = intro,
                 stringsAsFactors = FALSE)

    } # end of main tour

    observe({

      tour <- build_mainTour(ns, vals)
      rintrojs::introjs(
        session = session,
        options = list(
          steps = tour,
          showStepNumbers = F,
          showButtons = T,
          showBullets = T,
          scrollToElement = T
        ),
        events = list(onbeforechange =
                        rintrojs::readCallback("switchTabs")))

    }) %>% # observe event, bound to:
      bindEvent(input$default_tour)

  })
}

## To be copied in the UI
# mod_comp_tour_ui("comp_tour_1")

## To be copied in the server
# mod_comp_tour_server("comp_tour_1")
