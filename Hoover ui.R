#--------------------------------hoover
hooverpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
           div(class = "metric_header", "Hoover Index"),
           div(class = "metric_text",
              p("The Hoover index (Hoover, 1936), also known as the Schutz index (Coulter, 1989) or Robin-Hood index (Kennedy et al., 1996), is one the simplest of all inequality measures. The Hoover index was repeatedly used to measure regional income inequality (Huang & Leung, 2009) or spatial concentration of a population (Santic, 2014). Using income as an example, it can be interpreted as the amount of income that needs to be redistributed to achieve perfect equality or, in other words, how much must be taken from the rich and given to the poor to result in an equal distribution. "),
              p("Similar to the Gini index, the Hoover index can be visualized using the Lorenz curve and is a measure for estimating absolute inequality when it is unbounded. The index is equal to the maximal vertical distance between the Lorenz curve and the line of equality, ranging from 0 for maximal equality when the Lorenz curve coincides with the line of equality, and to a maximum of 1-(1/k) with k as the number of components, which indicates maximal inequality. It requires only data at a nominal level of measurement."),
              p("To make the Hoover index a measure of relative inequality, it can be divided by 1-(1/k) to relate it to its number of components. The Corrected Hoover index ranges from 0 to 1 and is independent of component size.")
           ),
              br(),
              hr(),
              br(),
           div(class = "instructions",
               p("Move the five sliders to manipulate the income of five individuals and see what happens with the 
                colored vertical line representing the Hoover index.  Try extreme distributions e.g. (1.000, 0, 0, 0, 0) 
                and (100, 100, 100, 100, 100) and explore the boundaries of this index."),
              br(),
              br()
           )
              )
      ),
      column(width = 4, 
         wellPanel(class = "bw",
           div(class = "inter_header", "Set the capital (in k)"),
           sliderInput("hoo1", "First Person's Capital", min = 0, max = 1000, step = 25, value = 1000),
           sliderInput("hoo2", "Second Person's Capital", min = 0, max = 1000, step = 25, value = 500),
           sliderInput("hoo3", "Third Person's Capital", min = 0, max = 1000, step = 25, value = 700),
           sliderInput("hoo4", "Fourth Person's Capital", min = 0, max = 1000, step = 25, value = 350),
           sliderInput("hoo5", "Fifth Person's Capital", min = 0, max = 1000, step = 25, value = 100)
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
