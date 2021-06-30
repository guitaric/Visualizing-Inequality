ratiopage <- 
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw texts",
                 div(class = "metric_header", "Ratios"),
                 div(class = "metric_text",
                     p("One of the simplest ways to measure inequality is to compare the shares of the two tail sections of the unit distribution exclusively, while ignoring its middle section. This provides measures of inequality which are specifically sensitive to any differences located in the distributional tails (Voracek et al., 2013) and more informative of the shape of the unit distribution than mere measures of area, like the Gini index. Distributional tail ratios are intended for metric variables. When the number of components is small, they should be interpreted with caution, because of possible effects due to rounding errors (e.g., imagine estimating the richest 20% based on merely three components)."),
                     p("The Palma ratio (Palma, 2011) is widely used to assess gross national income distributions. It is the ratio of the unit shares of the top 10% to the bottom 40% of the unit distribution. Applied to the gross national income, the Palma ratio tends to vary between 0.8 and 1.8 across Europe (OECD, 2011). A value of 1.8 indicates that the top 10% possess 1.8 times the units that the bottom 40% do. The S80:S20 ratio compares the share of the top fifth with the share of the bottom fifth of the unit distribution. It follows the logic of the Pareto distribution (Pareto, 1896) and its associated Pareto principle (known as the 80-to-20 rule, or the principle of factor sparsity: for many real-world phenomena, about 80% of effects or consequences have been observed to be due to about 20% of the causes or sources). Percentile ratios compare selected percentiles of the unit distribution. The P90:P10 ratio compares the 90th percentile with the 10th percentile, whereas the P50:P10 relates the median (50th percentile) to the 10th percentile.")
                 ),
                 
                     br(),
                     hr(),
                     br(),
                 div(class = "instructions",
                     p("Choose one of the five real-world sample data. The data pertain to UK income tax (Government Digital Service United Kingdom, 2020), global GDP (United Nations, 2019a), global suicide rates (per 100,000; WHO, 2018), global intentional homicide rates (per 100,000; United Nations, 2019b), and all-time medal table of the Olympic Games of all countries (International Olympic Committee, 2018) for visualization."),
                     p("After choosing the data, three of the ratios are presented in a bar chart. You can also create your own ratio by setting the 'Top _ %' and the 'Bottom _ %' you want to relate to each other."),
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
