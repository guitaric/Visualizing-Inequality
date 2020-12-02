#-----------------Read Data

datatype <- reactive ({ 
  input$file
  isolate(input$csv_or_sav) 
})



data <- reactive({
  file1 <- input$file
  if(is.null(file1)){ return() }
  
  if(datatype() == "csv"){
      tempcsv <- read.csv(file = file1$datapath,
                          header = input$header,
                          sep = input$sep,
                          fileEncoding = "UTF-8-BOM"
      )
      return(tempcsv)

  }
  else{
      tempsav <- read.spss(file = file1$datapath)
      tempsav <- as.data.frame(tempsav)
      return(tempsav)
  }

})


#------------------------4 Table Outputs


output$tb <-
  
  renderUI({
    tabsetPanel(
      tabPanel("How To", 
        fluidPage(
          wellPanel(class = "bw",
            fluidRow(
              tags$br(),
              tags$br(),
              p(id = "tocalc", "To calculate the metrics for your own data, follow these steps:"),
              tags$ol(class = "liste",
                  tags$li("Select the file type your data is stored in (csv or sav files can be used)"),
                  tags$ul(
                      tags$li("In case your file is a csv:"),
                      tags$ul(
                          tags$li("Make sure that the distribution to be calculated is stored in a column"),
                          tags$li("Choose the correct separator of the file"),
                          tags$li("Specify, if the file has a header or not")
                      ),
                      tags$li("Check in the Tab 'Data' if the data is correctly read and formatted")
                  ),
                  tags$li("Select the correct column (Make sure that the column has numeric values!)",
                          tags$ul(
                            tags$li("Remove negative values if found")
                          )
                  ),
                  tags$li("Select the plots to be displayed"),
                  tags$li("Choose the number of digits the metrics shall be rounded"),
                  tags$li("If needed, print the currently displayed plot as a .png file and download the table 
                           containing all metrics for the currently selected distribution, by clicking the two Download Buttons")
                )
              )
            )
          )
      ),
      tabPanel("Data", wellPanel(class = "bw", tableOutput("table") ) ),
      tabPanel("Summary", wellPanel(class = "bw", tableOutput("sum") ) ),
      tabPanel("Table of Distribution", wellPanel(class = "bw", tableOutput("t_dist") ) ),
      tabPanel("Metrics", wellPanel(class = "bw", tableOutput("indices") ) )
    )
  })

#----------------------------------------------
#vector to work with


vec_nona <- reactive({ na.omit(data()[,input$col_choice]) })

vec_noneg <- reactive({ 
                  if(is.numeric(vec_nona()) && input$noneg) vec_nona()[vec_nona() >= 0]
                  else vec_nona()
             })

calc_vec <- reactive({ 
                  if(is.numeric(vec_noneg())){
                    shrinker_to_20(vec_noneg())
                  }
             })


#---------------------------------------------
#Table Outputs

output$table <- renderTable({
  req(input$file)
  as.data.table(data())
})

output$sum <- renderTable({
  req(input$file)
  summary(data())
})

output$t_dist <- renderTable({
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  finalDT_inc_calc(vec_noneg())
})


output$indices <- renderTable({

  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  indextable(vec_noneg())
}, digits = 3)





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
observeEvent(input$sep,
             updateSelectInput(session, "col_choice", choices = names(data()))
)


# ------------------------------------all plots that are used for the Calc Page
output$calccumulup <- renderPlot({
  
  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  gggini1calc(calc_vec())
})


output$calccumuldown <- renderPlot({
 
   shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  ggrosenbluth1calc(calc_vec())
})


output$calcgini <- renderPlot({
 
   shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  gggini3calc(calc_vec())
})


output$calchoover <- renderPlot({

  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  gghoovercalc(calc_vec())
})


output$calcrosenbluth <- renderPlot({

  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  ggrosenbluth3calc(calc_vec())
})


output$calchhi <- renderPlot({

  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  gghhicalc(calc_vec())
})


output$calcgei <- renderPlot({

  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  gggeicalc(calc_vec())
})


output$calcatk <- renderPlot({

  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  ggatkinsoncalc(calc_vec())
})


#connection to actionbutton
output$calcratio <- renderPlot({

  shiny::validate(
    need(  input$file, "Upload a file"),
    need(  all.is.numeric(calc_vec()) , "Change to a numeric column"),
    need(  all(calc_vec() >= 0), "Negative values found")
  )
  #input$actioncalc
  ggratiocalc(calc_vec())
})




output$calc_graphs <-
  
  renderUI({
     if(input$chooseplot == "Cumulated Plot (Ascending)"){
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
    }else if(input$chooseplot == "Generalized Entropy Index"){
      plotOutput("calcgei")
    }else if(input$chooseplot == "Atkinson Index"){
      plotOutput("calcatk")
    }else{
      plotOutput("calcratio")
    }
    
  })


#-------------------------------- DownloadButtons Plot and Metrics Table

output$downplot <- downloadHandler(
        filename = function(){
          paste("current plot", ".png", sep = ".")
        },
        
        content = function(file) {
          ggsave(file)
        }
)

output$downtable <- downloadHandler(
  filename = function(){
    paste("yourmetrics", "csv", sep = ".")
  },

  content = function(file) {
    write.csv(indextable(data()[,input$col_choice], 4), row.names = F, quote = F, file)

  }
)

#--------------------------------------------------------Metrics

#---------------------- value Boxes Calculate

output$showgini <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(gini(calc_vec()), input$rdigit), 
            "Gini Index", color = 'yellow' ) })

