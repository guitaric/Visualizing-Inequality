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

gghhi <- 
  
  function(vec){
    
    ggplot(data = rectdat(vec), 
           mapping = aes(x = cumsharecomp, y = cumshareunits,
                         ymax = ytop, xmax = xtop, 
                         ymin = ybottom, xmin = xbottom)) + 
      geom_point(mapping = aes(x = cumsharecomp, y = cumshareunits), size = 3) +
      geom_col(mapping = aes(x = cumsharecomp, y = cumshareunits), alpha = 0.5, width = 7) +
      geom_rect(alpha = 0.6, size = 0.8, colour = 'black', fill = '#9de0ec') +
      geom_segment(aes(x = 0, y = 0, xend = 100, yend = 0), size = 0.3) +
      coord_cartesian(xlim =c(0, 100), ylim = c(0, 100)) +
      scale_x_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      scale_y_continuous(breaks = c(0, 20, 40, 60, 80, 100)) +
      labs(x = "Cumulated Component Share in %", y = "Cumulated Share of Total Income in %") +
      theme_minimal() 
  }



#-----------------------HHI Index rectdat

rectdat <- 
  
  function(vec){
    dat <- finalDT_inc(vec)

    xtop <- dat$cumsharecomp[2:length(dat$cumsharecomp)]
    ytop <- dat$cumshareunits[2:length(dat$cumsharecomp)]
    ybottom <- dat$cumshareunits[1:length(dat$cumsharecomp)-1]
    xbottom <- xtop -(ytop-ybottom)
    
    xtop    <- insert(xtop, 1, 0)
    xbottom <- insert(xbottom, 1, 0)
    ytop    <- insert(ytop, 1, 0)
    ybottom <- insert(ybottom, 1, 0)
    
    
    back <- data.table(dat, ytop, xtop, ybottom, xbottom)
    return(back)
  }
