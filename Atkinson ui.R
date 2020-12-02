atkinsonpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
             div(class = "metric_header", "Atkinson Index"),
             div(class = "metric_text",
                 p("The Atkinson index is a measure for measuring income inequality (Atkinson, 1970; Atkinson, 1987, Atkinson, 2008). It is derived from the Social Welfare Model, i.e. when calculating an index of inequality, this model takes into account not only the given distribution of income, but also the social welfare of a population. This is done incorporating a parameter called epsilon. This parameter represents the inequality aversion of the population and can range from 0 (no inequality aversion) to \u221e (maximal inequality aversion); it is recommended to be set between 1 and 2 (Atkinson, 1970). Setting epsilon to 0, i.e., no inequality in the population at all, then every possible distribution, whether perfectly equal or unequal, results in an Atkinson index of 0. As the epsilon increases, the Atkinson index also increases, but only if the distribution is not perfectly equal."),
                 p("The index is interpreted as follows: If the distribution has an Atkinson index of 0.4, only 60% (= (1 - 0.4) *100%) of the total income of the population, when equally distributed, is necessary to achieve the same amount of social welfare. Hence, in the case of equal distributions, the index is 0, as any reduction in the already equally distributed income would result in a loss of social welfare. Conversely, in a perfectly unequal society, where one person earns the entire income herself or himself, 0% would achieve the same level of social welfare, since social welfare is already at its lowest.")
                   ),
                 br(),
                 hr(),
                 br(),
             div(class = "instructions",
                 p("Choose between different distributions on the right side and discover the effects of the parameter 
                   epsilon (from 0 to 3) on the Atkinson index. Additionally, you can set the sliders on specific parameter 
                   values to have the exact Atkinson index."),
                 br(),
                 br()
             )
         )
      ),
      column(width = 4,
             wellPanel(class = "bw",
                 div(class = "inter_header", "Choose a distribution"),
                 fluidRow(
                   selectInput("selectdist_atk", "", c("A: 1000, 50, 50, 50, 50",
                                                       "B: 100, 50, 50, 50, 50",
                                                       "C: 200, 200, 200, 200, 200",
                                                       "D: 100, 200, 300, 400, 500",
                                                       "E: 1000, 1000, 50, 50, 50, 50, 50, 50, 50, 50",
                                                       "F: 1000, 200, 200, 200, 200",
                                                       "G: 200, 400, 600, 800, 1000",
                                                       "H: 1000, 0, 0, 0, 0")),
                   hr(),
                   box(title = "The Atkinson Index for different epsilon", width = 12, solidHeader = T, plotOutput("atk_plot"))
                 )
            ),
            wellPanel(class = "bw",  
              fluidRow(
                  sliderInput("atk1", "Choose the Epsilon", min = 0, max = 3, step = 0.25, value = 1)
              )
                      
            ),
            wellPanel(class = "bw",
                fluidRow(
                  valueBoxOutput(width = 12, "atk_index")
                )
            )
    )
  ),
  tags$footer(foot)
)

