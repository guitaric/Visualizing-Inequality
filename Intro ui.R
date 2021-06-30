#-------------------------------Introduction
intropage <- 
  
  fluidPage(
    fluidRow(
      wellPanel(class = "bw texts",
        fluidRow(
          h1(tags$strong("Visualizing Inequality"), style = "margin-bottom: 2", align = 'center'),
          br(),
          br(),
          
          div(class = "metric_header", "Introduction:"),
          
          div(class = "metric_text intro_text",
              p("This is the companion Shiny app to: Tran, U. S., Lallai, T., Gyimesi, M., Baliko, J., Ramazanova, D., & Voracek, M. (2021). Harnessing the fifth element of distributional statistics for psychological science: A practical primer and Shiny app for measures of statistical inequality and concentration."),
              p("Please cite this study when referring to this Shiny app."),
              p("Together with the practical primer, this Shiny app intends to introduce to psychological science the family of statistical measures of inequality and concentration (for simplicity, inequality measures). Measures of inequality have been developed since the early 20th century (for a historical review, see Piesch, 1975) and are important in many fields of research, including economics, political science and the social sciences, information theory, and biodiversity (biology and ecology), to name but a few (Allison, 1981; Bruckmann, 1969; Kr\u00E4mer, 1998; Magurran, 1988; M\u00FCnzner, 1963; Pielou, 1969). Yet, up to now, measures of inequality evidently are less well\u002Dknown, and certainly less used, in psychological science."),
              p("This Shiny app provides an integrational framework for the calculation and visualization of popular measures of inequality, with downloadable output. Covered are (1) the Gini index, the Hoover index, and the Rosenbluth index; (2) the Herfindahl-Hirschman index and the Simpson index, alongside its associated measures Gini-Simpson index and inverse Simpson index; (3) Shannon entropy and the generalized entropy index, including the Theil index; and (4) the Atkinson index. This ensemble of measures is based on four different mathematical models (namely, in above order of (1) to (4), the deviations model, the combinatorics model, the entropy model, and the social welfare model; Coulter, 1989), which also structure this Shiny app. (5) In addition, this Shiny app also covers distributional tail ratios; these further related approaches are not based on any of these four models (for background and overview, see Voracek et al., 2013).")
          ),
          
          
          
              br(),
              hr(class = "hr_intro"),
              br(),
          div(class = "metric_text intro_text",

              p("This Shiny app intends to serve the triple aim of:"),
              tags$ol(
                 tags$li("Calling attention to these methods and approaches."),
                 tags$li("Providing a convenient means for calculating these measures."),
                 tags$li("Helping users to better understand and learn about statistical measures of inequality through interactive visualizations.")
              ),
              br()

          )
        )
      )
    ),
    wellPanel(class = "bw texts intro_ul",
      div(id = "included", "Measures covered in this app"),
      br(),
          splitLayout(
            tags$ul("Based on the Deviations Model",
                    br(),
                    br(),
                    tags$li("Gini index"),
                    tags$li("Rosenbluth index"),
                    tags$li("Hoover index")
            ),
            tags$ul("Based on the Combinatorics Model",
                    br(),
                    br(),
                    tags$li("Herfindahl-Hirschman index"),
                    tags$li("Simpson index"),
                    tags$li("Hoover index")
            ),
            tags$ul("Based on the Entropy Model",
                    br(),
                    br(),
                    tags$li("Shannon entropy"),
                    tags$li("Generalized entropy index")
            ),
            tags$ul("Based on the Social Welfare Model",
                    br(),
                    br(),
                    tags$li("Atkinson index")
            ),
            tags$ul("Tail Ratios",
                    br(),
                    br(),
                    tags$li("Palma ratio"),
                    tags$li("S80:S20 ratio"),
                    tags$li("P90:P10 ratio"),
                    tags$li("P50:P10 ratio")
            )
          )
          
    ),
    tags$footer(foot)
  )


