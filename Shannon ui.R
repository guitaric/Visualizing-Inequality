shannonpage <-
  
  fluidPage(
    fluidRow(
      column(width = 8,
         wellPanel(class = "bw texts",
           div(class = "metric_header", "Shannon Index"),
           div(class = "metric_text",
               p("The Shannon index, also misleadingly referred to as Shannon-Wiener index (Strong, 2016) or Shannon-Weaver index (Arias-González et al., 2012), is based on the idea of physical entropy and was originally devised to determine the information content of a message, e.g., different letters in a text (Shannon, 1948; Shannon & Weaver, 1949; Spellerberg & Fedor, 2003), but was also utilized to examine the biodiversity of species in an ecosystem (Spellerberg & Fedor, 2003). It is also known as a measure of uncertainty, because it relates the uncertainty of an event to the gain of the information received. The maximum amount of information is gained when the certainty of a given unit is minimal, namely at 0.5 or 50% for a dichotomous outcome (yes, no). The more certain the occurrence of the next unit becomes, whether it is more likely or less likely, the lower the information content. Data on a nominal level of measurement are used for the Shannon index."),
               p("Owing to its roots in information theory, the convention is to use the logarithm dualis (log2) for the computation of the Shannon index. However, also other logarithms can be utilized, such as the natural logarithm (ln) or the logarithm to the base 10 (log10)."),
               p("The Shannon index can be interpreted as the average number of \u0022yes/no\u0022-questions that must be asked to determine to which component a randomly selected unit of the distribution belongs to (for log2). For example, a string consisting only of \u0027A\u0027s would result in a Shannon index of 0 because every letter is an \u0027A\u0027. The \u0027event\u0027 of having an \u0027A\u0027 on every position is 100%. In contrast, a string with evenly distributed letters like \u0027ABCD\u0027 would result in a Shannon index of 2, because two questions would be sufficient to determine each letter (i.e., question 1: \u0022AB or CD?\u0022; question 2: \u0022A or B?\u0022 or, equivalently, \u0022C or D?\u0022). Doubling each letter (AABBCCDD) would result in the same Shannon index as \u0027ABCD\u0027. Null entries are ignored by the formula."),
               p("The index is calculated by first computing the logarithm of the shares of all components present in the data, multiplying the calculated results with their respective shares, and finally summing all these products.")

           ),
               br(),
               hr(),
               br(),
           div(class = "instructions",
               p("On the right side, you can create a string of letters, which will be used to calculate a Shannon index 
                 with the logarithm of your choice. In addition to the indices, a worktable will be shown that makes the 
                 calculation process comprehensible. Adding up all entries of the most right column results in the Shannon 
                 index with the logarithm of your choice."),
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