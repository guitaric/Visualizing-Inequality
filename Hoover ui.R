#--------------------------------hoover
hooverpage <-
  
  fluidPage(
    h3(tags$b("Hoover Index")),
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
                       h4(tags$b("Set the Capital")),
                       sliderInput("hoo1", "First Person's Capital", min = 0, max = 10000, step = 250, value = 10000),
                       sliderInput("hoo2", "Second Person's Capital", min = 0, max = 10000, step = 250, value = 5000),
                       sliderInput("hoo3", "Third Person's Capital", min = 0, max = 10000, step = 250, value = 7000),
                       sliderInput("hoo4", "Fourth Person's Capital", min = 0, max = 10000, step = 250, value = 3500),
                       sliderInput("hoo5", "Fifth Person's Capital", min = 0, max = 10000, step = 250, value = 1000)
             ),
             box(title = "Determine the longest Dist. between Line of Eq. and drawn Line", width = 12, solidHeader = T, plotOutput("sliderhoover")),
             valueBoxOutput(width = 6, "hoover_index"),
             valueBoxOutput(width = 6, "corrhoover_index")
             
             
      )
    )
  )
#)