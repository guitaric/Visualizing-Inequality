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
source('Allinone ui.R')
source('Calculate.R')
source('Calculate ui.R')
source('Documentation ui.R')


#-----------------------------------------
#source('Gini server.R')





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

  #--------------------------------- All indices
  source(here('Allinone server.R'), local = T)
  

  ############################   Calc Page

  #------------------------Read csv Files
  source(here('Calculate server.R'), local = T)

# final bracket
}




# observeEvent(input$file, {
#
#   if(is.null(input$file)){
#     hide(inputid = "tables-calcpage")
#   }else{
#     show(inputid = "tables-calcpage")
#   }
#
# })




# output$calc_graphs <-
#
#   renderUI({
#     if(is.null(data())) return()
#     else{
#       fluidRow(
#         tabsetPanel(
#             box(width = 4, title = "Title 1", solidHeader = T,
#                 plotOutput("plot1"))),
#             box(width = 4, title = "Title 2", solidHeader = T,
#                 plotOutput("plot2"))),
#             box(width = 4, title = "Title 3", solidHeader = T,
#                 plotOutput("plot3")))
#         ),
#         tabsetPanel(
#             #tabPanel(box(width = 4, title = "Title 1", solidHeader = T,
#                 plotOutput("plot4")#))
#         )
#       )
#     }
#   })



# 
# output$metrics_gini <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     gini(calc_vec())
#   )
# })
# 
# output$metrics_hoover <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     hoover(calc_vec())
#   )
# })
# 
# output$metrics_ros <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     rosenbluth(calc_vec())
#   )
# })
# 
# output$metrics_hhi <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     hhi(calc_vec())
#   )
# })
# 
# 
# output$metrics_palma <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     palma(calc_vec())
#   )
# })
# 
# output$metrics_quint <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     quintile(calc_vec())
#   )
# })
# 
# output$metrics_dec <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     decile(calc_vec())
#   )
# })
# 
# output$metrics_own <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     ownratio(calc_vec(), input$bottomcalc, input$topcalc)
#   )
# })
# 
# 
# 
# output$metrics_gei <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     gei(calc_vec(), input$gei_a_slider)
#   )
# })
# 
# output$metrics_atk <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     myatkinson(calc_vec(), input$atk_e_slider)
#   )
# })
# 
# 
# output$metrics_sim <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     simpson(calc_vec())
#   )
# })
# 
# output$metrics_invsim <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     invsimpson(calc_vec())
#   )
# })
# 
# output$metrics_sha <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     shannon(calc_vec())
#   )
# })
# 
# output$metrics_renyi <- renderText({
#   if(is.null(data())){return ()}
#   else(
#     renyi(calc_vec(), input$renyi_a_slider)
#   )
# })







