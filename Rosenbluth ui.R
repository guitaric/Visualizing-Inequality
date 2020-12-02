
#--------------------------------rosenbluth
rosenbluthpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw sc texts", 
                       style = "height: 760px;",
                       div(class = "metric_header", "Rosenbluth Index"),
                       div(class = "metric_text", 
                           p("The Rosenbluth index is mainly used to calculate how strongly a market is dominated by a monopoly (Fedderke & Szalontai, 2009; Rosenbluth, 1955). Equivalently to the calculation of the Lorenz curve and the Gini index, the components are sorted and listed in a diagram, but in descending order for this measure, so that the first entry contains the highest component share. In contrast to the x-axis of the Lorenz curve, where the limit is 1 or 100%, the x-axis of this concentration curve is as long as the total number of components. For instance, if five components are considered, the x-axis would reach the value 5, which gives a total area of 1*5 = 5 for the total area of the diagram."),
                           p("To calculate the Rosenbluth index, 1 is divided by twice the area above the concentration curve. In case of total equality, the area above the curve would be identical to the triangle above the line of equality. If the area is doubled, the index would be 1/k with k as the number of components. In case of total inequality, the curve would steeply rise from (0,0) to (1,1) and continue horizontally to the rightmost point possible (k, 1). The resulting area above the concentration curve would consist of a triangle with the points (0,0; 0,1; 1,1) with an area of 0.5 leading the index to result in 1.")
                       ),
                           br(),
                           hr(),
                           br(),
                       div(class = "instructions",
                           p("Imagine a market where five companies participate. Set the revenue of these companies and see 
                             what area is coloured in the diagram to compute the Rosenbluth index."),
                           p("Create a situation, in which one company represents a monopole or situation, 
                             in which all five companies receive equal shares in the revenue."),
                           br(),
                           br()
                       )
             )
      ),
      column(width = 1),
      column(width = 4,
             wellPanel(class = "bw",
                       div(class = "inter_header", "Set the revenue"),
                       sliderInput("ros1", "Revenue of Company A (in Billion)", min = 0, max = 10, step = 0.5, value = 10),
                       sliderInput("ros2", "Revenue of Company B (in Billion)", min = 0, max = 10, step = 0.5, value = 10),
                       sliderInput("ros3", "Revenue of Company C (in Billion)", min = 0, max = 10, step = 0.5, value = 1),
                       sliderInput("ros4", "Revenue of Company D (in Billion)", min = 0, max = 10, step = 0.5, value = 0),
                       sliderInput("ros5", "Revenue of Company E (in Billion)", min = 0, max = 10, step = 0.5, value = 0)
             ),
             wellPanel(class = "bw",
                       fluidRow(
                         valueBoxOutput(width = 12, "ros_index")
                       )
             )
      ),
    ),
    fluidRow(
      box(title = "1. Sort (Descending) and Cumulate the Values", solidHeader = T, width = 4, plotOutput("ros_out1")),
      box(title = "2. Connect the Points", solidHeader = T,  width = 4, plotOutput("ros_out2")),
      box(title = "3. Fill the Area above the Line", solidHeader = T, width = 4, plotOutput("ros_out3")),
    ),
    tags$footer(foot)
  )