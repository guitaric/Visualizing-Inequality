data <- reactive({
  file1 <- input$file
  if(is.null(file1)){
    return("This is a help Text how to upload your file")
  }
  if(input$csv_or_sav == "csv"){
      tempcsv <- read.csv(file = file1$datapath,
                          header = input$header,
                          sep = input$sep,
      )
      return(tempcsv)
      # #Transpose for Rows
      # if(input$col_or_row == F){
      #   n <- tempcsv[,1]
      #   transposedcsv <- as.data.frame(t(tempcsv[,-1]))
      #   colnames(transposedcsv) <- n
      #   return(transposedcsv)
      # }else return(tempcsv)
  }
  else{
      tempsav <- read.spss(file = file1$datapath)
      tempsav <- as.data.frame(tempsav)
      return(tempsav)
  }

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
  else finalDT_inc_calc(data()[,input$col_choice])
})


output$indices <- renderTable({
  if(is.null(data())){return ()}
  else indextable(data()[,input$col_choice], 4)
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



#-----------------------------Refresh whenever changes are made in Input Settings
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
  valueBox( round(gini(calc_vec()), input$rdigit), "Gini Index", color = 'yellow' ) })

output$showcorrgini <- renderValueBox({ 
  req(input$file) 
  valueBox( round(gini(calc_vec(), corr = T), input$rdigit), "Corrected Gini Index", color = 'yellow' ) })

output$showhoover <- renderValueBox({ 
  req(input$file) 
  valueBox( round(hoover(calc_vec()), input$rdigit), "Hoover Index", color = 'orange' ) })

output$showcorrhoover <- renderValueBox({ 
  req(input$file) 
  valueBox( round(hoover(calc_vec(), corr = T), input$rdigit), "Corrected Hoover Index", color = 'orange' ) })

output$showrosen <- renderValueBox({ 
  req(input$file) 
  valueBox( round(rosenbluth(calc_vec()), input$rdigit), "Rosenbluth Index", color = 'red' ) })

output$showhhi <- renderValueBox({ 
  req(input$file)
  valueBox( round(hhi(calc_vec()), input$rdigit), "Herfindahl_Hirschmann Index", color = 'aqua' ) })

output$showsim <- renderValueBox({ 
  req(input$file)
  valueBox( round(hhi(calc_vec()), input$rdigit), "Simpson Index", color = 'aqua' ) })

output$showginisim <- renderValueBox({ 
  req(input$file)
  valueBox( round(hhi(calc_vec()), input$rdigit), "Herfindahl Hirschmann Index", color = 'aqua' ) })

output$showinvsim <- renderValueBox({ 
  req(input$file)
  valueBox( round(hhi(calc_vec()), input$rdigit), "Herfindahl Hirschmann Index", color = 'aqua' ) })

output$showsim <- renderValueBox({ 
  req(input$file)
  valueBox( round(simpson(calc_vec()), input$rdigit), "Simpson Index", color = 'green' ) })

output$showginisim <- renderValueBox({ 
  req(input$file)
  valueBox( round(simpson(calc_vec(), "ginisim"), input$rdigit), "Gini-Simpson Index", color = 'green' ) })

output$showinvsim <- renderValueBox({ 
  req(input$file)
  valueBox( round(simpson(calc_vec(), "invsim"), input$rdigit), "Inverted Simpson Index", color = 'green' ) })

output$showshalog2 <- renderValueBox({ 
  req(input$file)
  valueBox( round(shannon(calc_vec(), "log2"), input$rdigit), "Shannon Index (log2)", color = 'black') })

output$showshaln <- renderValueBox({ 
  req(input$file)
  valueBox( round(shannon(calc_vec(), "ln"), input$rdigit), "Shannon Index (ln)", color = 'black') })

output$showshalog10 <- renderValueBox({ 
  req(input$file)
  valueBox( round(shannon(calc_vec(), "log10"), input$rdigit), "Shannon Index (log10)", color = 'black') })

output$showge <- renderValueBox({ 
  req(input$file)
  valueBox( round(gei(calc_vec()), input$rdigit), "Generalized Entropy Index", color = 'fuchsia' ) })

output$showatk <- renderValueBox({ 
  req(input$file)
  valueBox( round(myatkinson(calc_vec()), input$rdigit), "Atkinson Index", color = 'purple' ) })

output$showpalma <- renderValueBox({ 
  req(input$file)
  valueBox( round(palma(calc_vec()), input$rdigit), "Palma Ratio", color = 'lime' ) })

output$showquint <- renderValueBox({ 
  req(input$file)
  valueBox( round(quintile(calc_vec()), input$rdigit), "Quintile Ratio", color = 'lime' ) })

output$showdec <- renderValueBox({ 
  req(input$file)
  valueBox( round(decile(calc_vec()), input$rdigit), "Decile Ratio", color = 'lime' ) })
