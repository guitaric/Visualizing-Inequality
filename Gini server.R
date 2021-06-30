#-------------------------------gini index

gini_slider <- reactive({ c(input$gini1, input$gini2 , input$gini3, input$gini4, input$gini5) })

output$slider_out1 <- renderPlot({ req(any(gini_slider() > 0)) 
                                   gggini1(gini_slider()) })

output$slider_out2 <- renderPlot({ req(any(gini_slider() > 0)) 
                                   gggini2(gini_slider()) })

output$slider_out3 <- renderPlot({ req(any(gini_slider() > 0)) 
                                   gggini3(gini_slider()) })

output$gini_index <- renderValueBox({ valueBox( round(gini(gini_slider()), 3), "Gini Index", color = 'yellow' ) })

output$corrgini_index <- renderValueBox({ valueBox( round(gini(gini_slider(), corr = T), 3), "Corrected Gini Index", color = 'yellow' ) })

