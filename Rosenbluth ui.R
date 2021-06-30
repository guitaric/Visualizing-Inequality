
#--------------------------------rosenbluth
rosenbluthpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw sc texts", 
                       style = "height: 760px;",
                       div(class = "metric_header", "Rosenbluth Index"),
                       div(class = "metric_text", 
                           p("The Rosenbluth index (Rosenbluth, 1955) draws on the rank order of components and compares each component\u0027s unit share to the probability that two units belong to the same component (Coulter, 1989). It is a measure of absolute inequality (i.e., the number of components, k, defines its lower bound)."),
                           p("Because of its rank-order definition, the Rosenbluth index can be plotted in a diagram similar to the Lorenz curve. However, the components are sorted in descending order (not, as otherwise customary, in ascending order), so that the first entry in the diagram contains the highest (not the smallest) unit share. Also, the x-axis of the Rosenbluth index diagram does not cover the cumulative component shares in percent (1% to 100%), but rather the component numbers (1 to k) instead. For five components, the x-axis would range from 1 to 5, and the total area of the diagram would equal 5\u002A1 = 5. The diagonal in this rectangle again indicates the line of equality."),
                           p("Like the Gini index, the Rosenbluth index is an area measure. It is the reciprocal value of twice the area (A; red area in the rightmost diagram) above the concentration curve, R = 1/(2A). Thus, the Rosenbluth index can also be expressed in terms of the uncorrected Gini index (Marfels, 1971)."),
                           p("In the case of maximum equality, the curve coincides with the line of equality, and the area above the curve is identical to the right-angled triangle above the line of equality. The lower bound of the Rosenbluth index is thus 1/[2\u002A(k/2)] = 1/k. In the case of maximum inequality, the curve rises immediately steeply from (0, 0) to (1, 1), and then runs horizontally to the rightmost point (k, 1). The resulting (minimum) area above the concentration curve is then defined by a right-angled triangle having the corner points (0, 0), (0, 1), and (1, 1), thus spanning a total area of (1\u002A1)/2 = 0.5, in which case the Rosenbluth index yields a value of 1/(2\u002A0.5) = 1.")
                       ),
                       
                           br(),
                           hr(),
                           br(),
                       div(class = "instructions",
                           p("On the right side you can move five sliders to learn about the construction of the Rosenbluth diagram and the calculation of the Rosenbluth index. The sliders represent the units (e.g., scale or test scores, reaction times in ms, or counts of the variable values of a categorical variable) of five different components (e.g., individual persons or the variable values of a categorical variable)."),
                           p("See what area is coloured in the rightmost diagram to compute the Rosenbluth index."),
                           p("Create a situation, in which one component has all units or in which all five components have equal numbers of units."),
                           br(),
                           br()
                       )
             )
      ),
      column(width = 1),
      column(width = 4,
             wellPanel(class = "bw",
                       # div(class = "inter_header", "Set the revenue"),
                       sliderInput("ros1", "First Component's Units", min = 0, max = 1000, step = 10, value = 400),
                       sliderInput("ros2", "Second Component's Units", min = 0, max = 1000, step = 10, value = 200),
                       sliderInput("ros3", "Third Component's Units", min = 0, max = 1000, step = 10, value = 100),
                       sliderInput("ros4", "Fourth Component's Units", min = 0, max = 1000, step = 10, value = 50),
                       sliderInput("ros5", "Fifth Component's Units", min = 0, max = 1000, step = 10, value = 0)
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