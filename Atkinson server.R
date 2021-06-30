atkdistribution <- reactiveValues(aktdistvec = c())

observeEvent(input$selectdist_atk,
                    if(substr(input$selectdist_atk, 1, 1) == "A") { atkdistribution$atkdistvec = c(1000, 50, 50, 50, 50)
             } else if(substr(input$selectdist_atk, 1, 1) == "B") { atkdistribution$atkdistvec = c(100, 50, 50, 50, 50)
             } else if(substr(input$selectdist_atk, 1, 1) == "C") { atkdistribution$atkdistvec = c(200, 200, 200, 200, 200)
             } else if(substr(input$selectdist_atk, 1, 1) == "D") { atkdistribution$atkdistvec = c(100, 200, 300, 400, 500)
             } else if(substr(input$selectdist_atk, 1, 1) == "E") { atkdistribution$atkdistvec = c(1000, 1000, 50, 50, 50, 50, 50, 50, 50, 50)
             } else if(substr(input$selectdist_atk, 1, 1) == "F") { atkdistribution$atkdistvec = c(1000, 200, 200, 200, 200)
             } else if(substr(input$selectdist_atk, 1, 1) == "G") { atkdistribution$atkdistvec = c(200, 400, 600, 800, 1000)
             } else if(substr(input$selectdist_atk, 1, 1) == "H") { atkdistribution$atkdistvec = c(1000, 0, 0, 0, 0)
             } else stop("something is wrong")
 )



output$atk_plot <- renderPlot(ggatkinson(atkdistribution$atkdistvec))

output$atk_index <- renderValueBox({ valueBox( round(myatkinson(atkdistribution$atkdistvec, input$atk1), 3), "Atkinson Index", color = 'purple' ) })

