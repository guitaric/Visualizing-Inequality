ratiopage <- 
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw texts",
                 div(class = "metric_header", "Ratios"),
                 div(class = "metric_text",
                     p("Another way to capture the degree of inequality is by comparing the share of the two tail sections of the distribution. This is one of the simplest ways to measure inequality but ignores the middle section of the distribution. A widely known ratio, the Palma ratio (Cobham, 2014; United Nations, 2019) is often used to assess the distribution of the gross national income in a country. It is simply the ratio between the unit share of 10% of the top-earners divided by the unit share of 40% of lowest earners. In practice, the Palma Ratio in Europe tends to vary between 0.8 and 1.8 (OECD, 2011). A Palma Ratio of 1.8 indicates that the top 10% have 1.8-times as much income as the bottom 40%."),
                     p("Another ratio called S80:S20 compares the share of the richest fifth with the share of the poorest fifth of the population."),
                     p("Moreover, percentile ratios compare specific percentiles of a distribution. The P90:P10 Ratio compares the value at the 90th percentile with the value at the 10th percentile. Similarly, the P50:P10 relates the median value with the 10th percentile.")
                 ),
                     br(),
                     hr(),
                     br(),
                 div(class = "instructions",
                     p("On the right side you can choose between different sample data from the real world. 
                       Besides the common application to financial topics, other areas of application can be
                       considered. E.g. you can compare the suicide rate, the Intentional homicide rate or use 
                       the all-time medal table of the Olympic Games of all countries for the visualization."),
                     p("After choosing the data, you can see the four different Ratios in a bar chart. You can 
                       also create your own ratio by setting the \u0027Top _ %\u0027 and the \u0027Bottom _ %\u0027 you want to relate to each other. "),
                     br(),
                     br()
                 )

             )
      ),
    column(width = 4, 
           wellPanel(class = "bw",
               div(class = "inter_header", "Select the dataset"),
               selectInput("ratiodata","", 
                           choices =c('Total Income after Tax, United Kingdom (2018)',
                                      'GDP of all countries (2017)',
                                      'Suicide Rates of all countries per 100.000 population (2016)',
                                      'Intentional homicide rates per 100.000 (latest available)',
                                      'All-time Olympic Games Medal Table')),
               tags$hr(),
               numericInput("top", "Compare Top _%", min = 1, max = 50, value = 5),
               numericInput("bottom", "with Bottom _%", min = 1, max = 99, value = 30),
               actionButton("action", "Apply")
           ),
           wellPanel(class = "bw",
                fluidRow(
                     valueBoxOutput(width = 6, "palma_ratio"),
                     valueBoxOutput(width = 6, "quintile_ratio"),
                     valueBoxOutput(width = 6, "decile_ratio"),
                     valueBoxOutput(width = 6, "tenfifty_ratio"),
                     valueBoxOutput(width = 12, "own_ratio")
                )
           ),
           box(title = "Ratios", width = 12, solidHeader = T, plotOutput("ratio_out1"))
    )
    
  ),
  tags$footer(foot)
)
