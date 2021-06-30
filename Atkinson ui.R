atkinsonpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
             div(class = "metric_header", "Atkinson Index"),
             div(class = "metric_text",
                 p("The Atkinson index (Atkinson, 1970, 1987, 2008) is a measure of income inequality with intimate links to the generalized entropy index. It is derived from the so-called social welfare model, which is specifically concerned with the effects of redistributing units from the high range of the distribution to the low range. Similar to the generalized entropy index, the Atkinson index is characterized by an additional parameter, in this case \u03F5 (\u0027inequality aversion\u0027). Unlike \u03B1, \u03F5 is restricted to nonnegative values. The two parameters are related, as are the generalized entropy index and the Atkinson index themselves. Atkinson (1970) recommended to set \u03F5 values between 1.5 and 2 (which results in \u03B1 values between -0.5 and -1). Setting \u03F5 to 0 results in an Atkinson index of 0 for all distributions. Otherwise, the Atkinson index increases with increasing \u03F5, given that the distribution is not perfectly equal. The parameter \u03F5 is a fine-tuning parameter like \u03B1, but allows to \u0022zoom in\u0022 only into the low range of the distribution (i.e., it assigns more and more weight to redistribute units from the high range to the low range)."),
                 p("In its original conceptualization and application, the Atkinson index is meant to be interpreted in relation to a social welfare function and the \u0027welfare equivalent equally distributed income.\u0027 This common standard depends on the value of the Atkinson index itself and on the choice of \u03F5. For \u03F5 = 0, the Atkinson index is 0 and the common standard is equal to the average of units. For all other cases, the Atkinson index quantifies the fraction of units of the total unit sum, which is needed to reach this common standard for each component, if units were distributed equally. For example, with an Atkinson index of 0.4, the common standard could be reached for each component with only 60% (= [1-0.4]\u002A100%) of the total unit sum, if units were distributed equally. In the case of an equal unit distribution, the Atkinson index is 0, and the unit share of every component already corresponds to the common standard.")
                   ),
             
                 br(),
                 hr(),
                 br(),
             div(class = "instructions",
                 p("Choose one of the eight sample distributions and discover the effects of the parameter \u03F5 (from 0 to 3) on the Atkinson index. Additionally, you can select specific \u03F5 values with the slider to compute the corresponding generalized entropy index."),
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
                   box(title = "The Atkinson Index for different values of epsilon", width = 12, solidHeader = T, plotOutput("atk_plot"))
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

