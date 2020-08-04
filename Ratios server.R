observeEvent(input$top,
             if((input$top + input$bottom) > 100){
               updateNumericInput(session, "bottom", value = 100 - input$top)
             }
)

observeEvent(input$bottom,
             if((input$bottom + input$top) > 100){
               updateNumericInput(session, "top", value = 100 - input$bottom)
             }
)



output$outputratio <- renderText({ ownratio(onlyones, input$top, input$bottom) })


output$ratio_out1 <- renderPlot({
  input$action
  isolate(ggratio(onlyones, input$bottom, input$top))
})


