entdistribution <- reactiveValues(entdistvec = c())

observeEvent(input$selectdist_ent,
             if(substr(input$selectdist_ent, 1, 1) == "A") { 
               entdistribution$entdistvec = c(110, 120, 130, 140, 150, 500)
             } else if(substr(input$selectdist_ent, 1, 1) == "B") { 
               entdistribution$entdistvec = c(100, 210, 220, 230, 240, 250)
             } else if(substr(input$selectdist_ent, 1, 1) == "C") { 
               entdistribution$entdistvec = c(200, 200, 200, 200, 200, 200, 200)
             } else if(substr(input$selectdist_ent, 1, 1) == "D") { 
               entdistribution$entdistvec = c(110, 110, 120, 120, 130, 130, 140, 140, 150, 150, 500, 500)
             } else if(substr(input$selectdist_ent, 1, 1) == "E") { 
               entdistribution$entdistvec = c(100, 100, 210, 210, 220, 220, 230, 230, 240, 240, 250, 250)
             } else if(substr(input$selectdist_ent, 1, 1) == "F") { 
               entdistribution$entdistvec = c(100, 1100, 1200, 1300, 1400, 1500)
             } else if(substr(input$selectdist_ent, 1, 1) == "G") { 
               entdistribution$entdistvec = c(220, 240, 260, 280, 1000)
             } else if(substr(input$selectdist_ent, 1, 1) == "H") { 
               entdistribution$entdistvec = c(200, 420, 440, 460, 480, 500)
             } else stop("something is wrong")
)

output$gei_plot <- 
  renderPlot(gggei(entdistribution$entdistvec))

output$gei_index <- 
  renderValueBox({ valueBox( round(gei(entdistribution$entdistvec, input$gei1), 3), 
                   "Generalized Entropy Index", color = 'fuchsia' ) })

