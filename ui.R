library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(shinyjs)

library(ggplot2)
library(plotly)
library(data.table)
library(R.utils)
library(stringr)
library(schoolmath)
library(openxlsx)
library(entropy)

#----------------------------------Sources
# source('overviewcalc.R')
source('vectortoDT.R')
# source('indextable.R')
# # 
# 
source('Intro ui.R')
source('Gini.R')
source('Gini ui.R')
#source('Gini server.R')
source('Hoover.R')
source('Hoover ui.R')
source('Rosenbluth.R')
source('Rosenbluth ui.R')
source('Hhi.R')
source('Hhi ui.R')
source('Simpson.R')
source('Simpson ui.R')
source('Shannon.R')
source('Shannon ui.R')
source('GEI.R')
source('GEI ui.R')
source('Atkinson.R')
source('Atkinson ui.R')
source('Ratios.R')
source('Ratios ui.R')
source('Allinone ui.R')
source('Calculate.R')
source('Calculate ui.R')
source('Documentation ui.R')


#-----------------------------------------




header <- dashboardHeader(title = "Visualizing Inequality", titleWidth = 350)

#----------------------------------------------------------------------------------------

sidebar <- 

    dashboardSidebar(
      sidebarMenu(
        menuItem("Introduction", tabName = "intro"),
        menuItem("Indices", tabName = "ind", startExpanded = T,
                 menuItem("Indices of Deviants", tabName = "model1", startExpanded = T,
                          menuItem("Gini Index", tabName = "gini"),
                          menuItem("Rosenbluth Index", tabName = "rosenbluth"),
                          menuItem("Hoover Index", tabName = "hoover")
                 ),
                 menuItem("Indices of Probability", tabName = "model2",
                          menuItem("Herfindahl-Hirschmann Index", tabName = "herfindahl"),
                          menuItem("Simpson Index", tabName = "simpson")
                 ),
                 menuItem("Indices of Entropy", tabName = "model3",
                          menuItem("Shannon Index/Renyi Entropy", tabName = "shannon"),
                          menuItem("Entropy Metrics", tabName = "entropy")
                          
                 ),
                 menuItem("Indices of Social Welfare", tabName = "model4",
                          menuItem("Atkinson Index", tabName = "atkinson")
                 ),
                 menuItem("Ratios", tabName = "ratios"),
                 menuItem("At one glance", tabName = "allind")
        ),
        menuItem("Calculate", tabName = "calc"),
        menuItem("Documentation", tabName = "doc")
      )
    )

#-------------------------------------------------------------------------------------


