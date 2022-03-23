#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
     time_series <- read_csv("time_series_covid19_confirmed_global.csv")
     mod_time_series_module_server("time_series_module_1", time_series)
}
