#' comp_tour UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_comp_tour_ui <- function(id) {
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
mod_comp_tour_server <- function(id, vals) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # Build tours: ------------------------------------------------------

    build_mainTour <- function(ns, vals) {
      element <- intro <- character(0)

      tab1 <- paste0("#tab_about_1", "-")
      element <- c(element, paste0(tab1, "about_tour"))
      intro <- c(
        intro,
        HTML(paste(
          "First box, referencing element in tab 1."
        )))

      tab2 <- paste0("#tab_sims_1", "-")
      element <- c(element, paste0(tab2, "sims_intro"))
      intro <- c(
        intro,
        HTML(paste(
          "Second box, referencing element in tab 2."
        )))

      data.frame(element = element,
                 intro = intro,
                 stringsAsFactors = FALSE)

    } # end of main tour


    # If 'guided tour' button is clicked:

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
        # events = list(onbeforechange =
        #                 I("rintrojs.callback.switchTabs(targetElement)")))


    }) %>% # observe event, bound to:
      bindEvent(input$default_tour)


  }) # end of moduleServer
}

## To be copied in the UI
# mod_comp_tour_ui("comp_tour_1")

## To be copied in the server
# mod_comp_tour_server("comp_tour_1")


