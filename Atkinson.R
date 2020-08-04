

#--------------------------------Atkinson Index
myatkinson <-
  
  function(vec, epsilon=1){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    if(sum(vec)==0) stop("no values")
    if(epsilon < 0) stop("epsilon must be 0 or higher")
    
    
    mean <- sum(vec)/length((vec))
    N <- length(vec)
    
    if(epsilon == 0){
      return(0)
    } else if(epsilon == 1){
      atk <- 1 - (1/mean)*((prod(vec))^(1/N))
    } else if (0 < epsilon && epsilon != 1) {
      help <- vec^(1-epsilon)
      atk <- 1 -(1/mean)*((1/N)*sum(help))^(1/(1-epsilon))
    } else{
      stop("negative epsilon maybe?")
    }
    
    return(round(atk, 5))
    
    
  }

#-------------------------Atkinson Plot
ggatkinson <- 
  
  function(vec){
    ggplot(data = atk_dat(vec), mapping = aes(x = EpsilonValue, y = Atkinson)) + 
      geom_col() +
      theme_minimal() 
    
  }




atk_dat <- 
  
  function(vec){
    
    if(any(vec < 0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")               #exception no value in vector
    if(sum(vec)==0) stop("no values")
    
    epsilon <- c(0, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2)
    atk <- c()
    
    for(i in 1:8){
      atk[i] <- round(ineq::Atkinson(vec, epsilon[i]), 3)
    }
    
    back <- data.table(EpsilonValue = epsilon, 
                       Atkinson = atk)
    
    return(back)
    
  }
