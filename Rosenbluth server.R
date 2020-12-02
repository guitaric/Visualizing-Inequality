ros_slider <- reactive({ c(input$ros1, input$ros2 , input$ros3, input$ros4, input$ros5) })

output$ros_out1 <- renderPlot({ req(any(ros_slider() > 0)) 
                                ggrosenbluth1(ros_slider()) })

output$ros_out2 <- renderPlot({ req(any(ros_slider() > 0))
                                ggrosenbluth2(ros_slider()) })

output$ros_out3 <- renderPlot({ req(any(ros_slider() > 0))
                                ggrosenbluth3(ros_slider()) })

output$ros_index <- renderValueBox({ valueBox( round(rosenbluth(ros_slider()), 3), "Rosenbluth Index", color = 'orange' ) })

