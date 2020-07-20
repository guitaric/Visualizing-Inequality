atkinsonpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
             h3(tags$b("Atkinson Index")),
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
      column(width = 4,
             wellPanel(style = "background: white",
                       fluidRow(
                         selectInput("selectdist_atk", "Choose a Distribution", c("A: 1000, 0, 0, 0, 0", "B: 360, 300, 200, 80, 60", "C: 200, 200, 200, 200, 200", "D: 500, 140, 130, 120, 110",
                                                                                  "E: 1000, 280, 260, 240, 220", "F: 180, 180, 150, 150, 100, 100, 40, 40, 30, 30",
                                                                                  "G: 100, 100, 100, 100, 100, 100, 100, 100, 100, 100,", "H: 199, 199, 199, 199, 199, 1, 1, 1, 1, 1")),
                         br(),
                         br(),
                         box(title = "How the Parameter epsilon is affecting the Atkinson Index", width = 12, solidHeader = T, plotOutput("atk_plot"))
                             
                             
                             #sliderInput("alpha_input", "Choose Alpha", min = 0, max = 50, value = 1)
                         
                       )
             )
             #column(width = 4,
             #box(title = "Determine the longest Dist. between Line of Eq. and drawn Line", solidHeader = T,
             #plotOutput("sliderhoover")
             #)
      )
    )
  )