output$showcorrgini <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(gini(calc_vec(), corr = T), input$rdigit), 
            "Corrected Gini Index", color = 'yellow' ) })

output$showhoover <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(hoover(calc_vec()), input$rdigit), 
            "Hoover Index", color = 'red' ) })

output$showcorrhoover <- renderValueBox({
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(hoover(calc_vec(), corr = T), input$rdigit), 
            "Corrected Hoover Index", color = 'red' ) })

output$showrosen <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(rosenbluth(calc_vec()), input$rdigit), 
            "Rosenbluth Index", color = 'orange' ) })

#----------------

output$showhhi <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(hhi(calc_vec()), input$rdigit), 
            "Herfindahl-Hirschmann Index", color = 'aqua' ) })


output$showsim <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(simpson(calc_vec()), input$rdigit), 
            "Simpson Index", color = 'green' ) })

output$showginisim <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(simpson(calc_vec(), "ginisim"), input$rdigit), 
            "Gini-Simpson Index", color = 'green' ) })

output$showinvsim <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(simpson(calc_vec(), "invsim"), input$rdigit), 
            "Inverse Simpson Index", color = 'green' ) })

#----------------

output$showshalog2 <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(shannon(calc_vec(), "log2"), input$rdigit), 
            "Shannon Index (log2)", color = 'black') })

output$showshaln <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(shannon(calc_vec(), "ln"), input$rdigit), 
            "Shannon Index (ln)", color = 'black') })

output$showshalog10 <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(shannon(calc_vec(), "log10"), input$rdigit), 
            "Shannon Index (log10)", color = 'black') })

output$showge <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(gei(calc_vec(), as.numeric(input$geinum)), input$rdigit), 
            "Generalized Entropy Index", color = 'fuchsia' ) })


#----------------

output$showatk <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(myatkinson(calc_vec(), as.numeric(input$atknum)), input$rdigit), 
            "Atkinson Index", color = 'purple' ) })

output$showpalma <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(palma(calc_vec()), input$rdigit), 
            "Palma Ratio", color = 'lime' ) })

output$showquint <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(quintile(calc_vec()), input$rdigit), 
            "S80-S20 Ratio", color = 'lime' ) })

output$showdec <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(p90p10(calc_vec()), input$rdigit), 
            "P90-P10 Ratio", color = 'lime' ) })

output$showten <- renderValueBox({ 
  req(input$file)
  req(all(calc_vec() >= 0))
  req(all.is.numeric(calc_vec()) == T)
  valueBox( round(p50p10(calc_vec()), input$rdigit), 
            "P50-P10 Ratio", color = 'lime' ) })
