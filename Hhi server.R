herfindahl_slider <- reactive({ c(input$hhi1, input$hhi2 , input$hhi3, input$hhi4, input$hhi5) })

output$herfindahl_out1 <- renderPlot(ggherfindahl(herfindahl_slider()))

output$hhi_index <- renderValueBox({ valueBox( hhi(herfindahl_slider()), "Herfindahl_Hirschmann Index", color = 'aqua' ) })


