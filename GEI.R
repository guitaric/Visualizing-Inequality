
gei <-
  
  function(vec, alpha=1){
    if(any(vec<0)) stop("negative number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")         #exception no value in vector
    if(sum(vec)==0) stop("no values")
    
    mean <- sum(vec)/length((vec))
    N <- length(vec)
    
    if(alpha == 0){
      ge <- -(1/N)*sum(log(vec/mean))
      
    } else if(alpha == 1) {
      ge <- (1/N)*(sum((vec/mean)*log(vec/mean)))
      
    } else {
      ge <- (1/(N*alpha*(alpha-1)))*sum((vec/mean)^(alpha) -1)
    }
    
    return(round(ge, 5))
  }


gggei <- 
  
  function(vec){
    ggplot(data = gei_dat(vec), mapping = aes(x = AlphaValue, y = GeneralEntropy)) + 
      geom_col(width = 0.3, fill = "#ffc3bb") +
      labs(x = "Alpha Value", y = "Generalized Entropy Index") +
      scale_x_continuous(breaks = c(-4, -2, 0, 2, 4)) +
      theme_minimal()

  }



gei_dat <- 
  
  function(vec){
    
    if(any(vec <0)) stop("negative  number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")               #exception no value in vector
    if(sum(vec)==0) stop("no values")
    
    alphas <- c(-4, -3.5, -3, -2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4)
    ent <- c()
    
    for(i in 1:17){
      ent[i] <- round(ineq::entropy(vec, alphas[i]), 3)
    }
    
    back <- data.table(AlphaValue = alphas, 
                       GeneralEntropy = ent)
    
    return(back)
    
  }

