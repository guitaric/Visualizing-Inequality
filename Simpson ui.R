

simpsonpage <-
  
  fluidPage(
    fluidRow(
        column(width = 8,
               wellPanel(class = "bw texts",
                  div(class = "metric_header", "Simpson Index"),
                  div(class = "metric_text",
                      p("The Simpson index is strongly related to the Herfindahl-Hirschmann index but is mainly used to describe (bio-)diversity (Simpson, 1949; Hill, 1963; Jost, 2006) and, hence, requires only data at a nominal level of measurement. For large groups, the HHI and the Simpson index are almost identical. For small groups, however, the two indices vary significantly from each other. "),
                      p("The interpretation of the index is defined as the probability that two randomly selected individuals of a total population belong to the same group and is bounded from 0 (0 %) to 1 (100 %). Accordingly, the complementary probability (1-S) can be seen as the probability that two randomly selected individuals do not belong to the same group. This complementary probability is referred to the Gini-Simpson index, also referred to as the probability of interspecific encounter or PIE (Hurlbert, 1971), the Gibbs-Martin index (Gibbs & Martin, 1962) or the Blau index (Tarigan et al., 2018). Since the Simpson index is a measure of equality and not of inequality, the inverse Simpson can be calculated by the reciprocal value of S, namely 1/S. The inverse Simpson index is therefore a measure of inequality and ranges from 1 to infinity.")
                  ),
                      br(),
                      hr(),
                      br(),
                  div(class = "instructions",
                      p("The effect on the Simpson index can be observed, by playing with the inputs on the right side. These group indices are sensitive to the absolute amount of group members. By having one individual for each species, the probability of choosing two individuals of the same species is 0, while it is higher when having two per species. Also, the so-called richness influences the index. The higher the number of groups to compare, the lower is the probability of randomly choosing two of the same group. "),
                      p("See for yourself how the number of groups and the number within each group affect the three diversity measures."),
                      br(),
                      br()
                  )
               )
        ),
        column(width = 4,
               wellPanel(class = "bw",
                 div(class = "inter_header", "Put in values for different groups"),
                 fluidRow(
                   column(width = 6, 
                          textInput("group1", "First  Species (green)", value = "goldfinch"),
                          textInput("group2", "Second Species (red)", value = "sparrow"),
                          textInput("group3", "Third Species (blue)", value = "bullfinch"),
                          textInput("group3", "Fourth Species (yellow)", value = ""),
                          textInput("group3", "Fifth Species (grey)", value = "")
                   ),
                   column(width = 6, 
                          numericInput("sim_nr1", "Count", value = 6, min = 0, max = 10),
                          numericInput("sim_nr2", "Count", value = 5, min = 0, max = 10),
                          numericInput("sim_nr3", "Count", value = 3, min = 0, max = 10),
                          numericInput("sim_nr4", "Count", value = 0, min = 0, max = 10),
                          numericInput("sim_nr5", "Count", value = 0, min = 0, max = 10)
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