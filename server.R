library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shinyWidgets)
library(shinyjs)
library(here)
library(foreign)

library(ggplot2)
library(plotly)
library(data.table)
library(R.utils)
library(stringr)
library(schoolmath)
library(openxlsx)
library(tibble)
library(Cairo)
library(Hmisc)
options(shiny.usecairo=T)   #better looking of plots

#----------------------------------Sources
source('vectortoDT.R')
# 
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
source('Simpson.R')
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

server <- 
  
  function(input, output, session){
 
    
    
 ############################################################ Index Page
 
  #-------------------------------gini index
  source(here('Gini server.R'), local = T)
  
  #-----------------------------hoover index
  source(here('Hoover server.R'), local = T)
    
  #-------------------------------rosenbluth index
  source(here('Rosenbluth server.R'), local = T)

  #-------------------------------herfindahl Index
  source(here('Hhi server.R'), local = T)
  
  #--------------------------------------- Ratio Page
  source(here('Ratios server.R'), local = T)
  
  #----------------------------------- GEI Page
  source(here('GEI server.R'), local = T)
  
  #------------------------------- Simpson Index
  source(here('Simpson server.R'), local = T)

  #--------------------------------- Shannon Index
  source(here('Shannon server.R'), local = T)

  # -------------------Atkinson Index
  source(here('Atkinson server.R'), local = T)

    
  ############################   Calc Page

  #------------------------Read csv Files
  source(here('Calculate server.R'), local = T)

# final bracket
}







