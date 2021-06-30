hhi_slider <- reactive({ c(input$hhi1, input$hhi2 , input$hhi3, input$hhi4, input$hhi5) })

output$herfindahl_out1 <- renderPlot({ req(any(hhi_slider() > 0))
                                       gghhi(hhi_slider()) })

output$hhi_index <- renderValueBox({ valueBox( round(hhi(hhi_slider()),3), "Herfindahl-Hirschman Index", color = 'aqua' ) })


