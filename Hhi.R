#---------------------Herfindahl Hirschmann Index

hhi  <- 
  
  function(vec){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    
    dsvec <- sort(vec, decreasing = TRUE)          #descending sorting
    sumelem <- sum((dsvec/sum(dsvec))^2)
    return(round(sumelem, digits = 5))
  }


#--------------------------------herfindahlplot

ggherfindahl <- 
  
  function(vec){
    
    ggplot(data = rectdat(vec), 
           mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal,
                         ymax = ytop, xmax = xtop, 
                         ymin = ybottom, xmin = xbottom)) + 
      geom_point(mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal), size = 3) +
      geom_col(mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal), alpha = 0.5, width = 7) +
      geom_rect(alpha = 0.6, size = 0.8, colour = 'black', fill = '#9de0ec') +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Total Income in %") +
      theme_minimal() 
  }
