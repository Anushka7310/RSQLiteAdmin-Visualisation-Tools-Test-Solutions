# RSQLiteAdmin-Visualisation-Tools-Test-Solutions

This Repo Contain solutions of test for [RSQLiteAdmin Visualisation Tools](https://github.com/rstats-gsoc/gsoc2022/wiki/RSQLiteAdmin-Visualisation-Tools). 

## Easy: Install the package rsqliteadmin from CRAN and play around with all the features. Create a database, add a table and import some data. Edit, search and export it. 

For this task, I've explored the rsqliteadmin package from CRAN. I've explored different features of rsqliteadmin such as creating database, creating table, adding rows, exporting and importing table and etc. I also took some screenshot while I was exploring and added them in folder named easy.

<hr>

## Medium 1: Plot a time-series line chart on a dataset of your choice with different variables in a single chart. Customize it to make it clear and insightful.

For this task, I've choosen covid-19 total confirmed cases database and tried to show time-series data using plotly. In the R script I've created a function for that. User can pass the name of thier country as a parameter and it'll evaluate plot for that country.

![Screenshot from 2022-03-23 22-49-50](https://user-images.githubusercontent.com/61081130/160177976-a45901ba-fe6f-47f6-bb79-0ac902d199cf.png)


<hr>

## Medium 2: Create a simple package using the Golem R package that contains a Shiny application to view the chart above.

For this card, I've created a shiny dashboard using golem package. I've created a module to render the plot and use the module in UI and Server File. I've also added a select input UI to alllow user to select their country from a dropdown list. 
A live version of App can be found [here](https://imanushka.shinyapps.io/Medium2/).![Screenshot from 2022-03-23 23-54-43](https://user-images.githubusercontent.com/61081130/160178156-cf9920ca-9b88-46c5-a705-32c4a7aeafdd.png)



