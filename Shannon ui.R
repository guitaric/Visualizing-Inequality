shannonpage <-
  
  fluidPage(
    fluidRow(
      column(width = 7,
             h3(tags$b("Shannon Index")),
             h4("The Shannon Index was originally used to calculate the information stored in a given string of letters or numbers XXX. 
                Later on, it was used for various scope of applications, such as XXX, XXX, XXX. 
                It is also referred as a Measure of uncertainty because it relates the uncertainty of an event to the gain of obtained information. 
                The maximum of information is gained, when the certainty of the next letter is minimal, namely at 0.5. 
                The more the appearance of the next letter gets more certain as well as more uncertain, the higher the information loss is. 
                Having the origins in the information theory the logarithm used in the formula is the logarithm dualis but every other logarithm can be substituted, 
                such as the natural logarithm or the 10 logarithm."),
             br(),
             br(),
             h3(tags$b("Renyi Entropy")),
             h4("The effect on the Simpson Index can be observed, by playing with the Inputs on the left side.
                This Index is sensitive to the absolute Amount of groupmembers. If there is only one individual for each species,
                the probability of choosing 2 individuals of the same species is 0, while it is higher than zero when having 2 individuals per species.
                Also the so called richness infuences the Index. The more groups there are to compare the lower is the probability of choosing two of
                the same kind")
      ),
      column(width = 1),
      column(width = 4,
             wellPanel(style = "background: white",
                       column(width = 6,
                              tags$hr(),
                              h4(tags$b("Build a String")),
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
                              selectInput("logtype", "Choose Log Type", choices = c('log 2', 'log nat', 'log 10'), selected = 'log 2')
                       ),
                       br(),
                       h3(strong(textOutput("shannontext"))),
                       textOutput("texttest"),
                       textOutput("testing"),
                       br(),
                       br(),
                       tags$hr(),
                       tableOutput("shannontable")
             ),
             valueBoxOutput(width = 4, "sha_indexlog2"),
             valueBoxOutput(width = 4, "sha_indexln"),
             valueBoxOutput(width = 4, "sha_indexlog10")
             
             
      )
    )
  )