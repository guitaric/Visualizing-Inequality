
#--------------------------------rosenbluth
rosenbluthpage <-
  
  fluidPage(
    fluidRow(
      column(width = 7,
             h3(tags$b("Rosenbluth Index")),
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
                       h4(tags$b("Set the Revenue")),
                       sliderInput("ros1", "Revenue of Company A (in Billion)", min = 0, max = 10, step = 0.5, value = 10),
                       sliderInput("ros2", "Revenue of Company B (in Billion)", min = 0, max = 10, step = 0.5, value = 10),
                       sliderInput("ros3", "Revenue of Company C (in Billion)", min = 0, max = 10, step = 0.5, value = 1),
                       sliderInput("ros4", "Revenue of Company D (in Billion)", min = 0, max = 10, step = 0.5, value = 0),
                       sliderInput("ros5", "Revenue of Company E (in Billion)", min = 0, max = 10, step = 0.5, value = 0)
             )
      ),
    ),
    fluidRow(
      box(title = "1. Sort (Descending) and Cumulate the Values", solidHeader = T, width = 4, plotOutput("ros_out1")),
      box(title = "2. Connect the Points", solidHeader = T,  width = 4, plotOutput("ros_out2")),
      box(title = "3. Fill the Area above the Line", solidHeader = T, width = 4, plotOutput("ros_out3")),
      valueBoxOutput(width = 6, "rosen_index")
      
    )
  )