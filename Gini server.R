#-------------------------------gini index

gini_slider <- reactive({ c(input$sli1, input$sli2 , input$sli3, input$sli4, input$sli5) })

output$slider_out1 <- renderPlot(gggini1(gini_slider()))
output$slider_out2 <- renderPlot(gggini2(gini_slider()))
output$slider_out3 <- renderPlot(gggini3(gini_slider()))

output$gini_index <- renderValueBox({ valueBox( round(gini(gini_slider()), 3), "Gini Index", color = 'yellow' ) })
output$corrgini_index <- renderValueBox({ valueBox( round(gini(gini_slider(), corr = T), 3), "Corrected Gini Index", color = 'yellow' ) })

