
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


gggenent <- 
  
  function(vec){
    ggplot(data = ge_dat(vec), mapping = aes(x = AlphaValue, y = GeneralEntropy)) + 
      geom_col() +
      theme_minimal() 
  }