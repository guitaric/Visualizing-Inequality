#-----------------
gggini1calc <- 
  
  function(vec){
    
    dat = finalDT_inc(vec)
    
    ggplot(data = dat, mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_col(width = 0.02, fill = "#000000") +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_point(size = 3, colour = "#000000") +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal() 
  }

ggrosenbluth1calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_point(size = 3, colour = "#000000") +
      geom_col(width = 0.02, fill = "#000000") +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal()
  }

gggini3calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 1) +
      geom_segment(aes(x = 100, y = 0, xend = 100, yend = 100), size = 1) +
      geom_point(size = 4) +
      geom_line(size = 1.2) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100), 
                   size = 1.5, linetype = 'longdash') +                            #diagonal of equal distribution
      geom_ribbon(aes(x = cumsharecomp, 
                      ymin = cumshareunits, 
                      ymax = cumsharecomp), alpha = 0.5, fill = "#FCDB28") +             #area between actual and equal
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal()
  }

gghoovercalc <- 
  
  function(vec){
    
    hoo <- finalDT_inc(vec)$cumsharecomop - finalDT_inc(vec)$cumsharecomp
    maxindex <- which(hoo == max(hoo))
    xloc <- finalDT_inc(vec)$cumsharecomp[maxindex]
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumsharecomp, y = cumshareunits)) +
      geom_point(size = 4) +
      geom_line(size = 1.2) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100),
                   size = 1.5, linetype = 'longdash') +         #diagonal of equal distribution
      geom_col(alpha = 0.5, width = 0.1) +
      geom_segment(aes(x = xloc, xend = xloc, y = xloc - max(hoo), yend = xloc),
                   size = 1.5, linetype = 'solid', colour = '#FC716B') +
      geom_point(x = xloc, y = xloc - max(hoo), colour = '#FC716B', size = 4) +
      geom_point(x = xloc, y = xloc, colour = '#FC716B', size = 4) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Capital in %") +
      theme_minimal()
  }

# ggrosenbluth3calc <- 
#   
#   function(vec){
#     
#     ggplot(data = finalDT_dec(vec), 
#            mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
#       geom_point(size = 4) +
#       geom_line(size = 1.2) +
#       geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100), 
#                    size = 1.5, linetype = 'longdash') +                    #diagonal of equal distribution
#       geom_ribbon(aes(x = cumsharecomp, 
#                       ymin = cumshareunits, 
#                       ymax = cumsharecomp), alpha = 0.5, fill = 'violet') +    #area between actual and equal 
#       geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
#       geom_segment(aes(x = 100, y = 0, xend = 100, yend = 100), size = 0.3) +
#       coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
#       scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
#       scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
#       labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
#       theme_minimal()
#   }


ggrosenbluth3calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), 
           mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_point(size = 3) +
      geom_line(size = 0.8) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100), 
                   size = 0.8, linetype = 'longdash') +                    #diagonal of equal distribution
      geom_ribbon(aes(x = cumsharecomp, 
                      ymin = cumshareunits, 
                      ymax = 100), alpha = 0.5, fill = '#ffd591') +    #area between actual and equal
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_segment(aes(x = 0, y = 0, xend = 0, yend = 100), size = 0.5) +
      geom_segment(aes(x = 0, y = 100, xend = 100, yend = 100), size = 0.5) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Market Share in %") +
      theme_minimal()
  }


















ggherfindahlcalc <- 
  
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
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal() 
  }

ggratiocalc <- 
  
  function(vec, ownbottom, owntop){
    ggplot(data = finalDT_ratio(vec, ownbottom, owntop)) +
      geom_col(aes(x = ratio, y = shareunits, fill = group)) +
      theme_minimal() 
    
  }

#--------------------------------------Tables for Calculate


