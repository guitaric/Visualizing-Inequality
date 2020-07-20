
#-------------------------------ginilorenz
ginipage <-
  
  fluidPage(
    fluidRow(
      
      column(width = 7,
             h3(tags$b("Gini Index")),
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
                       h4(tags$b("Set the Income")),
                       sliderInput("sli1", "First Person's Income", min = 0, max = 10, step = 0.5, value = 10),
                       sliderInput("sli2", "Second Person's Income", min = 0, max = 10, step = 0.5, value = 6),
                       sliderInput("sli3", "Third Person's Income", min = 0, max = 10, step = 0.5, value = 4),
                       sliderInput("sli4", "Fourth Person's Income", min = 0, max = 10, step = 0.5, value = 2),
                       sliderInput("sli5", "Fifth Person's Income", min = 0, max = 10, step = 0.5, value = 0)
             )
      )
    ),
    fluidRow(
      box(title = "1. Sort and Cumulate the Values", solidHeader = T, width = 4, plotOutput("slider_out1")),
      box(title = "2. Connect the Points (Lorenz Curve)", solidHeader = T, width = 4, plotOutput("slider_out2")),
      box(title = "3. Fill the Area between the Line and the Diagonal of Equality", solidHeader = T, width = 4, plotOutput("slider_out3")),
      valueBoxOutput(width = 6, "gini_index"),
      valueBoxOutput(width = 6, "corrgini_index")
      
      
    ),
    fluidRow(plotOutput("here")
    )
  )

