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

