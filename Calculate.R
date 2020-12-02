#-----------------
gggini1calc <- 
  
  function(vec){
    
    dat = finalDT_inc(vec)
    
    ggplot(data = dat, mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_col(width = 0.08, fill = "#000000") +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_point(size = 3, colour = "#000000") +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", 
           y = "Cumul. Share of Total Amount in %") +
      theme_minimal() 
  }


ggrosenbluth1calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), mapping = aes(x = count, y = cumshareunits)) + 
      geom_col(width = 0.02, fill = "#000000") +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_point(size = 3, colour = "#000000") +
      coord_cartesian(xlim =c(0, length(vec)), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 120, yend = 0), size = 0.3) +
      labs(x = "Components/Quantiles of your Data in ascending order", 
           y = "Cumulated Share in %") +
      theme_minimal()
  }




ggrosenbluth3calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), 
           mapping = aes(x = count, y = cumshareunits)) + 
      geom_segment(aes(x = 0, y = 0, xend = length(vec), yend = 100),
                   size = 0.8, linetype = 'longdash') +  #diagonal of equal distribution
      geom_line(size = 0.8) +
      geom_ribbon(aes(x = count, 
                      ymin = cumshareunits, 
                      ymax = 100), alpha = 0.5, fill = '#ff8873') +    #area between actual and equal
      geom_point(size = 3) +
      geom_segment(aes(x = 0, y = 0, xend = length(vec), yend = 0), size = 0.3) +
      geom_segment(aes(x = 0, y = 0, xend = 0, yend = 100), size = 0.5) +
      geom_segment(aes(x = 0, y = 100, xend = length(vec), yend = 100), size = 0.5) +
      labs(x = "Components/Quantiles of your Data in descending order", 
           y = "Cumulated Share in %") +
      theme_minimal()
  }


gghoovercalc <- 
  
  function(vec){
    
    hoo <- finalDT_inc(vec)$cumsharecomp - finalDT_inc(vec)$cumshareunits
    maxindex <- which(hoo == max(hoo))
    xloc <- finalDT_inc(vec)$cumsharecomp[maxindex]
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumsharecomp, y = cumshareunits)) +
      geom_point(size = 3) +
      geom_line(size = 0.8) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100),
                   size = 0.8, linetype = 'longdash') +  #diagonal of equal distribution
      geom_segment(aes(x = xloc, xend = xloc, y = xloc - max(hoo), yend = xloc),
                   size = 1.5, linetype = 'solid', colour = '#ffc196') +
      geom_point(x = xloc, y = xloc - max(hoo), colour = '#ffc196', size = 4) +
      geom_point(x = xloc, y = xloc, colour = '#ffc196', size = 4) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumulated Component Share in %", 
           y = "Cumulated Share of Total Income in %") +
      theme_minimal()
  }


gghhicalc <- 
  
  function(vec){
    
    ggplot(data = rectdat(vec), 
           mapping = aes(x = cumsharecomp, y = cumshareunits,
                         ymax = ytop, xmax = xtop, 
                         ymin = ybottom, xmin = xbottom)) + 
      geom_point(mapping = aes(x = cumsharecomp, y = cumshareunits), size = 3) +
      geom_col(mapping = aes(x = cumsharecomp, y = cumshareunits), alpha = 0.5, width = 0.2) +
      geom_rect(alpha = 0.6, size = 1, colour = 'black', fill = '#9de0ec') +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumulated Component Share in %", 
           y = "Cumulated Share of Total Income in %") +
      theme_minimal() 
  }


gggeicalc <- 
  
  function(vec){
    ggplot(data = ge_dat(vec), mapping = aes(x = AlphaValue, y = GeneralEntropy)) + 
      geom_col(width = 0.3, fill = "#ffc3bb") +
      labs(x = "Alpha Value", y = "Generalized Entropy Index") +
      scale_x_continuous(breaks = c(-4, -2, 0, 2, 4)) +
      theme_minimal()
    
  }


ggatkinsoncalc <- 
  
  function(vec){
    ggplot(data = atk_dat(vec), mapping = aes(x = EpsilonValue, y = Atkinson)) + 
      geom_col(width = 0.15, fill = '#ffaa6b') +
      labs(x = "Epsilon Value", y = "Atkinson Index") +
      scale_x_continuous(breaks = c(0, 1, 2, 3)) +
      theme_minimal() 
    
  }


