calcpage <- 
  
  
  fluidPage(
    fluidRow(
      titlePanel("Calculate your Data"),
        column(width = 4,
                     wellPanel(style = "background: white",
                               tags$hr(),
                               h3(strong("Input")),
                               fileInput("file","Upload a CSV File"), # fileinput() function is used to get the file upload contorl option
                               tags$hr(),
                               fluidRow(
                                 column(width = 6, 
                                        radioButtons(inputId = "col_or_row", label = "Is the list of values in a column or in a row?",
                                                     choices = c(Column = T, Row = F), selected = T),
                                        tags$hr(),
                                        h5(strong("Does the table has a header?")),
                                        checkboxInput(inputId = 'header', label = 'Header', value = T),
                                        tags$hr()
                                 ),
                                 column(width = 6, 
                                        radioButtons(inputId = 'sep', label = 'Separator', 
                                                     choices = c(Comma=',',Semicolon=';',Tab='\t', Space=''), 
                                                     selected = ',')
                                 ),
                               ),
                               fluidRow(
                                 selectInput("col_choice", "Choose the column of Interest", choices = ""),
                                 selectInput("chooseplot", "Choose the Plot",
                                             choices = c("Cumulated Plot (Ascending)", "Cumulated Plot (Descending)", "Gini Index",
                                                         "Hoover Index", "Rosenbluth Index",
                                                         "Herfindahl-Hirschmann Index", "Ratios"))
                                 
                               )
                     ),
                     wellPanel(style = "background: white",
                               tags$hr(),
                               h3(strong("Plots")),
                               fluidRow(
                                 uiOutput("calc_graphs")
                               )
                     )
        ),
        column(width =8,
          fluidRow(
            wellPanel(inputid = "tables-calcpage", style = "background: white",
                      tags$hr(),
                      h3(strong("Tables")),
                      uiOutput("tb", style = "height:630px; overflow-y: scroll;overflow-x: scroll;")
                      #textOutput("texttext")
            ),
            wellPanel(style = "background: white",
                      fluidRow(
                        tags$hr(),
                        h3(strong("Metrics")),
                        column(width = 3, 
                               h5(strong("Deviants Indices")),
                               checkboxInput(inputId = 'showgini', label = 'Gini', value = T),
                               checkboxInput(inputId = 'showcorrgini', label = 'Corrected Gini', value = F),
                               checkboxInput(inputId = 'showhoover', label = 'Hoover', value = F),
                               checkboxInput(inputId = 'showcorrhoover', label = 'Corrected Hoover', value = F),
                               checkboxInput(inputId = 'showrosen', label = 'Rosenbluth', value = F)
                        ),
                        column(width = 3,
                               h5(strong("Combinatorics Indices")),
                               checkboxInput(inputId = 'showhhi', label = 'Herfindahl-Hirschmann', value = F),
                               checkboxInput(inputId = 'showsim', label = 'Simpson', value = F),
                               checkboxInput(inputId = 'showginisim', label = 'Gini-Simpson', value = F),
                               checkboxInput(inputId = 'showinvsim', label = 'Inverse Simpson', value = F)
                               
                        ),
                        column(width = 3,
                               h5(strong("Entropy Indices")),
                               checkboxInput(inputId = 'showshalog2', label = 'Shannon (log2)', value = F),
                               checkboxInput(inputId = 'showshaln', label = 'Shannon (ln)', value = F),
                               checkboxInput(inputId = 'showshalog10', label = 'Shannon (log10)', value = F),
                               checkboxInput(inputId = 'showge', label = 'Generalized Entropy', value = F),
                               br(),
                               h5(strong("Social welfare Indices")),
                               checkboxInput(inputId = 'showatk', label = 'Atkinson', value = F)
                        ),
                        column(width = 3,
                               h5(strong("Ratios")),
                               checkboxInput(inputId = 'showpalma', label = 'Palma', value = F),
                               checkboxInput(inputId = 'showquint', label = 'Quintile', value = F),
                               checkboxInput(inputId = 'showdec', label = 'Decile', value = F),
                               checkboxInput(inputId = 'showown', label = 'Own Ratio', value = F)
                        )
                      ),
                      br(),
                      tags$hr(),
                      br(),
                      # fluidRow(
                      #   column(width = 3, 
                      #          h4(strong("Indices")),
                      #          box(id = "ginibox", title = "Gini Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_gini")))),
                      #          tags$hr(),
                      #          box(title = "Hoover Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_hoover")))),
                      #          box(title = "Rosenbluth Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_ros")))),
                      #          box(title = "Herfindahl-Hirschmann Index", status = 'warning', width = 12, h4(strong(textOutput("metrics_hhi"))))
                      # 
                      #   ),
                      #   column(width = 3, 
                      #          h4(strong("Ratios")),
                      #          box(title = "Palma Ratio (10:40)", width = 12, status = 'warning', h4(strong(textOutput("metrics_palma")))),
                      #          box(title = "Quintile Ratio (20:20)", width = 12, status = 'warning', h4(strong(textOutput("metrics_quint")))),
                      #          box(title = "Decile Ratio (10:10)", width = 12, status = 'warning', h4(strong(textOutput("metrics_dec")))),
                      #          box(title = "Own Ratio", width = 12, status = 'warning', h4(strong(textOutput("metrics_own"))),
                      #              column(width = 12, numericInput("topcalc", "Compare Top _%", min = 1, max = 50, value = 5)),
                      #              column(width = 12, numericInput("bottomcalc", "with Bottom _%", min = 1, max = 99, value = 30)),
                      #              actionButton("actioncalc", "Apply")
                      #          )
                      #   ),
                      #   column(width = 3, 
                      #          h4(strong("Entropy Indices")),
                      #          box(title = "Generalized Entropy Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_gei"))), br(),
                      #              sliderInput("gei_a_slider", "Set Alpha Value", min = 0, max = 3, step = 0.1, value = 0.5)),
                      #          box(title = "Atkinson Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_atk"))), br(),
                      #              sliderInput("atk_e_slider", "Set Epsilon Value", min = 0, max = 3, step = 0.1, value = 0.5))
                      #   ),
                      #   column(width = 3,
                      #          h4(strong("Diversity Indices")),
                      #          conditionalPanel("input.showsim",
                      #          box(title = "Simpson Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_sim"))))
                      #          ),
                      #          box(title = "Inverted Simpson Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_invsim")))),
                      #          box(title = "Shannon Index", width = 12, status = 'warning', h4(strong(textOutput("metrics_sha")))),
                      #          box(title = "Renyi Entropy", width = 12, status = 'warning', h4(strong(textOutput("metrics_renyi"))), br(),
                      #              sliderInput("renyi_a_slider", "Set Alpha Value", min = 0.01, max = 3, step = 0.1, value = 0.5))
                      #   )
                      #   
                      # )

                      fluidRow(
                          conditionalPanel("input.showgini", valueBoxOutput(width = 3, "showgini")),
                          conditionalPanel("input.showcorrgini", valueBoxOutput(width = 3, "showcorrgini")),
                          conditionalPanel("input.showhoover", valueBoxOutput(width = 3, "showhoover")),
                          conditionalPanel("input.showcorrhoover", valueBoxOutput(width = 3, "showcorrhoover")),
                          conditionalPanel("input.showrosen", valueBoxOutput(width = 3, "showrosen")),
                          conditionalPanel("input.showhhi", valueBoxOutput(width = 3, "showhhi")),
                          conditionalPanel("input.showsim", valueBoxOutput(width = 3, "showsim")),
                          conditionalPanel("input.showginisim", valueBoxOutput(width = 3, "showginisim")),
                          conditionalPanel("input.showinvsim", valueBoxOutput(width = 3, "showinvsim")),
                          conditionalPanel("input.showshalog2", valueBoxOutput(width = 3, "showshalog2")),
                          conditionalPanel("input.showshaln", valueBoxOutput(width = 3, "showshaln")),
                          conditionalPanel("input.showinvshalog10", valueBoxOutput(width = 3, "showlog10")),
                          conditionalPanel("input.showge", valueBoxOutput(width = 3, "showge")),
                          conditionalPanel("input.showatk", valueBoxOutput(width = 3, "showatk")),
                          conditionalPanel("input.showpalma", valueBoxOutput(width = 3, "showpalma")),
                          conditionalPanel("input.showquint", valueBoxOutput(width =3, "showquint")),
                          conditionalPanel("input.showdec", valueBoxOutput(width = 3, "showdec"))
                          
                      )
                      
                      
                     
            )
          )
          
        )
    )
  )
  



