library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(foreign)
library(here)
library(ggplot2)
library(data.table)
library(R.utils)
library(stringr)
library(schoolmath)
library(entropy)
library(openxlsx)
library(tibble)
library(Hmisc)
library(Cairo)

library(DescTools)
library(REAT)
library(vegan)
library(IC2)
options(shiny.usecairo=T)   #better looking of plots

#----------------------------------Sources
source('vectortoDT.R')
source('Intro ui.R')
source('Gini.R')
source('Gini ui.R')
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
source('Calculate.R')
source('Calculate ui.R')
source('Documentation ui.R')


#-----------------------------------------




header <- dashboardHeader(title = "Visualizing Inequality", titleWidth = 350)

#----------------------------------------------------------------------------------------

sidebar <- 

    dashboardSidebar(width = 350,
      sidebarMenu(
        menuItem("Introduction", tabName = "intro"),
        menuItem("Measures", tabName = "ind", startExpanded = F,
                 menuItem("Measures of Deviation", tabName = "model1", startExpanded = F,
                          menuItem("Gini Index", tabName = "gini"),
                          menuItem("Hoover Index", tabName = "hoover"),
                          menuItem("Rosenbluth Index", tabName = "rosenbluth")
                 ),
                 menuItem("Measures of Combinatorics", tabName = "model2",
                          menuItem("Herfindahl-Hirschman Index", tabName = "herfindahl"),
                          menuItem("Simpson Index", tabName = "simpson")
                 ),
                 menuItem("Measures of Entropy", tabName = "model3",
                          menuItem("Shannon Index", tabName = "shannon"),
                          menuItem("Generalized Entropy Index", tabName = "entropy")
                          
                 ),
                 menuItem("Measures of Social Welfare", tabName = "model4",
                          menuItem("Atkinson Index", tabName = "atkinson")
                 ),
                 menuItem("Tail Ratios", tabName = "ratios")
        ),
        menuItem("Calculate", tabName = "calc"),
        menuItem("References", tabName = "doc")
      )
    )

#-------------------------------------------------------------------------------------


body <-
  
  dashboardBody(
    
    
        # include the CSS file
        tags$head(
          tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
        ),

        includeCSS("custom.css"),

    
    tabItems(
      
     tabItem(tabName = "intro", intropage),
     
     tabItem(tabName = "gini", ginipage), 
     tabItem(tabName = "rosenbluth", rosenbluthpage),
     tabItem(tabName = "hoover", hooverpage),      
     tabItem(tabName = "herfindahl", herfindahlpage),
     tabItem(tabName = "simpson", simpsonpage),
     tabItem(tabName = "shannon", shannonpage),
     tabItem(tabName = "entropy", geipage),
     tabItem(tabName = "atkinson", atkinsonpage),
     tabItem(tabName = "ratios", ratiopage),

     tabItem(tabName = "calc", calcpage),
     tabItem(tabName = "doc", docpage)
    )
  )


#------------------------------------------------------------------------------------


ui <- dashboardPage(

          header = header, 
          sidebar = sidebar, 
          body = body,
          
          skin = 'black'
          
          )

