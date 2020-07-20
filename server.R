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
library(tibble)
library(Cairo)
options(shiny.usecairo=T)   #better looking of plots

#----------------------------------Sources
# source('overviewcalc.R')
source('vectortoDT.R')
# source('indextable.R')
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
    
    gini_slider <- reactive({ c(input$sli1, input$sli2 , input$sli3, input$sli4, input$sli5) })
    
    output$slider_out1 <- renderPlot(gggini1(gini_slider()))
    output$slider_out2 <- renderPlot(gggini2(gini_slider()))
    output$slider_out3 <- renderPlot(gggini3(gini_slider()))
    
    output$gini_index <- renderValueBox({ valueBox( round(gini(gini_slider()), 3), "Gini Index", color = 'yellow' ) })
    output$corrgini_index <- renderValueBox({ valueBox( round(gini(gini_slider(), corr = T), 3), "Corrected Gini Index", color = 'yellow' ) })
    
    
  #-------------------------------hoover index

  hoover_slider <- reactive({ c(input$hoo1, input$hoo2 , input$hoo3, input$hoo4, input$hoo5) })

  output$sliderhoover <- renderPlot(gghoover(hoover_slider()))

  output$hoover_index <- renderValueBox({ valueBox( round(hoover(hoover_slider()), 3), "Hoover Index", color = 'red' ) })
  output$corrhoover_index <- renderValueBox({ valueBox( round(hoover(hoover_slider(), corr = T), 3), "Corrected Hoover Index", color = 'red' ) })


  #-------------------------------rosenbluth index

  rosen_slider <- reactive({ c(input$ros1, input$ros2 , input$ros3, input$ros4, input$ros5) })

  output$ros_out1 <- renderPlot(ggrosenbluth1(rosen_slider()))
  output$ros_out2 <- renderPlot(ggrosenbluth2(rosen_slider()))
  output$ros_out3 <- renderPlot(ggrosenbluth3(rosen_slider()))

  output$rosen_index <- renderValueBox({ valueBox( rosenbluth(rosen_slider()), "Rosenbluth Index", color = 'orange' ) })


  #-------------------------------herfindahl Index

  herfindahl_slider <- reactive({ c(input$hhi1, input$hhi2 , input$hhi3, input$hhi4, input$hhi5) })

  output$herfindahl_out1 <- renderPlot(ggherfindahl(herfindahl_slider()))

  output$hhi_index <- renderValueBox({ valueBox( hhi(herfindahl_slider()), "Herfindahl_Hirschmann Index", color = 'aqua' ) })



  ######################################################## Ratio Page

  observeEvent(input$top,
               if((input$top + input$bottom) > 100){
                 updateNumericInput(session, "bottom", value = 100 - input$top)
               }
  )

  observeEvent(input$bottom,
               if((input$bottom + input$top) > 100){
                 updateNumericInput(session, "top", value = 100 - input$bottom)
               }
  )



  output$outputratio <- renderText({ ownratio(onlyones, input$top, input$bottom) })


  output$ratio_out1 <- renderPlot({
    input$action
    isolate(ggratio(onlyones, input$bottom, input$top))
  })




  ###################################################### Entropy Page

  entdistribution <- reactiveValues(entdistvec = c())

  observeEvent(input$selectdist_ent,
               if(substr(input$selectdist_ent, 1, 1) == "A") { entdistribution$entdistvec = c(1000, 0, 0, 0, 0)
               } else if(substr(input$selectdist_ent, 1, 1) == "B") { entdistribution$entdistvec = c(360, 300, 200, 80, 60)
               } else if(substr(input$selectdist_ent, 1, 1) == "C") { entdistribution$entdistvec = c(200, 200, 200, 200, 200)
               } else if(substr(input$selectdist_ent, 1, 1) == "D") { entdistribution$entdistvec = c(500, 140, 130, 120, 110)
               } else if(substr(input$selectdist_ent, 1, 1) == "E") { entdistribution$entdistvec = c(1000, 280, 260, 240, 220)
               } else if(substr(input$selectdist_ent, 1, 1) == "F") { entdistribution$entdistvec = c(180, 180, 150, 150, 100, 100, 40, 40, 30, 30)
               } else if(substr(input$selectdist_ent, 1, 1) == "G") { entdistribution$entdistvec = c(100, 100, 100, 100, 100, 100, 100, 100, 100, 100)
               } else if(substr(input$selectdist_ent, 1, 1) == "H") { entdistribution$dentistvec = c(199, 199, 199, 199, 199, 1, 1, 1, 1, 1)
               } else stop("something is wrong")
  )

  output$ge_plot <- renderPlot(gggenent(entdistribution$entdistvec))

  output$atk_plot <- renderPlot(ggatkinson(entdistribution$entdistvec))



  #------------------------------- Simpson Index
  simpson_vec <- reactive({ c(input$sim_nr1, input$sim_nr2 , input$sim_nr3, input$sim_nr4, input$sim_nr5) })


  output$simpsonout <- renderPlot( ggsimpson(simpson_vec()) )

  output$sim_index <- renderValueBox({ valueBox( round(simpson(simpson_vec()), 3), "Simpson Index", color = 'green' ) })
  output$ginisim_index <- renderValueBox({ valueBox( round(simpson(simpson_vec(), "ginisim"), 3), "Gini-Simpson Index", color = 'green' ) })
  output$invsim_index <- renderValueBox({ valueBox( round(simpson(simpson_vec(), "invsim"), 3), "Inverted Simpson Index", color = 'green' ) })
  

  #--------------------------------- Shannon Index

  counter <- reactiveValues(countervalue = "A B A")
  # counter <- reactiveValues(count = 0 )

  #create Letters
  observeEvent(input$abutton, { counter$countervalue <- paste(counter$countervalue, " A") })
  observeEvent(input$bbutton, { counter$countervalue <- paste(counter$countervalue, " B") })
  observeEvent(input$cbutton, { counter$countervalue <- paste(counter$countervalue, " C") })
  observeEvent(input$dbutton, { counter$countervalue <- paste(counter$countervalue, " D") })
  observeEvent(input$ebutton, { counter$countervalue <- paste(counter$countervalue, " E") })
  observeEvent(input$fbutton, { counter$countervalue <- paste(counter$countervalue, " F") })


  # observeEvent(input$abutton, { counter$count <- counter$count + 1 })
  # observeEvent(input$bbutton, { counter$count <- counter$count + 1 })
  # observeEvent(input$cbutton, { counter$count <- counter$count + 1 })
  # observeEvent(input$dbutton, { counter$count <- counter$count + 1 })

  # clear text
  observeEvent(input$clearbutton, { counter$countervalue = ""
                                    counter$count = 0})

  observeEvent(input$returnbutton, { counter$countervalue = str_sub(counter$countervalue, 1, str_count(counter$countervalue) -1)
  counter$count = counter$count -1})



  shannonvec <- reactive({
    shavec <- as.vector(counter$countervalue)

    as <- str_count(shavec, "A")
    bs <- str_count(shavec, "B")
    cs <- str_count(shavec, "C")
    ds <- str_count(shavec, "D")
    es <- str_count(shavec, "E")
    fs <- str_count(shavec, "F")


    back <- c(as, bs, cs, ds, es, fs)

    return(back[back != 0])
  })


  loga <- reactive({ as.character(input$logtype) })

  #typed in string
  output$shannontext <- renderText({ counter$countervalue })

  #table values Shannon
  output$shannontable <- renderTable({
    if(shannonvec() == '') return()
    else shannondat(shannonvec(), loga()) })


  #display index
  # output$sha_index <- renderValueBox({
  #   if(shannonvec() == 0) return( valueBox( 0, "Shannon Index", color = 'yellow' ) )
  #   else return ( valueBox( shannon(shannonvec(), loga()), "Shannon Index", color = 'black' ) )
  # })
  
  output$sha_indexlog2 <- renderValueBox({ valueBox( round(shannon(shannonvec(), "log2"), 3), "Shannon Index (log2)", color = 'black') })
  output$sha_indexln <- renderValueBox({ valueBox( round(shannon(shannonvec(), "ln"), 3), "Shannon Index (ln)", color = 'black') })
  output$sha_indexlog10 <- renderValueBox({ valueBox( round(shannon(shannonvec(), "log10"), 3), "Shannon Index (log10)", color = 'black') })



  # -------------------Atkinson Index

  atkdistribution <- reactiveValues(aktdistvec = c())

  observeEvent(input$selectdist_atk,
               if(substr(input$selectdist_atk, 1, 1) == "A") { atkdistribution$atkdistvec = c(1000, 0, 0, 0, 0)
               } else if(substr(input$selectdist_atk, 1, 1) == "B") { atkdistribution$atkdistvec = c(360, 300, 200, 80, 60)
               } else if(substr(input$selectdist_atk, 1, 1) == "C") { atkdistribution$atkdistvec = c(200, 200, 200, 200, 200)
               } else if(substr(input$selectdist_atk, 1, 1) == "D") { atkdistribution$atkdistvec = c(500, 140, 130, 120, 110)
               } else if(substr(input$selectdist_atk, 1, 1) == "E") { atkdistribution$atkdistvec = c(1000, 280, 260, 240, 220)
               } else if(substr(input$selectdist_atk, 1, 1) == "F") { atkdistribution$atkdistvec = c(180, 180, 150, 150, 100, 100, 40, 40, 30, 30)
               } else if(substr(input$selectdist_atk, 1, 1) == "G") { atkdistribution$atkdistvec = c(100, 100, 100, 100, 100, 100, 100, 100, 100, 100)
               } else if(substr(input$selectdist_atk, 1, 1) == "H") { atkdistribution$atktistvec = c(199, 199, 199, 199, 199, 1, 1, 1, 1, 1)
               } else stop("something is wrong")
  )


  output$atk_plot <- renderPlot(ggatkinson(atkdistribution$atkdistvec))



  #--------------------------------- All indices

  distribution <- reactiveValues(distvec = c())

  observeEvent(input$selectdist,
               if(substr(input$selectdist, 1, 1) == "A") { distribution$distvec = c(1000, 0, 0, 0, 0)
               } else if(substr(input$selectdist, 1, 1) == "B") { distribution$distvec = c(360, 300, 200, 80, 60)
               } else if(substr(input$selectdist, 1, 1) == "C") { distribution$distvec = c(200, 200, 200, 200, 200)
               } else if(substr(input$selectdist, 1, 1) == "D") { distribution$distvec = c(500, 140, 130, 120, 110)
               } else if(substr(input$selectdist, 1, 1) == "E") { distribution$distvec = c(1000, 280, 260, 240, 220)
               } else if(substr(input$selectdist, 1, 1) == "F") { distribution$distvec = c(180, 180, 150, 150, 100, 100, 40, 40, 30, 30)
               } else if(substr(input$selectdist, 1, 1) == "G") { distribution$distvec = c(100, 100, 100, 100, 100, 100, 100, 100, 100, 100)
               } else if(substr(input$selectdist, 1, 1) == "H") { distribution$distvec = c(199, 199, 199, 199, 199, 1, 1, 1, 1, 1)
               } else stop("something is wrong")

  )

  output$gini_box <- renderValueBox({ valueBox( round(gini(distribution$distvec), 3), "Gini Index", color = 'yellow' ) })
  output$corrgini_box <- renderValueBox({ valueBox( round(gini(distribution$distvec, corr = T), 3), "Corrected Gini Index", color = 'yellow' ) })
  output$rosen_box <- renderValueBox({ valueBox( round(rosenbluth(distribution$distvec), 3), "Rosenbluth Index", color = 'orange' ) })
  output$hoover_box <- renderValueBox({ valueBox( round(hoover(distribution$distvec), 3), "Hoover Index", color = 'red' ) })
  output$corrhoover_box <- renderValueBox({ valueBox( round(hoover(distribution$distvec, corr = T), 3), "Hoover Index", color = 'red' ) })
  output$hhi_box <- renderValueBox({ valueBox( round(hhi(distribution$distvec), 3), "Herfindahl Index", color = 'aqua' ) })


  output$allind_gini <- renderPlot(gggini3(distribution$distvec))
  output$allind_rosen <- renderPlot(ggrosenbluth3(distribution$distvec))
  output$allind_hoover <- renderPlot(gghoover(distribution$distvec))
  output$allind_hhi <- renderPlot(ggherfindahl(distribution$distvec))




  #########################################################################
  #########################################################################
  #########################################################################

  ############################   Calc Page

  #------------------------Read csv Files
  data <- reactive({
    file1 <- input$file
    if(is.null(file1)){
      return("Here i am ")
    }

    tempcsv <- read.csv(file = file1$datapath,
                        header = input$header,
                        sep = input$sep,
        )
    #Transpose for Rows
    if(input$col_or_row == F){
            n <- tempcsv[,1]
            transposedcsv <- as.data.frame(t(tempcsv[,-1]))
            colnames(transposedcsv) <- n
            return(transposedcsv)
    }else return(tempcsv)

  })
  #XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx


  #------------------------4 Table Outputs
  output$table <- renderTable({
    if(is.null(data())){return ()}
    else data()
  })

  output$sum <- renderTable({
    if(is.null(data())){return ()}
    else summary(data())
  })

  output$t_dist <- renderTable({
    if(is.null(data())){return ()}
    else finalDT_inc(data()[,input$col_choice])
  })


  output$indices <- renderTable({
    if(is.null(data())){return ()}
    else newtable(data()[,input$col_choice])
  })

  output$tb <-

    renderUI({
      if(is.null(data())) return()
      else
        tabsetPanel(tabPanel("Data", tableOutput("table")),
                    tabPanel("Summary", tableOutput("sum")),
                    tabPanel("Table of Distribution", tableOutput("t_dist")),
                    tabPanel("Indices", tableOutput("indices"))
        )
    })



  #-----------------------------Refresh whenever changes are made
  observeEvent(input$file,
               updateSelectInput(session, "col_choice", choices = names(data()))
  )
  observeEvent(input$header,
               updateSelectInput(session, "col_choice", choices = names(data()))
  )
  observeEvent(input$stringFac,
               updateSelectInput(session, "col_choice", choices = names(data()))
  )
  observeEvent(input$col_or_row,
               updateSelectInput(session, "col_choice", choices = names(data()))
  )


  #---------------------------interdependent top and bottom input values for own ratio
  observeEvent(input$topcalc,
               if((input$topcalc + input$bottomcalc) > 100){
                 updateNumericInput(session, "bottomcalc", value = 100 - input$topcalc)
               }
  )

  observeEvent(input$bottomcalc,
               if((input$bottomcalc + input$topcalc) > 100){
                 updateNumericInput(session, "topcalc", value = 100 - input$bottomcalc)
               }
  )




  #----------------------------------------------

  #vector to work with
  calc_vec <- reactive({ shrinker_to_20(data()[,input$col_choice]) })

  output$texttext <- renderText({ calc_vec() })



  # ------------------------------------all plots that are used for the Calc Page
  output$calccumulup <- renderPlot({
        req(input$file)
        gggini1calc(calc_vec())
  })

  output$calccumuldown <- renderPlot({
      req(input$file)
      ggrosenbluth1calc(calc_vec())
  })

  output$calcgini <- renderPlot({
      req(input$file)
      gggini3calc(calc_vec())
  })

  output$calchoover <- renderPlot({
      req(input$file)
      gghoovercalc(calc_vec())
  })

  output$calcrosenbluth <- renderPlot({
      req(input$file)
      ggrosenbluth3calc(calc_vec())
  })

  output$calchhi <- renderPlot({
      req(input$file)
      ggherfindahlcalc(calc_vec())
  })

  #connection to actionbutton
  output$calcratio <- renderPlot({
    req(input$file)
    input$actioncalc
    isolate(ggratiocalc(calc_vec(), input$bottomcalc, input$topcalc))
  })




  output$calc_graphs <-

    renderUI({
      if(is.null(data())){
          return()
      }else if(input$chooseplot == "Cumulated Plot (Ascending)"){
          plotOutput("calccumulup")
      }else if(input$chooseplot == "Cumulated Plot (Descending)"){
          plotOutput("calccumuldown")
      }else if(input$chooseplot == "Gini Index"){
          plotOutput("calcgini")
      }else if(input$chooseplot == "Hoover Index"){
        plotOutput("calchoover")
      }else if(input$chooseplot == "Rosenbluth Index"){
          plotOutput("calcrosenbluth")
      }else if(input$chooseplot == "Herfindahl-Hirschmann Index"){
          plotOutput("calchhi")
      }else{
          plotOutput("calcratio")
      }

    })




