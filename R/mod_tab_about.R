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

          fluidRow(
            align = "center",
            div(id = "content-workflow",

                br(),
                h2("What is your",
                   wrap_none(span("workflow",
                                    class = "cl-sea"), "?")),
                p(style = "padding: none;"),

                ### Data source -------------------------------------------

                shinyWidgets::radioGroupButtons(
                  inputId = ns("which_data"),
                  label = span("Data source:", style = "font-size: 16px;"),
                  choices = c("Upload" = "Upload",
                              "Select" = "Select",
                              "Simulate" = "Simulate"),
                  selected = character(0),
                  checkIcon = list(
                    yes = tags$i(class = "fa fa-check-square",
                                 style = "color: var(--sea);"),
                    no = tags$i(class = "fa fa-square-o",
                                style = "color: var(--danger);"))),

                ### Research question(s) ----------------------------------

                shinyWidgets::radioGroupButtons(
                  inputId = ns("which_question"),
                  label = span("Research question:",
                               style = "font-size: 16px;"),
                  choices = c("Home range",
                              "Speed & distance"),
                  selected = NULL,
                  checkIcon = list(
                    yes = tags$i(class = "fa fa-check-square",
                                 style = "color: var(--sea);"),
                    no = tags$i(class = "fa fa-square-o",
                                style = "color: var(--danger);"))),
                br()

            ) # end of div
          ) # end of fluidRow

        ) # end of column
      ) # end of box // workflow

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
