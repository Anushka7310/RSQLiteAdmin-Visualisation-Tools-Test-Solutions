library(readr)
library(reshape2)
library(plotly)

time_series <- read_csv("time_series_covid19_confirmed_global.csv")




create_plot <- function(country_name) {
  # Renaming a column
  names(time_series)[names(time_series) == "Country/Region"] <-
    "Country"
  time_series <- time_series[time_series$Country == country_name,]
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
              name = country_name) %>%
    layout(
      showlegend = TRUE,
      xaxis = list(
        title = "Date",

        tickformat = "%y",
        tickangle = -90
      ),
      yaxis =  list(title = "Total Cases")
    )
  fig

}



create_plot("India")
