

simpsonpage <-
  
  fluidPage(
    fluidRow(
        column(width = 8,
               wellPanel(class = "bw texts",
                  div(class = "metric_header", "Simpson Index"),
                  div(class = "metric_text",
                      p("The Simpson index (Simpson, 1949) quantifies the probability that two randomly selected units belong to the same component. It is based on an urn model without replacement (i.e., drawing random units decreases the components\u0027 unit share). The Simpson index is a measure of absolute inequality and intended for categorical variables. It converges in value with the Herfindahl-Hirschman index for large N (the total number of units). For small N, the Simpson index is the appropriate and correct measure."),
                      p("The complementary probability of the Simpson index (1 \u002D S), denominated as Gini-Simpson index, can be interpreted as the probability that two randomly selected units belong to different components. The inverse Simpson index (i.e., its reciprocal value, 1/S) maps the values of the Simpson index onto the interval [1, \u221E], with positive infinity corresponding to a probability of 0 in the Simpson index and 1 to a probability of 1. The Gini-Simpson index and the inverse Simpson index are measures of equality.")
                  ),
                  
                      br(),
                      hr(),
                      br(),
                  div(class = "instructions",
                      p("On the right side you can provide names and unit counts for up to five variable values of a categorical variable. The units represent the counts of the variable values of the categorical variable, the variable values themselves are the components."),
                      p("Play with the inputs. The index values are sensitive to both the number of components and their corresponding numbers of units. With one unit per component, the probability of choosing two units from the same component is 0. This probability only increases with higher unit numbers. Also, the more components there are, the lower is the probability of randomly choosing two units from the same component."),
                      p("See for yourself how the numbers of components and units within each component affect the values of these three measures."),
                      br(),
                      br()
                  )
               )
        ),
        column(width = 4,
               wellPanel(class = "bw",
                 # div(class = "inter_header", "Put in values for different variable values"),
                 fluidRow(
                   column(width = 6, 
                          textInput("group1", "First  Component (green)", value = ""),
                          textInput("group2", "Second Component (red)", value = ""),
                          textInput("group3", "Third Component (blue)", value = ""),
                          textInput("group3", "Fourth Component (yellow)", value = ""),
                          textInput("group3", "Fifth Component (grey)", value = "")
                   ),
                   column(width = 6, 
                          numericInput("sim_nr1", "Count", value = 70, min = 0, max = 100),
                          numericInput("sim_nr2", "Count", value = 35, min = 0, max = 100),
                          numericInput("sim_nr3", "Count", value = 20, min = 0, max = 100),
                          numericInput("sim_nr4", "Count", value = 10, min = 0, max = 100),
                          numericInput("sim_nr5", "Count", value = 5, min = 0, max = 100)
                   )
                    )
               ),
               wellPanel(class = "bw",
                 fluidRow(
                   valueBoxOutput(width = 4, "sim_index"),
                   valueBoxOutput(width = 4, "ginisim_index"),
                   valueBoxOutput(width = 4, "invsim_index")
                 )
               ),
               box(title = "Groups", width = 12, solidHeader = T, plotOutput("simpsonout"))
        )
      ),
    tags$footer(foot)
  )