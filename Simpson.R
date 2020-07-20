#------------------------Simpson Index
simpson <-
  
  function(vec, type = "sim"){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    if(sum(vec)==0) stop("no values")
    
    upper <- sum(vec*(vec-1))
    lower <- sum(vec)*(sum(vec)-1)
    
    if(type == "sim") result <- upper/lower
    else if(type == "ginisim") result <- 1 - (upper/lower)
    else if(type == "invsim") result <- 1/(upper/lower)
    else stop("wrong parameter")
    
    return(round(result, digits = 5))
  }


#----------------------------------Simpsonplot

ggsimpson <-
  
  function(vec){
    
    ggplot(data = simpdat(vec), mapping = aes(x = xaxis, y = yaxis, color = group)) +
      coord_cartesian(xlim =c(0, 1), ylim = c(0, 1)) +
      scale_x_continuous(breaks = c()) +
      scale_y_continuous(breaks = c()) +
      labs(x = "", y = "") +
      
      geom_point(size = 6, aes(shape = group)) +
      theme_classic()
    
  }