body <-
  
  dashboardBody(
    


    # tags$head(tags$style(HTML('
                              #       /* logo */
                              #   .skin-blue .main-header .logo {
                              #   background-color: #f4b943;
                              #   }
                              # 
                              #   /* logo when hovered */
                              #   .skin-blue .main-header .logo:hover {
                              #   background-color: #f4b943;
                              #   }
                              # 
                              #   /* navbar (rest of the header) */
                              #   .skin-blue .main-header .navbar {
                              #   background-color: #000000;
                              #   }
                              #   
                              #   /* body */
                              #   .content-wrapper, .right-side {
                              #   background-color:  #FFFFFFw   
                              #   }
                              #   
                              #   
                              #   -moz-transform: scale(0.7, 0.7); /* Moz-browsers */
                              #   zoom: 0.7; /* Other non-webkit browsers */
                              #   zoom: 70%; /* Webkit browsers */
                              #   
                              #   /* main sidebar */
                              # .skin-blue .main-sidebar {
                              # background-color: #000000;
                              # font-family: "Calibri";
                              # font-size:25px;
                              # line-height:1.42857143;
                              # color: #88fba7;
                              # }
         # '))),
    
    #line thicker and black
    tags$head(
      tags$style(HTML("hr {border-top: 1px solid #000000;}"))
    ),
    
                                
                                
    #box colors of pages                           
    tags$style(".small-box.bg-yellow { background-color: #FCDB28 !important; color: #000000 !important; }"),
    tags$style(".small-box.bg-red { background-color: #FC716B !important; color: #000000 !important; }"),
    tags$style(".small-box.bg-orange { background-color: #ffd591 !important; color: #000000 !important; }"),
    tags$style(".small-box.bg-aqua { background-color: #9de0ec !important; color: #000000 !important; }"),
    
    tags$style(".small-box.bg-green { background-color: #88fba7  !important; color: #000000 !important; }"),
    tags$style(".small-box.bg-black { background-color: #000000 !important; color: #FFFFFF !important; }"),
    
    tags$style(".small-box.bg-lime { background-color: #3f7b95 !important; color: #FFFFFF !important; }"),
    
    tags$style(".small-box.bg-fuchsia { background-color: #f9bd11 !important; color: #FFFFFF !important; }"),
    tags$style(".small-box.bg-purple { background-color:  #97212f !important; color: #FFFFFF !important; }"),
    
    #f9bd11
    
    
    #slider colors
    tags$style(HTML(".js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {background: #FCDB28}")),
    tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: #FCDB28}")),
    tags$style(HTML(".js-irs-2 .irs-single, .js-irs-2 .irs-bar-edge, .js-irs-2 .irs-bar {background: #FCDB28}")),
    tags$style(HTML(".js-irs-3 .irs-single, .js-irs-3 .irs-bar-edge, .js-irs-3 .irs-bar {background: #FCDB28}")),
    tags$style(HTML(".js-irs-4 .irs-single, .js-irs-4 .irs-bar-edge, .js-irs-4 .irs-bar {background: #FCDB28}")),
    
    tags$style(HTML(".js-irs-5 .irs-single, .js-irs-5 .irs-bar-edge, .js-irs-5 .irs-bar {background: #FC716B}")),
    tags$style(HTML(".js-irs-6 .irs-single, .js-irs-6 .irs-bar-edge, .js-irs-6 .irs-bar {background: #FC716B}")),
    tags$style(HTML(".js-irs-7 .irs-single, .js-irs-7 .irs-bar-edge, .js-irs-7 .irs-bar {background: #FC716B}")),
    tags$style(HTML(".js-irs-8 .irs-single, .js-irs-8 .irs-bar-edge, .js-irs-8 .irs-bar {background: #FC716B}")),
    tags$style(HTML(".js-irs-9 .irs-single, .js-irs-9 .irs-bar-edge, .js-irs-9 .irs-bar {background: #FC716B}")),
    
    tags$style(HTML(".js-irs-10 .irs-single, .js-irs-10 .irs-bar-edge, .js-irs-10 .irs-bar {background: #ffd591}")),
    tags$style(HTML(".js-irs-11 .irs-single, .js-irs-11 .irs-bar-edge, .js-irs-11 .irs-bar {background: #ffd591}")),
    tags$style(HTML(".js-irs-12 .irs-single, .js-irs-12 .irs-bar-edge, .js-irs-12 .irs-bar {background: #ffd591}")),
    tags$style(HTML(".js-irs-13 .irs-single, .js-irs-13 .irs-bar-edge, .js-irs-13 .irs-bar {background: #ffd591}")),
    tags$style(HTML(".js-irs-14 .irs-single, .js-irs-14 .irs-bar-edge, .js-irs-14 .irs-bar {background: #ffd591}")),
    
    tags$style(HTML(".js-irs-15 .irs-single, .js-irs-15 .irs-bar-edge, .js-irs-15 .irs-bar {background: #9de0ec}")),
    tags$style(HTML(".js-irs-16 .irs-single, .js-irs-16 .irs-bar-edge, .js-irs-16 .irs-bar {background: #9de0ec")),
    tags$style(HTML(".js-irs-17 .irs-single, .js-irs-17 .irs-bar-edge, .js-irs-17 .irs-bar {background: #9de0ec}")),
    tags$style(HTML(".js-irs-18 .irs-single, .js-irs-18 .irs-bar-edge, .js-irs-18 .irs-bar {background: #9de0ec}")),
    tags$style(HTML(".js-irs-19 .irs-single, .js-irs-19 .irs-bar-edge, .js-irs-19 .irs-bar {background: #9de0ec}")),
    



    
    
    
    
    
    tabItems(
      
      # #INtroduction
      # tabItem(tabName = "intro", intropage),

     tabItem(tabName = "gini", ginipage),      
     tabItem(tabName = "hoover", hooverpage),      
     tabItem(tabName = "rosenbluth", rosenbluthpage),
     tabItem(tabName = "herfindahl", herfindahlpage),
     tabItem(tabName = "simpson", simpsonpage),
     tabItem(tabName = "shannon", shannonpage),
     tabItem(tabName = "entropy", geipage),
     tabItem(tabName = "atkinson", atkinsonpage),
     tabItem(tabName = "ratios", ratiopage),
     tabItem(tabName = "allind", allinonepage),
     tabItem(tabName = "calc", calcpage)
    )
    
  )


#------------------------------------------------------------------------------------


ui <- dashboardPage(
          header = header, 
          sidebar = sidebar, 
          body = body,
          skin = 'black'
          
          )



