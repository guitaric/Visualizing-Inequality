hoover_slider <- reactive({ c(input$hoo1, input$hoo2 , input$hoo3, input$hoo4, input$hoo5) })

output$sliderhoover <- renderPlot(gghoover(hoover_slider()))

output$hoover_index <- renderValueBox({ valueBox( round(hoover(hoover_slider()), 3), "Hoover Index", color = 'red' ) })
output$corrhoover_index <- renderValueBox({ valueBox( round(hoover(hoover_slider(), corr = T), 3), "Corrected Hoover Index", color = 'red' ) })