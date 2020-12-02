
counter <- reactiveValues(countervalue = "A B A")

#create Letters
observeEvent(input$abutton, { counter$countervalue <- paste(counter$countervalue, " A") })
observeEvent(input$bbutton, { counter$countervalue <- paste(counter$countervalue, " B") })
observeEvent(input$cbutton, { counter$countervalue <- paste(counter$countervalue, " C") })
observeEvent(input$dbutton, { counter$countervalue <- paste(counter$countervalue, " D") })
observeEvent(input$ebutton, { counter$countervalue <- paste(counter$countervalue, " E") })
observeEvent(input$fbutton, { counter$countervalue <- paste(counter$countervalue, " F") })


# clear text
observeEvent(input$clearbutton, { counter$countervalue = ""
counter$count = 0})

#delete last letter
observeEvent(input$returnbutton, { counter$countervalue = str_sub(counter$countervalue, 1, str_count(counter$countervalue) -1)
counter$count = counter$count -1})



shannonvec <- reactive({
  shavec <- as.vector(counter$countervalue)
  
  as <- str_count(shavec, "A")
  bs <- str_count(shavec, "B")
  cs <- str_count(shavec, "C")
  ds <- str_count(shavec, "D")
  es <- str_count(shavec, "E")
  fs <- str_count(shavec, "F")
  
  
  back <- c(as, bs, cs, ds, es, fs)
  
  return(back)
})



svec_no0 <- reactive({
  shavec <- as.vector(counter$countervalue)
  
  as <- str_count(shavec, "A")
  bs <- str_count(shavec, "B")
  cs <- str_count(shavec, "C")
  ds <- str_count(shavec, "D")
  es <- str_count(shavec, "E")
  fs <- str_count(shavec, "F")
  
  
  back <- c(as, bs, cs, ds, es, fs)
  
  return(back[back != 0])
})


#chosen log
loga <- reactive({ as.character(input$logtype) })

#typed in string
output$shannontext <- renderText({ counter$countervalue })

#table values Shannon
output$shannontable <- renderTable({
  req(length(svec_no0()) > 0)
  shannondat(shannonvec(), loga()) 
  }, digits = 3)


 
output$sha_indexlog2 <- renderValueBox({ req(length(svec_no0()) > 0)
       valueBox( round(shannon(svec_no0(), "log2"), 3), "Shannon Index (log 2)", color = 'black') })

output$sha_indexln <- renderValueBox({ req(length(svec_no0()) > 0)
       valueBox( round(shannon(svec_no0(), "ln"), 3), "Shannon Index (log nat)", color = 'black') })

output$sha_indexlog10 <- renderValueBox({ req(length(svec_no0()) > 0) 
       valueBox( round(shannon(svec_no0(), "log10"), 3), "Shannon Index (log10)", color = 'black') })

