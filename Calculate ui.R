calcpage <- 
  
  
  fluidPage(
    fluidRow(
        column(width = 4,
             wellPanel(class = "bw",
                       
                 #Input
                 div(class = "calc_header", "Setup"),
                 br(),
                 fluidRow(
                   column(width = 6,
                          radioButtons(input = "csv_or_sav", 
                                       label = "Choose a file format", 
                                       choices = c("csv", "sav"), selected = "csv")
                          ),
                   column(width = 6, 
                          fileInput("file","Upload a file", accept=c('.csv', '.sav')), 
                          )
                 ),
                 tags$hr(),
                 fluidRow(
                   column(width = 6, 
                          div(class = "cboxtitle", "Does the table have a header?"),
                          checkboxInput(inputId = 'header', label = 'Header', value = T),
                   ),
                   column(width = 6, 
                          radioButtons(inputId = 'sep', label = 'Separator', 
                                       choices = c(Comma=',',Semicolon=';',Tab='\t', Space=''), 
                                       selected = ',')

                   ),
                 ),
                 tags$hr(),
                 fluidRow(
                   column(width = 6, 
                          selectInput("col_choice", "Choose the column of interest", choices = "")
                          ),
                   column(width = 6,
                          div(class = "cboxtitle", "Remove negative values if found"),
                          checkboxInput("noneg", "Remove", value = F)
                          )
                 ),
                 fluidRow(
                   column(width = 6,
                          selectInput("chooseplot", "Choose the Plot",
                            choices = c("Cumulated Plot (Ascending)", 
                                        "Cumulated Plot (Descending)", 
                                        "Gini Index","Hoover Index", "Rosenbluth Index", 
                                        "Herfindahl-Hirschmann Index", 
                                        "Generalized Entropy Index", "Atkinson Index", 
                                        "Ratios")),
                          downloadButton("downplot", "Download the Plot")
                          ),
                   column(width = 6,
                          numericInput(inputId = 'rdigit', label = 'Round by _ Digits', 
                                       value = 3, min = 2, max = 5, step = 1),
                          downloadButton("downtable", "Download the Table")
                          
                   )
                 )

             ),
             wellPanel(class = "bw",
                       
                 #Plots
                 div(class = "calc_header", "Plots"),
                 br(),
                 fluidRow(
                   uiOutput("calc_graphs")
                 )
             )
        ),
        column(width =8,
          fluidRow(
            wellPanel(inputid = "tables-calcpage", class = "bw",
                      
                #Tables
                div(class = "calc_header", "Table"),
                br(),
                uiOutput("tb", style = "height:630px;", class = "sc_calc")
                      
            ),
            wellPanel(class = "bw",
                      
             fluidRow(
             
                #Metrics
                div(class = "calc_header metricsheader", "Measures"),
                br(),
                column(width = 3, 
                   h5(strong("Based on the Deviations Model")),
                   checkboxInput(inputId = 'showgini', label = 'Gini index', value = F),
                   checkboxInput(inputId = 'showcorrgini', label = 'Corrected Gini index', value = T),
                   checkboxInput(inputId = 'showrosen', label = 'Rosenbluth index', value = T),
                   checkboxInput(inputId = 'showhoover', label = 'Hooverindex', value = F),
                   checkboxInput(inputId = 'showcorrhoover', label = 'Corrected Hoover index', value = T)
                ),
                column(width = 3,
                   h5(strong("Based on the Combinatorics Model")),
                   checkboxInput(inputId = 'showhhi', label = 'Herfindahl-Hirschman index', value = T),
                   checkboxInput(inputId = 'showsim', label = 'Simpson index', value = T),
                   checkboxInput(inputId = 'showginisim', label = 'Gini-Simpson index', value = F),
                   checkboxInput(inputId = 'showinvsim', label = 'Inverse Simpson index', value = F)
                       
                ),
                column(width = 3,
                   h5(strong("Based on the Entropy Model")),
                   checkboxInput(inputId = 'showshalog2', label = 'Shannon (log2) index', value = T),
                   checkboxInput(inputId = 'showshaln', label = 'Shannon (ln) index', value = F),
                   checkboxInput(inputId = 'showshalog10', label = 'Shannon (log10) index', value = F),
                   checkboxInput(inputId = 'showge', label = 'Generalized Entropy index', value = T),
                   column(width = 12,
                          div(class = "special", id = 'geinum',
                            # selectInput( inputId = 'geinum', label = "alpha", choices = c(-2, -1, 0, 1, 2))
                            numericInput(inputId = 'geinum', label = 'alpha', 
                                         value = 3, min = -100, max = 100, step = 0.1)
                          )
                   )
                ),
                column(width = 3,
                   h5(strong("Based on the Social Welfare Model")),
                   checkboxInput(inputId = 'showatk', label = 'Atkinson index', value = T),
                   column(width = 12,
                          div(class = "special", id = 'atknum',
                            # selectInput(inputId = 'atknum', label = "epsilon", choices = c(0, 1, 2, 3))
                            numericInput(inputId = 'atknum', label = 'epsilon (must be \u2265 0)', 
                                         value = 2, min = 0, max = 100, step = 0.1)
                          )
                   ),
                   br(),
                   br(),
                   h5(strong("Tail Ratios")),
                   checkboxInput(inputId = 'showpalma', label = 'Palma', value = T),
                   checkboxInput(inputId = 'showquint', label = 'S20-S20', value = T),
                   checkboxInput(inputId = 'showdec', label = 'P90-P10', value = F),
                   checkboxInput(inputId = 'showten', label = 'P50-P10', value = F)
                ),
             
              br(),
              tags$hr(),
              br()
              ),
             
              fluidRow(
                column(width = 3,
                     conditionalPanel("input.showgini", valueBoxOutput(width = 12, "showgini")),
                     conditionalPanel("input.showcorrgini", valueBoxOutput(width = 12, "showcorrgini")),
                     conditionalPanel("input.showrosen", valueBoxOutput(width = 12, "showrosen")),
                     conditionalPanel("input.showhoover", valueBoxOutput(width = 12, "showhoover")),
                     conditionalPanel("input.showcorrhoover", valueBoxOutput(width = 12, "showcorrhoover"))
                     ),
                column(width = 3,
                     conditionalPanel("input.showhhi", valueBoxOutput(width = 12, "showhhi")),
                     conditionalPanel("input.showsim", valueBoxOutput(width = 12, "showsim")),
                     conditionalPanel("input.showginisim", valueBoxOutput(width = 12, "showginisim")),
                     conditionalPanel("input.showinvsim", valueBoxOutput(width = 12, "showinvsim"))
                ),
                column(width = 3,
                     conditionalPanel("input.showshalog2", valueBoxOutput(width = 12, "showshalog2")),
                     conditionalPanel("input.showshaln", valueBoxOutput(width = 12, "showshaln")),
                     conditionalPanel("input.showshalog10", valueBoxOutput(width = 12, "showshalog10")),
                     conditionalPanel("input.showge", valueBoxOutput(width = 12, "showge"))
                ),
                column(width = 3,
                     conditionalPanel("input.showatk", valueBoxOutput(width = 12, "showatk")),
                     conditionalPanel("input.showpalma", valueBoxOutput(width = 12, "showpalma")),
                     conditionalPanel("input.showquint", valueBoxOutput(width = 12, "showquint")),
                     conditionalPanel("input.showdec", valueBoxOutput(width = 12, "showdec")),
                     conditionalPanel("input.showten", valueBoxOutput(width = 12, "showten"))
                     
                  )
              )
            )
          )
          
        )
    ),
    tags$footer(foot),
  )
  



