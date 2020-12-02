#------------------Gini Index 

underlorenz <- 
  
  function(vec){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    sortedvec <- sort(vec)                          #ascending order sorting
    
    #rectanglepart
    total = 0
    help = 0
    for(i in sortedvec[1:(length(sortedvec)-1)]){
      help = help + i/sum(sortedvec)
      total = total + (1/length(sortedvec))*help
    }
    rtotal = round(total, digits=5)
    
    #trianglepart
    total2 = 0
    for(i in sortedvec){
      total2 = total2 + ((1/length(sortedvec)*(i/sum(sortedvec))))/2
    }
    rtotal2 = round(total2, digits=5)

    return(rtotal + rtotal2)
  }


underlorenz2 <- 
  
  function(vec, groups = rep(1/length(vec), length(vec))){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    if(length(vec) != length(groups)) stop("length of vector and groups should be of equal length")
    
    if(length(unique(groups)) == 1) vec <- sort(vec)      #ascending order sorting only if groups are not set
    cumvec <- cumsum(vec/sum(vec))                        #cumulated value share
    cumgroups <- cumsum(groups/sum(groups))               #cumulated group share
    if(any(cumvec>cumgroups)) stop("not ascending distribution") 
    #makes sure that distribution with own groups is ascending - guarantees Lorenz curve under perfect equality
    
    triangles <-  0
    rectangles <- 0
    
    #triangles
    triangles <- 1/2 * sum((vec/sum(vec))*groups)
    
    #rectangles
    rectangles <- sum( cumvec[1:length(vec)-1]*groups[2:length(vec)] )
    
    return(triangles + rectangles)
    
  }




gini <- 
  
  function(vec, corr = F){
    total = (0.5 - (underlorenz(vec)))/0.5
    if(corr == T) total = total*(length(vec)/(length(vec)-1))
    return(round(total, 5))
  }


#-------------------------------------giniplots
gggini1 <- 
  
  function(vec){
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_col(width = 0.2, fill = "#FCDB28") +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_point(size = 3, colour = "#FCDB28") +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumulated Component Share in %", y = "Cumulated Share of Total Income in %") +
      theme_minimal() 
  }


gggini2 <- 
  
  function(vec){
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_col(width = 0.2) +
      geom_line(size = 0.8, colour = '#FCDB28') +
      geom_point(size = 3) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100),
                   size = 0.8, linetype = 'longdash', colour = '#FCDB28') +         #diagonal of equal distribution
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumulated Component Share in %", y = "Cumulated Share of Total Income in %") +
      theme_minimal()
  }


gggini3 <- 
  
  function(vec){
    
    ggplot(data = finalDT_inc(vec), mapping = aes(x = cumsharecomp, y = cumshareunits)) + 
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      geom_segment(aes(x = 100, y = 0, xend = 100, yend = 100), size = 0.3) +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 100), 
                   size = 0.8, linetype = 'longdash') +                            #diagonal of equal distribution
      geom_ribbon(aes(x = cumsharecomp, 
                      ymin = cumshareunits, 
                      ymax = cumsharecomp), alpha = 0.9, fill = "#FCDB28") +             #area between actual and equal
      geom_point(size = 3) +
      geom_line(size = 0.8) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumulated Component Share in %", y = "Cumulated Share of Total Income in %") +
      theme_minimal()
  }

