#-------------------------------Introduction
intropage <- 
  
  fluidPage(
    fluidRow(
      h1(tags$strong("Visualizing Inequality"), align = 'center'),
      
      h3("Wherever a good is distributed among persons or a group of persons or even whole countries, inequality can be found.
         Inequality is present, when an equal distribution of the good is absent. The higher a good is concentrated on one member
         of the examined population, the higher the concentration is. 
         Research differs between relative inequality and absolute inequality. BLABALBLA. "),
      br(),
      
      h3("Inequality metrics are statistical instruments to quantify the degree of inequality in a given population. 
         There is a wide range of metrics that may differ in the way of quantifying inequality or the scope of application. 
         That is, there are metrics that reflect the given inequality better than others under certain circumstances. 
         
         This Shiny App provides an integrational work to collect the most common inequality metric used in science and statistics.
         
         The first part of the Shiny App briefly introduces the metric, resepctively, with real world exmaples. 
         In the second part, own datasets can be uploaded in order to calculate the diverse inequality metrics and ratios, 
         and visuailize the data. ")
      
      
      
    )
  )
