

simpsonpage <-
  
  fluidPage(
    fluidRow(
      column(width = 7,
             h3(strong("Simpson Index")),
             h4("The Simpson Index belongs to the group of diversity metrics and is mostly used in biology to describe diversity among species.
             The range is between 0 and 1 with 0 as equivalent to the highest degreee of diversity and 1 with no diversity at all.
             The interpretation of the Simpson Index is straightforward. The Index can be understood as the percentage that two randomly 
             chosen individuals belong to the same species.
                "),
             br(),
             br(),
             h4("The effect on the Simpson Index can be observed, by playing with the Inputs on the left side.
                This Index is sensitive to the absolute Amount of groupmembers. If there is only one individual for each species,
                the probability of choosing 2 individuals of the same species is 0, while it is higher than zero when having 2 individuals per species.
                Also the so called richness infuences the Index. The more groups there are to compare the lower is the probability of choosing two of 
                the same kind")
      ),
      column(width = 1),
      column(width = 4,
             wellPanel(style = "background: white",
                       fluidRow(
                         h4(strong("Put in some values")),
                         column(width = 6, 
                                textInput("group1", "First  Species", value = "goldfinch"),
                                textInput("group2", "Second Species", value = "sparrow"),
                                textInput("group3", "Third Species", value = "bullfinch"),
                                textInput("group3", "Fourth Species", value = ""),
                                textInput("group3", "Fifth Species", value = "")
                         ),
                         column(width = 6, 
                                numericInput("sim_nr1", "Count", value = 6, min = 0, max = 10),
                                numericInput("sim_nr2", "Count", value = 5, min = 0, max = 10),
                                numericInput("sim_nr3", "Count", value = 3, min = 0, max = 10),
                                numericInput("sim_nr4", "Count", value = 0, min = 0, max = 10),
                                numericInput("sim_nr5", "Count", value = 0, min = 0, max = 10)
                                
                         )
                       )
             ),
             box(title = "Groups", width = 12, solidHeader = T, plotOutput("simpsonout")),
             valueBoxOutput(width = 4, "sim_index"),
             valueBoxOutput(width = 4, "ginisim_index"),
             valueBoxOutput(width = 4, "invsim_index")
             
             
      )
    )
  )