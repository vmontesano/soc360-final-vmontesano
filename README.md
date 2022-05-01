# soc360-final-vmontesano
Final Project
## Deliverables
* factbook.json - JSON version of CIA World Factbook created by GitHub user @iancoleman
* New Final.Rmd - Workspace for creating most of my code and creating data frame to be imported by the final app
* final_data.csv - CSV file which serves as the vehicle to deliver data frame from New Final.Rmd to FinalShiny.R
* FinalShiny.R - Final Shiny app 
## Short Summary of Markdown File
* Reads factbook.json
* Extracts selected data from JSON list with for-loop
* Experiments with code to extract Time Data using Sys.time function
* Creates data frame to be used by final app 
* Experiments with creating bar charts using ggplot
* Writes the CSV file mentioned above
## Short Summary of App
* Reads the CSV file mentioned above
* Creates vector of current date-time in each country upon loading the app
* ui.R - Establishes layout of the app
* server.R - Renders output - Selection Pane to choose dependent vaiable of chart, Bar Chart to compare data between countries, Table to display all data points (including an added column for the Time Data)