indextable <-
  
  function(v, rdigit){
    
    ginirow <- c("Gini Index", "0 - 1-(1/n)", gini(v))
    corrginirow <- c("Corrected Gini Index", "0 - 1", gini(v, corr = T))
    hooverrow <- c("Hoover Index", "0 - 1-(1/n)", hoover(v))
    corrhooverrow <- c("Corrected Hoover Index", "0 - 1", hoover(v, corr = T))
    rosenrow <- c("Rosenbluth Index", "1/n - 1", rosenbluth(v))
    
    hhirow <- c("Herfindahl-Hirschmann Index", "1/n - 1", hhi(v))
    simpsonrow <- c("Simpson Index", "0 - 1", simpson(v))
    ginisimpsonrow <- c("Gini-Simpson Index", "0 - 1", simpson(v, type = "ginisim"))
    invsimpsonrow <- c("Inverted Simpson Index", "0 - inf", simpson(v, type = "invsim"))
    
    shannonrowlog2 <- c("Shannon Index (log2)", "0 - inf", shannon(v))
    shannonrowln <- c("Shannon Index (ln)", "0 - inf", shannon(v, log = 'ln'))
    shannonrowlog10 <- c("Shannon Index (log10)", "0 - inf", shannon(v, log = 'log10'))
    ge_ent_neg1_row <- c("Generalized Entropy Index (alpha = -1)", "0 - 1", gei(v, -1))
    ge_ent_0_row <- c("Generalized Entropy Index (alpha = 0)", "0 - 1", gei(v, 0))
    ge_ent_1_row <- c("Generalized Entropy Index (alpha = 1)", "0 - 1", gei(v, 1))
    ge_ent_2_row <- c("Generalized Entropy Index (alpha = 2)", "0 - 1", gei(v, 2))
    
    atk_0_row <- c("Atkinson Index (epsilon = 0)", "0 - 1", myatkinson(v, 0))
    atk_1_row <- c("Atkinson Index (epsilon = 1)", "0 - 1", myatkinson(v, 1))
    atk_2_row <- c("Atkinson Index (epsilon = 2)", "0 - 1", myatkinson(v, 2))
    
    palmarow <- c("Palma Ratio", "1/4 - inf", palma(v))
    quintilerow <- c("Quintile Ratio", "1 - inf", quintile(v))
    decilerow <- c("Decile Ratio", "1 - inf", decile(v))

    
    table <- rbind(ginirow, corrginirow, 
                   hooverrow, corrhooverrow, rosenrow, hhirow, 
                   simpsonrow, ginisimpsonrow, invsimpsonrow,
                   shannonrowlog2, shannonrowln, shannonrowlog10,
                   ge_ent_neg1_row, ge_ent_0_row, ge_ent_1_row, ge_ent_2_row,
                   atk_0_row, atk_1_row, atk_2_row,
                   palmarow, quintilerow, decilerow)
    
    table <- as.data.frame(table)
    table[,3] <- as.numeric(table[,3])
    table[,3] <- round(table[,3], rdigit)
    table <- as.data.table(table)
    names(table) <- c("Name", "Range", "Index/Ratio")
    
    return(table)
  }


# newtable <-
#   
#   function(v){
#     
#     indices <- c("Gini Index", "Corrected Gini Index", "Hoover Index",
#                  "Rosenbluth Index", "Herfindahl-Hirschmann Index",
#                  "Palma Ratio", "Quintile Ratio",
#                  "Decile Ratio", "Shannon Index", "Simpson Index",
#                  "Generalized Entropy/Mean Log Deviation (alpha = 0)", "Generalized Entropy/Theils T (alpha = 1)",
#                  "Generalized Entropy (alpha = 2)", "Atkinson Index (epsilon = 0)", 
#                  "Atkinson Index (epsilon = 1)", "Atkinson Index (epsilon = 2)")
#     
#     ranges <-  c("0 - (1-(1/n))", "0 - 1", "0 - 1", "1/n - 1", "1/n - 1",
#                  "1/4 - inf", "1 - inf", "1 - inf", "?", "0 - 1",
#                  "0 - 1","0 - 1","0 - 1","0 - 1","0 - 1","0 - 1")
#     
#     values <-  c(gini(v), gini(v, corr = T), hoover(v), rosenbluth(v),
#                  hhi(v), palma(v), quintile(v), decile(v),
#                  shannon(v), simpson(v), gei(v, 0), gei(v, 1), gei(v, 2),
#                  myatkinson(v, 0), myatkinson(v, 1), myatkinson(v, 2))
#     
#     x <- data.table(Name = indices,
#                     Range = ranges,
#                     Index = values)
#     
#     return(x)
#   }
# 
# 
# 
# tableofall <-
#   
#   function(v){
#     
#     toprow <- c("Name", "Range", "Index/Ratio")
#     ginirow <- c("GiniIndex", "0 - 1-(1/n)", gini(v))
#     ginicorrrow <- c("Corrected Gini Index", "0 - 1", gini(v))
#     hooverrow <- c("Hoover Index", "0 - 1", hoover(v))
#     rosenrow <- c("Rosenbluth Index", "1/n - 1", rosenbluth(v))
#     hhirow <- c("Herfindahl-Hirschmann Index", "1/n - 1", hhi(v))
#     palmarow <- c("Palma Ratio", "1/4 - inf", palma(v))
#     quintilerow <- c("Quintile Ratio", "1 - inf", quintile(v))
#     decilerow <- c("Decile Ratio", "1 - inf", decile(v))
#     shannonrow <- c("Shannon Index", "?", shannon(v))
#     simpsonrow <- c("Simpson Index", "0 - 1", simpson(v))
#     
#     table <- rbind(toprow, 
#                    ginirow, ginicorrrow, 
#                    hooverrow, rosenrow, hhirow, 
#                    exprow, palmarow, quintilerow, 
#                    decilerow, shannonrow, simpsonrow)
#     
#     return(table)
#   }
# 
# 
# 
