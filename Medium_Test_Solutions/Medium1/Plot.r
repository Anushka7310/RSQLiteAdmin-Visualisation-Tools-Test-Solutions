library(readr)
library(reshape2)

time_series <- read_csv("time_series_covid19_confirmed_global.csv")

#Renaming a column
names(time_series)[names(time_series) == "Country/Region"] <-
  "Country"

#Remove unwanted columns
time_series <- time_series[c(-1,-3,-4)]
time_series <-
  melt(
    time_series,
    id.vars = "Country",
    value.name = "value",
    variable.name = "date"
  )