#--------------------------------------------------------Metrics


  #---------------------- value Boxes Calculate
  
  output$showgini <- renderValueBox({ 
                        req(input$file) 
                        valueBox( round(gini(calc_vec()), 3), "Gini Index", color = 'yellow' ) })
  
  output$showcorrgini <- renderValueBox({ 
                            req(input$file) 
                            valueBox( round(gini(calc_vec(), corr = T), 3), "Corrected Gini Index", color = 'yellow' ) })
  
  output$showhoover <- renderValueBox({ 
                        req(input$file) 
                        valueBox( round(hoover(calc_vec()), 3), "Hoover Index", color = 'red' ) })
  
  output$showcorrhoover <- renderValueBox({ 
                              req(input$file) 
                              valueBox( round(hoover(calc_vec(), corr = T), 3), "Corrected Hoover Index", color = 'red' ) })
  
  output$showrosen <- renderValueBox({ 
    req(input$file) 
    valueBox( round(rosenbluth(calc_vec()), 3), "Rosenbluth Index", color = 'orange' ) })
  
  output$showhhi <- renderValueBox({ 
    req(input$file)
    valueBox( round(hhi(calc_vec()), 3), "Herfindahl_Hirschmann Index", color = 'aqua' ) })
  
  output$showsim <- renderValueBox({ 
    req(input$file)
    valueBox( round(hhi(calc_vec()), 3), "Simpson Index", color = 'aqua' ) })
  
  output$showginisim <- renderValueBox({ 
    req(input$file)
    valueBox( round(hhi(calc_vec()), 3), "Herfindahl Hirschmann Index", color = 'aqua' ) })
  
  output$showinvsim <- renderValueBox({ 
    req(input$file)
    valueBox( round(hhi(calc_vec()), 3), "Herfindahl Hirschmann Index", color = 'aqua' ) })
  
  output$showsim <- renderValueBox({ 
    req(input$file)
    valueBox( round(simpson(calc_vec()), 3), "Simpson Index", color = 'green' ) })
  
  output$showginisim <- renderValueBox({ 
    req(input$file)
    valueBox( round(simpson(calc_vec(), "ginisim"), 3), "Gini-Simpson Index", color = 'green' ) })
  
  output$showinvsim <- renderValueBox({ 
    req(input$file)
    valueBox( round(simpson(calc_vec(), "invsim"), 3), "Inverted Simpson Index", color = 'green' ) })
  
  output$showshalog2 <- renderValueBox({ 
    req(input$file)
    valueBox( round(shannon(calc_vec(), "log2"), 3), "Shannon Index (log2)", color = 'black') })
  
  output$showshaln <- renderValueBox({ 
    req(input$file)
    valueBox( round(shannon(calc_vec(), "ln"), 3), "Shannon Index (ln)", color = 'black') })
  
  output$showshalog10 <- renderValueBox({ 
    req(input$file)
    valueBox( round(shannon(calc_vec(), "log10"), 3), "Shannon Index (log10)", color = 'black') })
  
  output$showge <- renderValueBox({ 
    req(input$file)
    valueBox( round(gei(calc_vec()), 3), "Generalized Entropy Index", color = 'fuchsia' ) })
  
  output$showatk <- renderValueBox({ 
    req(input$file)
    valueBox( round(myatkinson(calc_vec()), 3), "Atkinson Index", color = 'purple' ) })
  
  output$showpalma <- renderValueBox({ 
    req(input$file)
    valueBox( round(palma(calc_vec()), 3), "Palma Ratio", color = 'lime' ) })
  
  output$showquint <- renderValueBox({ 
    req(input$file)
    valueBox( round(quintile(calc_vec()), 3), "Quintile Ratio", color = 'lime' ) })
  
  output$showdec <- renderValueBox({ 
    req(input$file)
    valueBox( round(decile(calc_vec()), 3), "Decile Ratio", color = 'lime' ) })
  

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







