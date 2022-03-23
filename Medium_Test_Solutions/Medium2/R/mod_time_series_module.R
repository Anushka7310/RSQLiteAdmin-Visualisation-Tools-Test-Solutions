#' time_series_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_time_series_module_ui <- function(id){
     choices <- read_csv("time_series_covid19_confirmed_global.csv")
  ns <- NS(id)
  tagList(
       fluidRow(
            selectInput(ns("countryName"), choices=choices$`Country/Region`, selected = "India", label="Select Country"),
            uiOutput(ns("plot")),

       )

  )
}

#' time_series_module Server Functions
#'
#' @noRd
mod_time_series_module_server <- function(id, time_series){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$plot <- renderUI({
         # Renaming a column
         names(time_series)[names(time_series) == "Country/Region"] <-
              "Country"
         time_series <- time_series[time_series$Country == input$countryName,]
         # Remove unwanted columns
         time_series <- time_series[c(-1, -3, -4)]
         time_series <-
              melt(
                   time_series,
                   id.vars = "Country",
                   value.name = "value",
                   variable.name = "date"
              )

         # Creating plot using plotly
         fig <- plot_ly(time_series, type = "scatter", mode = "lines") %>%
              add_trace(x =  ~ date,
                        y = ~ value,
                        name = input$countryName) %>%
              layout(
                   showlegend = TRUE,
                   heights = "100%",
                   xaxis = list(
                        title = "Date",

                        tickformat = "%y",
                        tickangle = -90
                   ),
                   yaxis =  list(title = "Total Cases")
              )
         fig
    })
  })
}

## To be copied in the UI
# mod_time_series_module_ui("time_series_module_1")

## To be copied in the server
# mod_time_series_module_server("time_series_module_1")
