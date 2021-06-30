
#-------------------------------------herfindahl

herfindahlpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
           div(class = "metric_header", "Herfindahl-Hirschman Index"),
           div(class = "metric_text",
               p("The Herfindahl-Hirschman index (HHI; Herfindahl, 1950; Hirschman, 1945, 1964) quantifies the probability that two randomly selected units belong to the same component and is based on an urn model with replacement (i.e., drawing random units does not change the components\u0027 unit shares). The HHI is calculated by summing the squared unit shares of every component of the unit distribution. Larger unit shares are disproportionally weighted more heavily than smaller unit shares (e.g., 0.82 = 0.64, but 0.12 = 0.01). The HHI is thus more sensitive to large unit shares than small unit shares."),
               p("The HHI reaches its maximum value of 1, when a single component possesses the total share all on its own, and its minimum value of 1/k for evenly distributed shares (k = number of components). Components without a share (null components) are ignored in computing the HHI. Due to its sensitivity to the number of components, but its disregard of null components, the HHI represents a special case of an absolute inequality measure."),
               p("For applications to categorical variables, N (the total number of units) needs to be relatively large, as the urn model with replacement is only asymptotically correct in this case. For small N, the Simpson index, the Gini-Simpson index, or the inverse Simpson index should be used instead.")
           ),
           
               br(),
               hr(),
               br(),
           div(class = "instructions",
               p("On the right side you can move five sliders to learn about the calculation of the Herfindahl-Hirschman index. The sliders represent the units (e.g., scale or test scores, reaction times in ms, or counts of the variable values of a categorical variable) of five different components (e.g., individual persons or the variable values of a categorical variable)."),
               p("The squaring of the unit shares can directly be seen in the diagram."),
               p("Set the sliders so that one component has all the units and see what area gets colored in blue. Also, try an equal distribution of units among the five components. Pay attention to the components with only few or even no units. "),
               br(),
               br()
           )
         )
      ),
      column(width = 4,
         wellPanel(class = "bw",
           div(class = "inter_header", "Set the amount of political parties"),
           sliderInput("hhi1", "First Component's Units", min = 0, max = 1000, step = 10, value = 300),
           sliderInput("hhi2", "Second Component's Units", min = 0, max = 1000, step = 10, value = 250),
           sliderInput("hhi3", "Third Component's Units", min = 0, max = 1000, step = 10, value = 120),
           sliderInput("hhi4", "Fourth Component's Units", min = 0, max = 1000, step = 10, value = 100),
           sliderInput("hhi5", "Fifth Component's Units", min = 0, max = 1000, step = 10, value = 60)
         ),
         wellPanel(class = "bw",
             fluidRow(
               valueBoxOutput(width = 12, "hhi_index")
             )
         ),
         box(title = "Build Squares", width = 12, solidHeader = T, plotOutput("herfindahl_out1"))
             
      )
      
    ),
    tags$footer(foot)
  )