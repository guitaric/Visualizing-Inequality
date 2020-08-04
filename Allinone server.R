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
