geipage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
             wellPanel(class = "bw texts",
                       div(class = "metric_header", "Generalized Entropy Index"),
                       div(class = "metric_text",
                           p("The generalized entropy index (Shorrocks, 1980) provides a generalization of the Shannon index for metric variables and contains as special cases the Theil index and the mean log deviation. The generalized entropy index compares the number of units of each individual component to the mean of all components and quantifies the distance between the highest possible entropy (i.e., the uniform distribution of units over components) and the observed entropy. It thus measures inequality (in the sense of redundancy), rather than equality (such as the Shannon index)."),
                           p("The unique characteristic of the generalized entropy index lies in its parameter \u03B1. Setting \u03B1 = 1 yields the Theil index (Theil, 1967). Setting \u03B1 = 0 yields the mean log deviation (i.e., the average of the deviations of the log units to their log mean; Theil, 1967). More generally, the value of \u03B1 fine-tunes the generalized entropy index to specified ranges of the unit distribution with regards to the effects of hypothetical unit transfers. That is, the more positive \u03B1, the more sensitive the index is to inequality at the high range of the distribution; conversely, the more negative \u03B1, the more sensitive it is to inequalities occurring at the low range of the distribution. Thus, the Theil index is more sensitive to inequalities at the high range of the distribution than the mean log deviation."),
                           p("to inequalities at the high range of the distribution than the mean log deviation. 
The generalized entropy index provides a convenient way to differentially weigh inequality at (and, in a way, to \u0022zoom into\u0022) the high vs. low ranges of the unit distribution. Consequently, it allows for a more fine-grained inspection of inequality than merely area-based measures (such as the Gini index) are capable of.")
                   ),
                   br(),
                   hr(),
                   br(),
               div(class = "instructions",
                   p("Choose one of the eight sample distributions. The generalized entropy indices for all \u03B1 values between -4 and 4 (in 0.5 steps) are displayed in the bar plot. Additionally, you can select specific α values with the slider to compute the corresponding generalized entropy index."),
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
                 box(title = "The Generalized Entropy Index for different values of alpha", 
                     width = 12, solidHeader = T, plotOutput("gei_plot"))
                 )
             ),
             wellPanel(class = "bw",  
                 fluidRow(
                   sliderInput("gei1", "Choose Alpha", min = -4, max = 4, step = 0.25, value = 1)
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




