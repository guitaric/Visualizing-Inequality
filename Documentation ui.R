
docpage <- 
  
  fluidPage(
    fluidRow(
      wellPanel(class = "bw",
          div(class = "metric_header", id = "title_ref", "References"),
          div(class = "references",
            br(),
            tags$ul(
              tags$li("Arias-Gonz\u00e1lez, J. E., Acosta-Gonz\u00e1lez, G., Membrillo, N., Garza-P\u00e9rez, J. R., & Castro-P\u00e9rez, J. M. (2012). Predicting spatially explicit coral reef fish abundance, richness and Shannon\u002dWeaver index from habitat characteristics. Biodiversity and Conservation, 21(1), 115-130. doi: 10.1007/s10531-011-0169-y"),
              tags$li("Assenmacher, W. (2010). Deskriptive Statistik. (4th ed.). Berlin: Springer."),
              tags$li("Atkinson, A. B. (1970). On the measurement of inequality. Journal of economic theory, 2(3), 244-263."),
              tags$li("Atkinson, A. (1987). On the Measurement of Poverty. Econometrica, 55(4), 749-764. doi: 10.2307/1911028"),
              tags$li("Atkinson, A. (2008). More on the measurement of inequality. The Journal of Economic Inequality, 6(3), 277-283. doi: 10.1007/s10888-007-9075-7"),
              tags$li("Bleym\u00fcller, J., Gehlert, G., & G\u00fclicher, H. (1996). Statistik f\u00fcr Wirtschaftswissenschaftler. (10th ed.). M\u00fcnchen: Verlag Franz Vahlen Gmbh."),
              tags$li("Ceriani, L., & Verme, P. (2012). The origins of the Gini index: Extracts from Variabilit\u00e0 e Mutabilit\u00e0 (1912) by Corrado Gini. The Journal of Economic Inequality, 10(3), 421-443. doi: 10.1007/s10888-011-9188-x"),
              tags$li("Cobham, A., & Sumner, A. (2014). Is inequality all about the tails? The Palma measure of income inequality. Significance, 11(1), 10-13. doi 10.1111/j.1740-9713.2014.00718.x"),
              tags$li("Coulter, P. (1989). Measuring inequality: A methodological handbook (2. print. ed.). Boulder [u.a.]: Westview Pr."),
              tags$li("Cowell, F. (2011). Measuring inequality (3rd ed., LSE perspectives in economic analysis). Oxford; New York: Oxford University Press."),
              tags$li("De Maio, F. G. (2007). Income Inequality Measures. Journal of Epidemiology and Community Health, 61(10), 849-852. doi: 10.1136/jech.2006.052969"),
              tags$li("Fedderke, J., & Szalontai, G. (2009). Industry concentration in South African manufacturing industry: Trends and consequences, 1972\u002d96. Economic Modelling, 26(1), 241-250. doi: 10.1016/j.econmod.2008.07.005"),
              tags$li("Gastwirth, J. (1972). The Estimation of the Lorenz Curve and Gini Index. The Review of Economics and Statistics, 54(3), 306-316."),
              tags$li("Gibbs, J.P. & Martin, W.T. (1962). Urbanization, Technology, and the Division of Labor: International Patterns. American Sociological Review, 27(5), 667-677."),
              tags$li("Government Digital Service United Kingdom (2020, June 26). Percentile points from 1 to 99 for total income before and after tax. Retrieved from https://www.gov.uk/government/statistics/percentile-points-from-1-to-99-for-total-income-before-and-after-tax"),
              tags$li("Hill, M. O. (1973). Diversity and evenness: a unifying notation and its consequences. Ecology, 54(2), 427-432. doi: 10.2307/1934352"),
              tags$li("Hirschman, A. (1964). The Paternity of an Index. The American Economic Review, 54(5), 761-762."),
              tags$li("Hoover, E. (1936). The Measurement of Industrial Localization. The Review of Economics and Statistics, 18(4), 162-171. doi: 10.2307/1927875"),
              tags$li("Huang, Y., & Leung, Y. (2009). Measuring regional inequality: a comparison of coefficient of variation and Hoover concentration index. The Open Geography Journal, 2(1). doi: 10.2174/1874453200902010025"),
              tags$li("Hurlbert, S. H. (1971). The Nonconcept of Species Diversity: A Critique and Alternative Parameters. Ecology (Durham), 52(4), 577-586. doi: 10.2307/1934145"),
              tags$li("International Olympic Committee (2018). Olympic Games Results. Retrieved from https://www.olympic.org/olympic-results"),
              tags$li("Jost, L. (2006). Entropy and diversity. Oikos, 113(2), 363-375. doi: 10.1111/j.2006.0030-1299.14714.x"),
              tags$li("Kennedy, B., Kawachi, I., & Prothrow-Stith, D. (1996). Income distribution and mortality: Cross sectional ecological study of the Robin Hood index in the United States. BMJ, 312(7037), 1004-1007. doi: 10.1136/bmj.312.7037.1004"),
              tags$li("Lee, W. C. (1996). Analysis of Seasonal Data using the Lorenz Curve and the Associated Gini Index. International Journal of Epidemiology, 25(2), 426-434. doi: 10.1093/ije/25.2.426"),
              tags$li("Lee, W. C. (1997). Characterizing Exposure–Disease Association in Human Populations using the Lorenz Curve and Gini Index. Statistics in Medicine, 16(7), 729-739. doi: 10.1002/(SICI)1097-0258(19970415)16:7<729::AID-SIM491>3.0.CO"),
              tags$li("Lieberson, S. (1969). Measuring Population Diversity. American Sociological Review, 850-862."),
              tags$li("Lorenz, M. O. (1905). Methods of measuring the concentration of wealth. Publications of the American statistical association, 9(70), 209-219. doi: 10.1080/15225437.1905.10503443"),
              tags$li("OECD (2011). An Overview of Growing Income Inequalities in OECD Countries: Main Findings. https://www.oecd.org/els/soc/49499779.pdf "),
              tags$li("Rosenbluth, G. (1955). Measures of concentration. In Business concentration and price policy (pp. 57-99). Princeton University Press."),
              tags$li("Santic, D. (2014). Spatial concentration of population in Serbia 1981-2011 measured with the Hoover index. Zbornik Matice Srpske Za Drustvene Nauke, (148), 461-470. doi: http://dx.doi.org/10.2298/ZMSDN1448461S"),
              tags$li("Shannon, C. E. (1948). A mathematical theory of communication. The Bell system technical journal, 27(3), 379-423."),
              tags$li("Shannon, C., & Weaver, W. (1949). The mathematical theory of communication (14. ed.). Urbana, Ill.: Univ. of Illinois Press."),
              tags$li("Simpson., E. H. (1949). Measurement of Diversity. Nature, 163(4148), 688-688. doi: 10.1038/163688a0"),
              tags$li("Spellerberg, I., & Fedor, P. (2003). A tribute to Claude Shannon (1916\u002d2001) and a plea for more rigorous use of species richness, species diversity and the \u0027Shannon–Wiener\u0027 Index. Global Ecology and Biogeography, 12(3), 177-179. doi: 10.1046/j.1466-822X.2003.00015.x"),
              tags$li("Strong, W. (2016). Biased richness and evenness relationships within Shannon–Wiener index values. Ecological Indicators, 67, 703-713. doi: 10.1016/j.ecolind.2016.03.043"),
              tags$li("Tammaru, T., Van Ham, M., Marcinczak, S., & Musterd, S. (2015). Socio-Economic Segregation in European Capital Cities (Vol. 89, Regions and cities). London: Routledge. doi: 10.4324/9781315758879"),
              tags$li("Tarigan, J., Hervindra, C., & Hatane, S.E. (2018). Does Board Diversity Influence Financial Performance? International Research Journal of Business Studies, 11(3), 195-215. doi: 10.21632/irjbs.11.3.195-215"),
              tags$li("Tran, U.S., Kossmeier, M., & Voracek, M. (2019). Associations of Bisexuality and Homosexuality with Handedness and Footedness: A Latent Variable Analysis Approach. Archives of Sexual Behavior, 48(5), 1451-1461. doi: 10.1007/s10508-018-1346-9"),
              tags$li("United Nations (2019). Intentional homicides and other crimes. http://data.un.org/_Docs/SYB/PDFs/SYB62_328_201904_Intentional%20Homicides%20and%20Other%20Crimes.pdf"),
              tags$li("United Nations (2019). Gross domestic product and gross domestic product by capita. http://data.un.org/_Docs/SYB/PDFs/SYB62_230_201904_GDP%20and%20GDP%20Per%20Capita.pdf"),
              tags$li("Wagschal, U. (1999). Statistik F\u00fcr Politikwissenschaftler. M\u00fcnchen; Wien: R. Oldenbourg Verlag."),
              tags$li("Wilcox, A. R. (1973). Indices of Qualitative Variation and Political Measurement. Political Research Quarterly, 26(2), 325-343. doi: 10.1177/106591297302600209"),
              tags$li("World Health Organization (2018, July 17). Suicide rate estimates, age-standardized Estimates by country. Retrieved from https://apps.who.int/gho/data/node.main.MHSUICIDEASDR?lang=en"),
              tags$li("Zizzo, D. J. (2004). Inequality and procedural fairness in a money-burning and stealing experiment. Research on Economic Inequality, 11, 215-247. doi: 10.1016/S1049-2585(04)11010-7"),
              tags$li("Zonoobi, D, Kassim, A. A, & Venkatesh, Y. V. (2011). Gini Index as Sparsity Measure for Signal Reconstruction from Compressive Samples. IEEE Journal of Selected Topics in Signal Processing, 5(5), 927-932. doi: 10.1109/JSTSP.2011.2160711 ")
            ),
          )
      ),
      wellPanel(
        div(style = "font-size: 18px;", "The author of this app can be contacted by: lallai.taric@gmail.com")
      )
    ),
    tags$footer(foot)
    
  )