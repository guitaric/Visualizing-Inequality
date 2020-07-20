

#Main Datei, linkt UI und Server
source('ui.R')
source('server.R')


shinyApp(ui = ui, server = server)

