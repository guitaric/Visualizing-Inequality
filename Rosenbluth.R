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
    
    ggplot(data = finalDT_dec(vec), mapping = aes(x = count, y = cumshareunits)) + 
      geom_col(alpha = 0.9, width = 0.4, fill = '#ff8873') +
      geom_point() +
      coord_cartesian(xlim =c(0, length(vec)), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = 120, yend = 0), size = 0.3) +
      labs(x = "Companies by Market Share in Descending Order (Cumulated)", 
           y = "Cumul. Market Share in %") +
      theme_minimal()
  }


ggrosenbluth2 <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), mapping = aes(x = count, y = cumshareunits)) + 
      geom_point(size = 3) +
      geom_col(width = 0.02) +
      geom_line(size = 0.8, color = '#ff8873') +
      geom_point(size = 3) +
      geom_segment(aes(x = 0, y = 0, xend = length(vec), yend = 100),
                   size = 0.8, linetype = 'longdash', color = '#ff8873') +  #diagonal of equal distribution
      coord_cartesian(xlim =c(0, length(vec)), ylim = c(0, 100)) +
      geom_segment(aes(x = 0, y = 0, xend = length(vec), yend = 0), size = 0.3) +
      labs(x = "Companies by Market Share in Descending Order (Cumulated)", 
           y = "Cumul. Market Share in %") +
      theme_minimal()
  }


ggrosenbluth3 <- 
  
  function(vec){
    
    ggplot(data = finalDT_dec(vec), 
           mapping = aes(x = count, y = cumshareunits)) + 
      geom_segment(aes(x = 0, y = 0, xend = length(vec), yend = 100),
                   size = 0.8, linetype = 'longdash') +   #diagonal of equal distribution
      geom_line(size = 0.8) +
      geom_ribbon(aes(x = count, 
                      ymin = cumshareunits, 
                      ymax = 100), alpha = 0.9, fill = '#ff8873') +    #area between actual and equal
      geom_point(size = 3) +
      geom_segment(aes(x = 0, y = 0, xend = length(vec), yend = 0), size = 0.3) +
      geom_segment(aes(x = 0, y = 0, xend = 0, yend = 100), size = 0.5) +
      geom_segment(aes(x = 0, y = 100, xend = length(vec), yend = 100), size = 0.5) +
      labs(x = "Companies by Market Share in Descending Order (Cumulated)", 
           y = "Cumul. Market Share in %") +
      theme_minimal()
  }
