
#-------------------------------ginilorenz
ginipage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw sc texts", style = "height:760px;",
                       div(class = "metric_header", "Lorenz Curve"),
                       div(class = "metric_text", 
                            p("The Lorenz curve is a straightforward way to visualize the degree of inequality (Gastwirth, 1972; Lorenz, 1905). Taking income as an example, the Lorenz curve relates the relative share of a total income to the relative share of a population (De Maio, 2007). The curve is drawn in a diagram, where the x-axis represents the cumulative percentual share of components and the y-axis the cumulative percentual share of the total income."),
                            p("Entries are sorted in an ascending order, beginning with the lowest income and ending with the highest. In case that every person would have the same amount of income, the Lorenz curve would manifest as a straight diagonal from the axis origin to point (1, 1) or 100% for both axes. This diagonal is also referred to as line of equality. The sorting ensures that a Lorenz curve can never exceed the line of equality.  The more inequality is present in a given distribution, the more the Lorenz curve stays close to the x-axis across most of its spectrum but rising high at the right end of the curve. In the extreme case of maximum inequality, where a unit owns 100% of the income (or units), the curve - starting from the axis origin - would follow the x-axis for the cumulative share of all components that do not own anything and then rise steeply to the point (1, 1).")
                       ),
                       br(),
                       div(class = "metric_header", "Gini Index"),
                       div(class = "metric_text", 
                            p("The Gini index, sometimes called Gini coefficient, is the most widely known measure for inequality (Ceriani & Verme, 2012; Gastwirth, 1972), broadly used to compare the income distributions of whole countries (OECD, 2011) but also for other applications in the fields of economy, health, engineering and natural sciences (Jiang et al., 2016; Lee, 1997; Zonoobi et al., 2011). The Gini index, like all other discussed measures in the app, breaks the whole distribution down to one single value to describe the amount of inequality. Uncorrected, the Gini index ranges from 0, indicating perfect equality, to (1 \u002d 1/k; k = number of components), indicating maximal inequality. It is a measure for absolute inequality, as the number of components defines its upper bound. However, the corrected Gini index is bounded from 0 to 1 and is thus a measure of relative inequality, since it is not affected by the component size."),
                            p("The Lorenz curve and the Gini index are strongly related. The Gini index can be interpreted as the area between the line of equality and the Lorenz curve divided by the triangle under the line of equality (= 1/2). The closer the Lorenz curve approaches the line of equality, the smaller the numerator of the division becomes, resulting in a smaller Gini index. Accordingly, the Gini index increases as the Lorenz curve approximates the x-axis and the area between the line of equality and the curve enlarges."),
                            p("The Gini index in combination with the Lorenz curve lends to a good visual and easy-to-understand representation of inequality. However, the Gini index on its own may need to be interpreted with caution. Inequality can be present on different points of the distribution. Therefore, the Lorenz curve should always be considered in addition to the Gini index.")
                       ),
                       br(),
                       hr(),
                       br(),
                       div(class = "instructions",
                             p("On the right side you can move five sliders to learn about the construction of the Lorenz curve and the calculation of the Gini index. 
                                The sliders represent the Income of five different persons."),
                             p("Adjust the sliders to the distribution A = (10, 10, 10, 10, 60) and afterwards to the distribution B = (6, 6, 6, 41, 41). 
                                Can you see how different distributions can lead to same or very similar indices? In distribution A, inequality results due to 
                                20% percent of the persons (one of five persons) having 60% of the total income and the remaining 80% having only 40% of the income. 
                                In distribution B, more than 80% of the total income is distributed among the top 40% (two of five persons) and the remainder 
                                of the total income belongs to the other 60%.")
                       ),
                       br(),
                       br()
             )
      ),
      column(width = 4,
             wellPanel(class = "bw",
                       div(class = "inter_header", "Set the Income (in k)"),
                       sliderInput("gini1", "First Person's Income", min = 0, max = 100, step = 1, value = 80),
                       sliderInput("gini2", "Second Person's Income", min = 0, max = 100, step = 1, value = 30),
                       sliderInput("gini3", "Third Person's Income", min = 0, max = 100, step = 1, value = 25),
                       sliderInput("gini4", "Fourth Person's Income", min = 0, max = 100, step = 1, value = 20),
                       sliderInput("gini5", "Fifth Person's Income", min = 0, max = 100, step = 1, value = 15)
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

