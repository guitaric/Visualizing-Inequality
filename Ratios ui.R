ratiopage <- 
  
  fluidRow(
    column(width = 8, 
           h3(tags$b("Palma Ratio")),
           h5("Inequality can also be measured by comparing the tails of the distribution, namely the poorest x percent with the richest y percent. 
               To compare the tails, the share of the richest x percent is simply divided by the share of the poorest y percent. 
               The result is an inequality metric that expresses how much more capital the rich possess in comparison to the poor.
               A widely known ratio to describe wealth among countries is the Palma Ratio, named after the economist Gabriel Palma. 
               It is the Ratio between the richest 10% with the poorest 40% of a population. 
               In theory the range of the Palma ratio is 0.25 to Infinite but the Palma Ratios of the most European countries ranged from 0.8 to 1.8 in the year 2017 XXX.
               Another common ratio is the Quintile Ratio (20:20 ratio) that compares the poorest fifth with the richest fifth of the population and accordingly 
               the Decile Ratio comparing the richest and poorest 10 percent, respectively.
               Go ahead and calculate your own ratio on the right side!
               "),
           h3(tags$b("20:20 Ratio/80:20 Ratio")),
           h5("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam 
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
                  no sea takimata sanctus est Lorem ipsum dolor sit amet."),
           h3(tags$b("Decile Ratio")),
           h5("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam 
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
                     selectInput("ratiodata", 'Select the Data', choices =c('A', 'B', 'C', 'D')),
                     br(),
                     numericInput("top", "Compare Top _%", min = 1, max = 50, value = 5),
                     numericInput("bottom", "with Bottom _%", min = 1, max = 99, value = 30),
                     actionButton("action", "Apply")
           ),
           wellPanel(style = "background: white",
                     h4("ratio with own values"),
                     textOutput("outputratio")
           ),
           box(title = "Ratios", width = 12, solidHeader = T, plotOutput("ratio_out1"))
    )
    
  )
