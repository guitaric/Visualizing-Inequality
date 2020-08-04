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

