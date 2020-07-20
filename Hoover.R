#----------------------Hoover Index

hoover <- 
  
  function(vec, corr = F){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    
    if(corr == F) back <- (1/2)*sum(abs(vec/sum(vec)-(1/length(vec))))  #hoover equation
    else back <- sum(abs(vec/sum(vec)-(1/length(vec))))/(2*(1-(1/length(vec))))  #hoover equation
    
    return(back)
  } 



#-------------------------------hooverplot

gghoover <- 
  
  function(vec){
    
    hoo <- finalDT_inc(vec)$cumanteiltraeger - finalDT_inc(vec)$cumanteilmerkmal
    maxindex <- which(hoo == max(hoo))
    xloc <- finalDT_inc(vec)$cumanteiltraeger[maxindex]
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) +
      geom_point(size = 3) +
      geom_line(size = 0.8) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100),
                   size = 0.8, linetype = 'longdash') +         #diagonal of equal distribution
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