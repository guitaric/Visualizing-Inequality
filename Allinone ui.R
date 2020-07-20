
allinonepage <- 
  
  fluidPage(
    h3(tags$b("At one Glance")),
    sidebarPanel(
      fluidRow(
        valueBoxOutput(width = 4, "gini_box"),
        valueBoxOutput(width = 4, "corrgini_box"),
        valueBoxOutput(width = 4, "rosen_box"),
        valueBoxOutput(width = 4, "hoover_box"),
        valueBoxOutput(width = 4, "corrhoover_box"),
        valueBoxOutput(width = 4, "hhi_box")
      )
    ),
    mainPanel(
      wellPanel(style = "background: white",
                fluidRow(
                  selectInput("selectdist", "Sample Distributions",
                              choices = c("A: 1000, 0, 0, 0, 0", "B: 360, 300, 200, 80, 60", "C: 200, 200, 200, 200, 200", 
                                          "D: 500, 140, 130, 120, 110", "E: 1000, 280, 260, 240, 220", "F: 180, 180, 150, 150, 100, 100, 40, 30", 
                                          "G: 100, 100, 100, 100, 100, 100, 100, 100, 100, 100", "H: 199, 199, 199, 199, 199, 1, 1, 1, 1, 1") ),
                  box(title = "Gini Index", solidHeader = T, width = 6, plotOutput("allind_gini")),
                  box(title = "Rosenbluth Index", solidHeader = T, width = 6, plotOutput("allind_rosen")),
                  box(title = "Hoover Index", solidHeader = T, width = 6, plotOutput("allind_hoover")),
                  box(title = "Herfindahl-Hischmann Index", solidHeader = T, width = 6, plotOutput("allind_hhi"))
                )
                
                
      )
      
      
    )
    
  )