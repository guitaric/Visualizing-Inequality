#-----------------
gggini1calc <- 
  
  function(vec){
    
    dat = finalDT_inc(vec)
    
    ggplot(data = dat, mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) + 
      geom_col(width = 0.01, fill = "#47EABF") +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_point(size = 5, colour = "#47EABF") +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal() 
  }

ggrosenbluth1calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) + 
      geom_point(size = 5, colour = "#47EABF") +
      geom_col(width = 0.01, fill = "#47EABF") +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal()
  }

gggini3calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) + 
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 1) +
      geom_segment(aes(x = 100, y = 0, xend = 100, yend = 100), size = 1) +
      geom_point(size = 4) +
      geom_line(size = 1.2) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100), 
                   size = 1.5, linetype = 'longdash') +                            #diagonal of equal distribution
      geom_ribbon(aes(x = cumanteiltraeger, 
                      ymin = cumanteilmerkmal, 
                      ymax = cumanteiltraeger), alpha = 0.5, fill = "#FCDB28") +             #area between actual and equal
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal()
  }

gghoovercalc <- 
  
  function(vec){
    
    hoo <- finalDT_inc(vec)$cumanteiltraeger - finalDT_inc(vec)$cumanteilmerkmal
    maxindex <- which(hoo == max(hoo))
    xloc <- finalDT_inc(vec)$cumanteiltraeger[maxindex]
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) +
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

ggrosenbluth3calc <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), 
           mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) + 
      geom_point(size = 4) +
      geom_line(size = 1.2) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100), 
                   size = 1.5, linetype = 'longdash') +                    #diagonal of equal distribution
      geom_ribbon(aes(x = cumanteiltraeger, 
                      ymin = cumanteilmerkmal, 
                      ymax = cumanteiltraeger), alpha = 0.5, fill = 'violet') +    #area between actual and equal 
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_segment(aes(x = 100, y = 0, xend = 100, yend = 100), size = 0.3) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Amount in %") +
      theme_minimal()
  }

ggherfindahlcalc <- 
  
  function(vec){
    
    ggplot(data = rectdat(vec), 
           mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal,
                         ymax = ytop, xmax = xtop, 
                         ymin = ybottom, xmin = xbottom)) + 
      geom_point(mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal), size = 3) +
      geom_col(mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal), alpha = 0.5, width = 0.2) +
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
      geom_col(aes(x = ratio, y = anteilmerkmal, fill = group)) +
      theme_minimal() 
    
  }
