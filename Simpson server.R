simpson_vec <- 
  reactive({   vector <- c(input$sim_nr1, input$sim_nr2 , input$sim_nr3, input$sim_nr4, input$sim_nr5)
               req(all.is.numeric(vector)) 
               req(all(vector <= 100))
               c(input$sim_nr1, input$sim_nr2 , input$sim_nr3, input$sim_nr4, input$sim_nr5)
    })


output$simpsonout <- renderPlot( ggsimpson(simpson_vec()) )

output$sim_index <- 
  renderValueBox({ valueBox( round(simpson(simpson_vec()), 3), 
                   "Simpson Index", color = 'green' ) })

output$ginisim_index <- 
  renderValueBox({ valueBox( round(simpson(simpson_vec(), "ginisim"), 3), 
                   "Gini-Simpson Index", color = 'green' ) })

output$invsim_index <- renderValueBox({ valueBox( round(simpson(simpson_vec(), "invsim"), 3), 
                   "Inverse Simpson Index", color = 'green' ) })
