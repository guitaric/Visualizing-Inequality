#--------------------------------hoover
hooverpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
           div(class = "metric_header", "Hoover Index"),
           div(class = "metric_text",
              p("The Hoover index (Hoover, 1936) compares the unit shares of all components to their overall mean; it is based on the sum of absolute deviations. It can be interpreted as the share of units that need to be redistributed across components to achieve perfect equality (or, couched in an economic context: the amount of money which must be taken from the rich and given to the poor to achieve an equal distribution; hence, its synonym \u0022Robin-Hood index\u0022)."),
              p("Similar to the Gini index, the Hoover index can be visualized via the Lorenz curve and is a measure of absolute inequality in its unbounded form. Its value is equal to the maximum vertical distance between the Lorenz curve and the line of equality, thus ranging from 0 (for maximum equality, when the Lorenz curve coincides with the line of equality) to 1 \u002D 1/k (for maximum inequality; k = number of components). The corrected Hoover index ranges from 0 to 1 and is a measure of relative inequality."),
           ),
           
              br(),
              hr(),
              br(),
           div(class = "instructions",
               p("On the right side you can move five sliders to learn about the of the Hoover index. The sliders represent the units (e.g., scale or test scores, reaction times in ms, or counts of the variable values of a categorical variable) of five different components (e.g., individual persons or the variable values of a categorical variable)."),
               p("Move the five sliders to manipulate the units of five components and see what happens with the colored vertical line representing the Hoover index. Try extreme distributions, e.g., (1000, 0, 0, 0, 0) and (100, 100, 100, 100, 100), and explore the boundaries of this index."),
               
              br(),
              br()
           )
              )
      ),
      
      column(width = 4, 
         wellPanel(class = "bw",
           # div(class = "inter_header", "Set the capital (in k)"),
           sliderInput("hoo1", "First Component's Units", min = 0, max = 1000, step = 10, value = 1000),
           sliderInput("hoo2", "Second Component's Units", min = 0, max = 1000, step = 10, value = 500),
           sliderInput("hoo3", "Third Component's Units", min = 0, max = 1000, step = 10, value = 700),
           sliderInput("hoo4", "Fourth Component's Units", min = 0, max = 1000, step = 10, value = 350),
           sliderInput("hoo5", "Fifth Component's Units", min = 0, max = 1000, step = 10, value = 100)
         ),
         wellPanel(class = "bw",
           fluidRow(
             valueBoxOutput(width = 6, "hoover_index"),
             valueBoxOutput(width = 6, "corrhoover_index")
           )
         ),
         box(title = "Maximal vertical distance between Line of Equality and Lorenz Curve", 
             width = 12, solidHeader = T, plotOutput("sliderhoover"))

             
             
      )
    ),
    tags$footer(foot)
  )