ggratiocalc <- 
  
  function(vec){
    mycolors <- c("#3a87b3", "#cecdcd", "#aa2d2f")
    
    ggplot(data = finalDT_ratio_calc(vec)) +
      geom_col(aes(x = ratio, y = shareunits, fill = group), alpha = 0.6) +
      scale_fill_manual(values = mycolors) +
      labs(x = "Ratio", y = "Percentage") +
      theme_minimal() 
    
  }

#--------------------------------------Tables for Calculate


indextable <-
  
  function(v, rdigit = 3){
    
    ginirow <- c("Gini index", "Inequality", "ordinal/rational", "0", "1-(1/k)", gini(v))
    corrginirow <- c("Corrected Gini index", "Inequality", "ordinal/rational", "0", "1", gini(v, corr = T))
    hooverrow <- c("Hoover index", "Inequality", "ordinal/rational", "0", "1-(1/k)", hoover(v))
    corrhooverrow <- c("Corrected Hoover index", "Inequality", "ordinal/rational", "0", "1", hoover(v, corr = T))
    rosenrow <- c("Rosenbluth index", "Inequality", "ordinal", "1/k", "1", rosenbluth(v))

    hhirow <- c("Herfindahl-Hirschmann index", "Inequality", "nominal", "1/k", "1", hhi(v))
    simpsonrow <- c("Simpson index", "Inequality", "nominal",  "0", "1", simpson(v))
    ginisimpsonrow <- c("Gini-Simpson index", "Equality", "nominal", "0", "1", simpson(v, type = "ginisim"))
    invsimpsonrow <- c("Inverse Simpson index", "Equality", "nominal", "0", "inf", simpson(v, type = "invsim"))

    shannonrowlog2 <- c("Shannon index (log2)", "Equality", "nominal", "0", "log2(k)", shannon(v))
    shannonrowln <- c("Shannon index (ln)", "Equality", "nominal", "0", "ln(k)", shannon(v, log = 'ln'))
    shannonrowlog10 <- c("Shannon index (log10)", "Equality", "nominal", "0", "log10(k)", shannon(v, log = 'log10'))
    ge_ent_neg1_row <- c("Generalized entropy index (alpha = -1)", "Inequality", "nominal", "0", "inf", gei(v, -1))
    ge_ent_0_row <- c("Gener. entr. index - mean log deviation (alpha = 0)", "Inequality", "nominal", "0", "inf", gei(v, 0))
    ge_ent_1_row <- c("Gener. entr. index - Theil index (alpha = 1)", "Inequality", "nominal", "0", "inf", gei(v, 1))
    ge_ent_2_row <- c("Gener. entr. index (alpha = 2)", "Inequality", "nominal", "0", "inf", gei(v, 2))

    atk_0_row <- c("Atkinson index (epsilon = 0)", "Inequality", "ordinal", "0", "1", myatkinson(v, 0))
    atk_1_row <- c("Atkinson index (epsilon = 1)", "Inequality", "ordinal", "0", "1", myatkinson(v, 1))
    atk_2_row <- c("Atkinson index (epsilon = 2)", "Inequality", "ordinal", "0", "1", myatkinson(v, 2))

    palmarow <- c("Palma ratio", "Inequality", "ordinal", "1/4", "inf", palma(v))
    quintilerow <- c("S80-S20 ratio", "Inequality", "ordinal", "1", "inf", quintile(v))
    decilerow <- c("P90-P10 ratio", "Inequality", "ordinal", "1", "inf", decile(v))
    tenfiftyrow <- c("P50-P10 ratio", "Inequality", "ordinal", "1", "inf", tenfifty(v))
    
    
    table <- rbind(ginirow, corrginirow, hooverrow, corrhooverrow, rosenrow, 
                   hhirow, simpsonrow, ginisimpsonrow, invsimpsonrow,
                   shannonrowlog2, shannonrowln, shannonrowlog10,
                   ge_ent_neg1_row, ge_ent_0_row, ge_ent_1_row, ge_ent_2_row,
                   atk_0_row, atk_1_row, atk_2_row,
                   palmarow, quintilerow, decilerow, tenfiftyrow)
    
    table <- as.data.frame(table)
    table[,6] <- as.numeric(table[,6])
    table[,6] <- round(table[,6], rdigit)
    table <- as.data.table(table)
    names(table) <- c("Name of Index/Ratio", "Polarity", "Scale type of component", 
                      "Lower limit", "Upper Limit", "Index/Ratio value")
    
    return(table)
  }

