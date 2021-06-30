shannonpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
           div(class = "metric_header", "Shannon Index"),
           div(class = "metric_text",
               p("The Shannon index (Shannon, 1948; Shannon & Weaver, 1949) relates the uncertainty of an event to the gain of the received information. It is intended for categorical variables and is a measure of equality. A maximum of information is gained when the certainty of a given unit is minimal, namely those observed with a probability of 0.5 (or proportion of 50%) for dichotomous (yes vs. no) outcomes. The more certain the occurrence of the next unit (regardless of whether it is highly likely or highly unlikely), the lower the respective information content. Distributions with more components, or with components having more evenly distributed units, carry a higher total information content than distributions with less evenly distributed units or, at the extreme, only one component."),
               p("Owing to its roots in information theory, the binary logarithm (log2) is commonly used for the calculation of the Shannon index. However, using other logarithmic bases is also feasible, such as the natural logarithm (ln) or the logarithm to the base of 10 (log10). For log2, the Shannon index can be interpreted as the average number of yes/no-questions that must be asked to determine to which component a randomly selected unit of the distribution belongs to. For example, a string consisting only of \u0027A\u0027s would result in a Shannon index of 0 because, trivially, every letter is an \u0027A\u0027. The event of having an \u0027A\u0027 on every position is 100% sure. In contrast, a string with evenly distributed letters like \u0027ABCD\u0027 would result in a Shannon index of 2, because two questions would be sufficient to determine each letter (namely, the first question being: \u0022AB or CD?\u0022; and the second question being: “A or B?” or, equivalently, \u0022C or D?\u0022). Duplicating each letter (\u0027AABBCCDD\u0027) would result in the same Shannon index as for the string \u0027ABCD\u0027. Null entries are ignored. The Shannon index has a lower bound of 0 and an upper bound determined by the respective logarithm (whichever is used) of k (the number of components, i.e., categories)."),

           ),
           
               br(),
               hr(),
               br(),
           div(class = "instructions",
               p("On the right side, you can create a string of letters, which will be used to calculate the Shannon index with the logarithm of your choice. In addition to the indices, a worktable is shown that illustrates the calculation process. Adding up all entries of the rightmost column results in the Shannon index with the logarithm of your choice."),
               br(),
               br()
           )
         )
      ),
      column(width = 4,
             wellPanel(class = "bw",
               div(class = "inter_header", "Create a string"),
               column(width = 6,
                      actionButton("abutton", "A"),
                      actionButton("bbutton", "B"),
                      actionButton("cbutton", "C"),
                      actionButton("dbutton", "D"),
                      actionButton("ebutton", "E"),
                      actionButton("fbutton", "F"),
                      actionButton("returnbutton", "Return"),
                      actionButton("clearbutton", "Clear Text")
               ),
               column(width = 6,
                      selectInput("logtype", "Choose Log Type", 
                                  choices = c('log 2', 'log nat', 'log 10'), selected = 'log 2')
               ),
               br(),
               br(),
               br(),
               textOutput("texttest"),
               h3(strong(textOutput("shannontext"))),
               tags$hr(),
               wellPanel(class = "sc_x", 
                  tableOutput("shannontable")
               ),
             ),
             wellPanel(class = "bw",
                 fluidRow(
                   valueBoxOutput(width = 4, "sha_indexlog2"),
                   valueBoxOutput(width = 4, "sha_indexln"),
                   valueBoxOutput(width = 4, "sha_indexlog10")
                 )
             )
      )
    ),
    tags$footer(foot)
  )