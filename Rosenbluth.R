#--------------------------Rosenbluth Index

belowcurve <- 
  
  function(vec){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    sortedvec <- sort(vec, decreasing = TRUE)       #descending order sorting
    
    #rectanglepart
    total = 0
    help = 0
    for(i in sortedvec[1:(length(sortedvec)-1)]){
      help = help + i/sum(sortedvec)
      total = total + help
    }
    rtotal = round(total, digits=5)
    
    #trianglepart
    total2 = 0
    for(i in sortedvec){
      total2 = total2 + (i/sum(sortedvec))/2
    }
    rtotal2 = round(total2, digits=5)
    
    return(rtotal + rtotal2)
  }




rosenbluth <- 
  
  function(vec, corr=FALSE){
    abovecurve = length(vec) - belowcurve(vec)
    result <- 1/(2*abovecurve)
    return(round(result, digits = 5))
  }



#--------------------------------rosenbluthplot


ggrosenbluth1 <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) + 
      geom_point() +
      geom_col(alpha = 0.5, width = 7, fill = '#ffd591') +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 120, yend = 0), size = 0.3) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Market Share in %") +
      theme_minimal()
  }


ggrosenbluth2 <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) + 
      geom_point(size = 3) +
      geom_line(size = 0.8, colour = '#ffd591') +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100),
                   size = 0.8, linetype = 'longdash') +         #diagonal of equal distribution
      geom_col(alpha = 0.5, width = 0.3) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Share of Market Share in %") +
      theme_minimal()
  }


ggrosenbluth3 <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), 
           mapping = aes(x = cumanteiltraeger, y = cumanteilmerkmal)) + 
      geom_point(size = 3) +
      geom_line(size = 0.8) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100), 
                   size = 0.8, linetype = 'longdash') +                    #diagonal of equal distribution
      geom_ribbon(aes(x = cumanteiltraeger, 
                      ymin = cumanteilmerkmal, 
                      ymax = 100), alpha = 0.5, fill = '#ffd591') +    #area between actual and equal
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      #geom_segment(aes(x = 100, y = 0, xend = 100, yend = 100), size = 0.3) +
      geom_segment(aes(x = 0, y = 0, xend = 0, yend = 100), size = 0.5) +
      geom_segment(aes(x = 0, y = 100, xend = 100, yend = 100), size = 0.5) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumul. Share of Carrier in %", y = "Cumul. Market Share in %") +
      theme_minimal()
  }