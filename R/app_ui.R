#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(

    # Leave this function for adding external resources
    golem_add_external_resources(),

    # UI ELEMENTS ---------------------------------------------------------

    tags$html(lang = "en"),
    shinydashboardPlus::dashboardPage(

      options = list(sidebarExpandOnHover = TRUE),
      title = "Test App",
      skin = "black",

      # HEADER ------------------------------------------------------------

      header = shinydashboardPlus::dashboardHeader(
        titleWidth = 220,
        title = "App"
      ), # end of dashboardHeader

      # SIDEBAR -----------------------------------------------------------

      sidebar = shinydashboardPlus::dashboardSidebar(
        width = 220,

        shinydashboard::sidebarMenu(
          id = "tabs",

          # Tab 1
          shinydashboard::menuItem(
            text = "Home",
            tabName = "about",
            icon = icon("house")
          ),

          # Tab 2
          shinydashboard::menuItem(
            text = "Data",
            tabName = "data",
            icon = icon("file")
          )

        ) # end of dashboardSidebar
      ), # end of dashboardSidebar
      # BODY --------------------------------------------------------------

      body = shinydashboard::dashboardBody(

        shinydashboard::tabItems(

          # Tab 1 'Home'
          shinydashboard::tabItem(
            tabName = "about",
            mod_tab_about_ui("tab_about_1")),

          # Tab 3 'Simulate data'
          shinydashboard::tabItem(
            tabName = "data",
            mod_tab_sims_ui("tab_sims_1"))

        ) # end of tabItems
      ) # end of dashboardBody

    ) # end of dashboardPage
  ) # end of tagList
}


#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {

  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),

    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Test App"
    ),

    # Misc:
    rintrojs::introjsUI(), # set up introjs
    shinyjs::useShinyjs() # set up shinyjs

  )
}
