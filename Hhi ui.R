
#-------------------------------------herfindahl

herfindahlpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
           div(class = "metric_header", "Herfindahl-Hirschmann Index"),
           div(class = "metric_text",
               p("The Herfindahl-Hirschmann index, also Herfindahl index, Hirschmann index or HHI (Hirschmann, 1964), is a simple measure based on the combinatorics model. It is mainly used to describe the concentration of markets but, can also be used to determine the degree of brand loyalty of a customer or the degree of fragmentation in elections of (political) parties (Wagschal, 1999). "),
               p("This index is calculated by summing up the squared shares of every component of the distribution. Squaring results in a disproportionally high weighting of the larger shares and tends to disregard the smaller shares (e.g., 0.1\u00b2 = 0.01). Ranking is not necessary and therefore a nominal level of measurement of the input variable is sufficient. The HHI reaches its maximum of 1 when a single component possesses the total share on its own (1\u00b2 = 1) and its minimum of 1/k (k = number of components) for evenly distributed shares. Components without a share, also called null components, are ignored in the formula, because squaring a share of zero results in zero. Due to its sensitivity to the number of components, but its disregard of null components, the index is a special measure of absolute inequality. The HHI is suitable for reflecting market power because of its emphasis on large shares and its insensitivity for low shares. In a market with many companies selling a very small number of products, these companies would be of little or no importance for the estimation of the market separation.")
           ),
               br(),
               hr(),
               br(),
           div(class = "instructions",
               p("In this example, five parties compete in an election. The squaring of the shares can directly be seen 
                 in the diagram. Set the sliders so that one political party receives all votes and see what area gets colored 
                 in blue. Also try an equal distribution of votes among the five parties. Pay attention to the parties with a 
                 very small or no share of votes."),
               br(),
               br()
           )
         )
      ),
      column(width = 4,
         wellPanel(class = "bw",
           div(class = "inter_header", "Set the amount of political parties"),
           sliderInput("hhi1", "Votes of 1st Party", min = 0, max = 100, step = 1, value = 30),
           sliderInput("hhi2", "Votes of 2nd Party", min = 0, max = 100, step = 1, value = 25),
           sliderInput("hhi3", "Votes of 3rd Party", min = 0, max = 100, step = 1, value = 12),
           sliderInput("hhi4", "Votes of 4th Party", min = 0, max = 100, step = 1, value = 10),
           sliderInput("hhi5", "Votes of 5th Party", min = 0, max = 100, step = 1, value = 6)
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