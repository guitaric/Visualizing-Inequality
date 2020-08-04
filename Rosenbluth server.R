rosen_slider <- reactive({ c(input$ros1, input$ros2 , input$ros3, input$ros4, input$ros5) })

output$ros_out1 <- renderPlot(ggrosenbluth1(rosen_slider()))
output$ros_out2 <- renderPlot(ggrosenbluth2(rosen_slider()))
output$ros_out3 <- renderPlot(ggrosenbluth3(rosen_slider()))

output$rosen_index <- renderValueBox({ valueBox( rosenbluth(rosen_slider()), "Rosenbluth Index", color = 'orange' ) })