geipage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw texts",
                       div(class = "metric_header", "Generalized Entropy Index"),
                       div(class = "metric_text",
                           p("The generalized entropy also uses the logarithm to assess the inequality of a distribution (Cowell, 2011). The unique characteristic of this index lies in its additional parameter alpha. This parameter allows to finetune the sensitivity of the index to a specified area of interest. The range of the alpha parameter is [-\u221e, +\u221e]. The higher alpha, i.e., the more positive, the more sensitive is the index at the high (or rich) part of the distribution. Conversely, the lower alpha, i.e., the more negative, the more sensitive is the index at the low part of the distribution. Notably, the generalized entropy index with alpha = 0 corresponds to the mean log deviation and with alpha = 1 to the Theil index (Cowell, 2011).")
                   ),
                   br(),
                   hr(),
                   br(),
               div(class = "instructions",
                   p("By choosing one of the sample distributions, the generalized entropy indices for all alphas 
                     between -4 and 4 (in 0.5 steps) are displayed in the bar plot. Additionally, you can set 
                     the slider on specific parameter values to have the exact generalized entropy index."),
                   br(),
                   br()
               )
             )
      ),
      column(width = 4,
             wellPanel(class = "bw",
               div(class = "inter_header", "Choose a distribution"),
               fluidRow(
                 selectInput("selectdist_ent", "", c("A: 110, 120, 130, 140, 150, 500", "B: 100, 210, 220, 230, 240, 250", "C: 200, 200, 200, 200, 200, 200, 200", "D: 110, 110, 120, 120, 130, 130, 140, 140, 150, 150, 500, 500", "E: 100, 100, 210, 210, 220, 220, 230, 230, 240, 240, 250, 250", "F: 100, 1100, 1200, 1300, 1400, 1500", "G: 220, 240, 260, 280, 1000", "H: 200, 420, 440, 460, 480, 500")),
                 hr(),
                 box(title = "How the Parameter alpha is affecting the Generalized Entropy Index", 
                     width = 12, solidHeader = T, plotOutput("gei_plot"))
                 )
             ),
             wellPanel(class = "bw",  
                 fluidRow(
                   sliderInput("gei1", "Choose Alpha", min = 0, max = 2, step = 0.25, value = 1)
                 )
                       
             ),
             wellPanel(style = "background: white",
                 fluidRow(
                   valueBoxOutput(width = 12, "gei_index")
                 )
             )
      )
    ),
    tags$footer(foot)
  )




