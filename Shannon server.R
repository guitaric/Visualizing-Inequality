counter <- reactiveValues(countervalue = "A B A")
# counter <- reactiveValues(count = 0 )

#create Letters
observeEvent(input$abutton, { counter$countervalue <- paste(counter$countervalue, " A") })
observeEvent(input$bbutton, { counter$countervalue <- paste(counter$countervalue, " B") })
observeEvent(input$cbutton, { counter$countervalue <- paste(counter$countervalue, " C") })
observeEvent(input$dbutton, { counter$countervalue <- paste(counter$countervalue, " D") })
observeEvent(input$ebutton, { counter$countervalue <- paste(counter$countervalue, " E") })
observeEvent(input$fbutton, { counter$countervalue <- paste(counter$countervalue, " F") })


# observeEvent(input$abutton, { counter$count <- counter$count + 1 })
# observeEvent(input$bbutton, { counter$count <- counter$count + 1 })
# observeEvent(input$cbutton, { counter$count <- counter$count + 1 })
# observeEvent(input$dbutton, { counter$count <- counter$count + 1 })

# clear text
observeEvent(input$clearbutton, { counter$countervalue = ""
counter$count = 0})

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
  
  return(back[back != 0])
})


loga <- reactive({ as.character(input$logtype) })

#typed in string
output$shannontext <- renderText({ counter$countervalue })

#table values Shannon
output$shannontable <- renderTable({
  if(shannonvec() == '') return()
  else shannondat(shannonvec(), loga()) 
  })


#display index
# output$sha_index <- renderValueBox({
#   if(shannonvec() == 0) return( valueBox( 0, "Shannon Index", color = 'yellow' ) )
#   else return ( valueBox( shannon(shannonvec(), loga()), "Shannon Index", color = 'black' ) )
# })

output$sha_indexlog2 <- renderValueBox({ valueBox( round(shannon(shannonvec(), "log2"), 3), "Shannon Index (log2)", color = 'black') })
output$sha_indexln <- renderValueBox({ valueBox( round(shannon(shannonvec(), "ln"), 3), "Shannon Index (ln)", color = 'black') })
output$sha_indexlog10 <- renderValueBox({ valueBox( round(shannon(shannonvec(), "log10"), 3), "Shannon Index (log10)", color = 'black') })

