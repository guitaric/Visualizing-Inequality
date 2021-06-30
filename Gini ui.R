
#-------------------------------ginilorenz
ginipage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw sc texts", style = "height:760px;",
                       div(class = "metric_header", "Lorenz Curve"),
                       div(class = "metric_text", 
                            p("The Lorenz curve (Lorenz, 1905) provides a straightforward visualization of the degree of statistical inequality (Gastwirth, 1972). It relates the relative share of units to the relative share of components (De Maio, 2007) and hence provides a straightforward visualization of the unit distribution. In essence, the Lorenz curve is a probability plot of the unit distribution, comparing it to a uniform distribution."),
                            p("The curve is drawn in a diagram, wherein the x-axis represents the cumulative percentage share of components and the y-axis the cumulative percentage share of units. Components are sorted in ascending order, beginning with the lowest unit share and ending with the highest one. The Lorenz curve is thus applicable to variables of any scale level (categorical or metric); however, for ordinal variables, their inherent ordering is ignored."),
                            p("In the case that every component has the same share of units, the Lorenz curve manifests as the diagonal from the axis origin to the point (1, 1), or 100% of both axes, respectively. This diagonal is referred to as the line of equality. The sorting ensures that a Lorenz curve never exceeds this line of equality. The higher the inequality in a given distribution, the more the Lorenz curve will remain close to the x-axis, rising to the point (1, 1) and reaching it only from the far-right end of its possible range. In the extreme case of maximum inequality, where 100% of all the units fall into a single component, the Lorenz curve coincides with the x-axis over its total range, rising sharply to (1, 1) only at the rightmost position of its last component.")
                       ),
                       
                       br(),
                       div(class = "metric_header", "Gini Index"),
                       div(class = "metric_text", 
                            p("The Gini index (Gini, 1912) compares the unit shares of all components to each other; i.e., it is the normed average absolute difference between all pairs of components. The Gini index can be interpreted as the fraction of the area between the line of equality and the Lorenz curve (A; yellow area in the rightmost diagram below) to the total area below the line of equality (A+B, which is 0.5). Hence, it satisfies the equation G = A / (A+B) = 2A. Accordingly, the Gini index increases with A. The closer the Lorenz curve is to the line of equality, and the smaller area A, the lower is the Gini index."),
                            p("The Gini index ranges from 0 (indicating perfect equality) to 1 \u002D 1/k (indicating maximum inequality). It is a measure of absolute inequality, as the number of components (k) defines its upper bound. The corrected Gini index is bounded by the interval 0 to 1 and is a measure of relative inequality, since it is not affected by the total number (or, differences in the number) of components."),
                            p("Combined with the Lorenz curve, the Gini index leads to easy\u002Dto\u002Dunderstand visual representations of inequality. However, the Gini index is an area-based measure and for this reason only poorly linked to the actual shape of the unit distribution. Thus, the value of the Gini index may be identical for distributions differing in shape. Measures like the generalized entropy index, the Atkinson index, or tail ratios, provide more fine-grained information with regards to specified regions of the Lorenz curve.")
                       ),
                       
                       br(),
                       hr(),
                       br(),
                       div(class = "instructions",
                             p("On the right side you can move five sliders to learn about the construction of the Lorenz curve and the calculation of the Gini index. The sliders represent the units (e.g., scale or test scores, reaction times in ms, or counts of the variable values of a categorical variable) of five different components (e.g., individual persons or the variable values of a categorical variable)."),
                             p("See what area is colored in the rightmost diagram to compute the Gini index."),
                             p("Adjust the sliders to the distribution A = (100, 100, 100, 100, 600) and afterwards to the distribution B = (60, 60, 60, 410, 410). Can you see how different distributions can lead to same or very similar index values? In distribution A, 20% percent of the components (one of five components) has 60% of the total number of units and the remaining 80% (four components) have only 40% of the units. In distribution B, more than 80% of the units are distributed among the top 40% (two of five components) and only 20% of the units belong to the remaining 60% (three of five components).")
                       ),
                       br(),
                       br()
             )
      ),
      column(width = 4,
             wellPanel(class = "bw",
                       # div(class = "inter_header", "Set the Income (in k)"),
                       sliderInput("gini1", "First Component's Units", min = 0, max = 1000, step = 10, value = 800),
                       sliderInput("gini2", "Second Component's Units", min = 0, max = 1000, step = 10, value = 300),
                       sliderInput("gini3", "Third Component's Units", min = 0, max = 1000, step = 10, value = 250),
                       sliderInput("gini4", "Fourth Component's Units", min = 0, max = 1000, step = 10, value = 200),
                       sliderInput("gini5", "Fifth Component's Units", min = 0, max = 1000, step = 10, value = 150)
             ),
             wellPanel(class = "bw",
                       fluidRow(
                         valueBoxOutput(width = 6, "gini_index"),
                         valueBoxOutput(width = 6, "corrgini_index")
                       )
             )
      )
    ),
    fluidRow(
      box(class = "boxes", title = "1. Sort and Cumulate the Values", solidHeader = T, width = 4, plotOutput("slider_out1")),
      box(title = "2. Connect the Points (Lorenz Curve)", solidHeader = T, width = 4, plotOutput("slider_out2")),
      box(title = "3. Fill the Area between the Line and the Diagonal of Equality", solidHeader = T, width = 4, plotOutput("slider_out3"))
    ),
    tags$footer(foot)
  )

