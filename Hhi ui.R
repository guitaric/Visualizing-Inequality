
#-------------------------------------herfindahl

herfindahlpage <-
  
  fluidPage(
    h3(tags$b("Herfindahl-Hirschmann Index")),
    fluidRow(
      column(width = 7,
             h4("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam 
                  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                  sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                  Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
                  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod 
                  tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
                  At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                  no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, 
                  consetetur sadipscing elitr, sed diam 
                  nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
                  sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. 
                  Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. 
                  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod 
                  tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
                  At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
                  no sea takimata sanctus est Lorem ipsum dolor sit amet.")
      ),
      column(width = 1),
      column(width = 4,
             wellPanel(style = "background: white",
                       tags$hr(),
                       h4(tags$b("Build a String")),
                       sliderInput("hhi1", "Person 1", min = 0, max = 10, step = 0.5, value = 5),
                       sliderInput("hhi2", "Person 2", min = 0, max = 10, step = 0.5, value = 2),
                       sliderInput("hhi3", "Person 3", min = 0, max = 10, step = 0.5, value = 1.5),
                       sliderInput("hhi4", "Person 4", min = 0, max = 10, step = 0.5, value = 1),
                       sliderInput("hhi5", "Person 5", min = 0, max = 10, step = 0.5, value = 0.5)
             ),
             box(title = "Build Squares", width = 12, solidHeader = T, plotOutput("herfindahl_out1")),
             valueBoxOutput(width = 6, "hhi_index")
             
      )
      
    )
  )