#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    shinydashboardPlus::dashboardPage(

      options = list(sidebarExpandOnHover = TRUE),
      title = "Study design of movement ecology studies",
      skin = "black",


      header = shinydashboardPlus::dashboardHeader(
        titleWidth = 220,
        title = "Test",
        controlbarIcon = icon("gears")

      ), # end of dashboardHeader

      sidebar = shinydashboardPlus::dashboardSidebar(
        width = 220,

        shinydashboard::sidebarMenu(
          id = "tabs",

          # Tab 1: Home
          shinydashboard::menuItem(
            text = "Home",
            tabName = "about",
            icon = icon("house")
          ),

          # Tab 2 and 3: Upload or simulate data
          shinydashboard::menuItem(
            text = "Data",
            tabName = "data",
            icon = icon("house")
          ))

      ), # end of dashboardSidebar

      body = shinydashboard::dashboardBody(

        shinydashboard::tabItems(

          # Tab 1 'Home'
          shinydashboard::tabItem(
            tabName = "about",
            mod_mod1_ui("mod1_1")),

          # Tab 2.1 'Upload data'
          shinydashboard::tabItem(
            tabName = "data",
            mod_mod2_ui("mod2_1"))

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
      app_title = "shinyapps"
    ),

    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
    rintrojs::introjsUI()

  )
}
