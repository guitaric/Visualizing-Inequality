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
      scale_color_manual(values=c("#339043", "#d62525", "#336bd4", "#e98302", "#385346"),
                         labels = c("First Species", "Second Species", "Third Species", "Fourth Species", "Fifth Species")) +
      guides(color = FALSE) +
      coord_cartesian(xlim =c(0, 1), ylim = c(0, 1)) +
      scale_x_continuous(breaks = c()) +
      scale_y_continuous(breaks = c()) +
      labs(x = "", y = "") +
      geom_point(size = 6) +
      theme_classic()
    
  }


#------------------------Simpson Table

simpdat <- 
  
  function(vec){
    
    group <- as.factor(c())
    xaxis <- runif(sum(vec), 0, 1)
    yaxis <- runif(sum(vec), 0, 1)
    
    j <- 1
    for(i in 1:length(vec)){
      help <- rep(j, vec[i])
      group <- append(group, help)
      j <- j + 1
    }
    
    back <- data.table(group, xaxis, yaxis)
    back$group <- as.factor(back$group)
    
    return(back)
  }
