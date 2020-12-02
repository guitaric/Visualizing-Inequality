#-------------------------------Introduction
intropage <- 
  
  fluidPage(
    fluidRow(
      wellPanel(class = "bw texts",
        fluidRow(
          h1(tags$strong("Visualizing Inequality"), style = "margin-bottom: 2", align = 'center'),
          br(),
          br(),
          div(class = "metric_header", "Theoretical Background"),
          div(class = "metric_text intro_text",
              p("Wherever a good is distributed among persons, group of persons or even whole countries, inequality often emerges. Inequality is present, whenever there is no equal distribution of a good or a unit. If a good is highly concentrated on one or few entities of the examined population, this results in a higher inequality of the good among all entities of the population."),
              p("Measuring inequality is important in many fields of research, including economics, political and social sciences, information theory and (bio)diversity. A well-known application field is the measurement of inequality of monetary goods, such as income or capital for individuals or households (Cobham & Sumner, 2014; OECD, 2011). Moreover, inequality can be estimated for companies or (political) parties in systems, e.g., votes in elections or monopolies in markets (Fedderke & Szalontai, 2009; Wagschal, 1999), and for the diversity of groups or species in sociology or biology (Hill, 1973; Jost, 2006)."),
              p("However, the estimation of inequality of distributions in psychological research and applications seems to be unused so far. Nevertheless, in addition to commonly used specific values, e.g., mean, variance, and standard deviation, inequality measures could be very helpful for descriptive analysis of diverse psychological applications, too. In cognitive psychology and biological psychology, inequality measures could be applied to estimate the inequality of response or reaction times. In differential psychology, the inequality of personality traits could be calculated. In social psychology, the segregation of groups could be analyzed and in clinical psychology and epidemiology, the distribution of diagnoses of mental disorders over the year could be measured (Lee, 1996).")
          ),
          br(),
          div(class = "metric_header", "Inequality measures"),
          div(class = "metric_text intro_text",
              p("Inequality measures are statistical instruments to quantify the degree of inequality of distributed units in a given population. There is a wide range of measures that differ in the way of quantifying inequality or in the scope of application. There are inequality measures that reflect either the distribution as a whole and others that refer only to parts of a distribution such as the tails or that emphasize certain sections of the distribution by utilizing additional parameters. "),
              p("In the literature, many terms are used interchangeably to describe the distributed feature and the groupings, across which the feature is distributed. Oriented on the definition by Coulter (1989), in the following, the most abstract and general term \u0027units\u0027 will be used for the feature that is distributed, and \u0027components\u0027 for the groupings under which the units are distributed. Accordingly, components can be individuals, groups, countries, species, letters, political parties, for example. Units or the share of a unit, for instance, may be capital, income and votes. Hence, a person can represent a component that carries the unit income, a company can be a component that has a share of the unit market and a species is a component that has a share of the unit ecosystem."),
              p("The literature differentiates between relative inequality and absolute inequality. Bleym\u00fcller et al. (1996) refer to absolute inequality when a large share of the units is distributed among a small number of components, and to relative inequality when a large share of the units is distributed among a small share of components, i.e., the number of components is relevant for absolute inequality measures, whereas it is insignificant for the calculation of relative inequality. For example, in terms of an absolute inequality perspective, the inequality of distribution A = (360, 250, 150) would be double in comparison to a distribution B = (180, 180, 125, 125, 75, 75), whereas relative inequality measures for distribution A and B would show the same result."),
              p("Measures can be bounded, that is, limited to a range of values (for all discussed bounded measures between 0 and 1) or unbounded, with the range of possible values going to infinity in at least one direction."),
              p("Moreover, measures can be distinguished by their polarity. Depending on how the minimum and maximum is defined, the measures can express either inequality or equality. When a measure is properly bounded so that its boundaries range from 0 to 1, its polarity can be converted by subtracting it from 1.")
          ), 
              br(),
              hr(class = "hr_intro"),
              br(),
          div(class = "metric_text intro_text",
            
              p("This Shiny App provides an integrational work to collect the most common inequality metric used in science and statistics."),
              br(),
              p("Three main concerns led to the creation of the app:"),
              tags$ol(
                 tags$li("Provide user-friendly and easy to understand visualizations and representations of the most common 
                         inequality metrics with help of interactive Plots and Tables"),
                 tags$li("Explain the metrics\u0027 basic functionality and clarify differences among the metrics."),
                 tags$li("Create a tool to calculate and visualize inequality of own datasets ")
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
            tags$ul("Indices of Deviation:",
                    br(),
                    br(),
                    tags$li("Gini index"),
                    tags$li("Rosenbluth index"),
                    tags$li("Hoover index")
            ),
            tags$ul("Indices of Combinatorics:",
                    br(),
                    br(),
                    tags$li("Herfindahl-Hirschmann index"),
                    tags$li("Simpson index"),
                    tags$li("Hoover index")
            ),
            tags$ul("Indices of Entropy:",
                    br(),
                    br(),
                    tags$li("Shannon entropy"),
                    tags$li("Generalized entropy index")
            ),
            tags$ul("Indices of Social Welfare:",
                    br(),
                    br(),
                    tags$li("Atkinson index")
            ),
            tags$ul("Ratios:",
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
