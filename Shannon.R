#--------------------------Shannon Index
shannon <-
  
  function(vec, log = 'log2'){
    if(length(vec)==0) stop("empty vector")               #exception no value in vector
    if(sum(vec)==0) stop("no values")
    
    if(log == 'log2'){
      pi <- vec/sum(vec)
      lpi <- log2(pi)
      result <- -(sum(pi*lpi))
    } else if(log == 'log10'){
      pi <- vec/sum(vec)
      lpi <- log10(pi)
      result <- -(sum(pi*lpi))
    } else if(log == 'ln') {
      pi <- vec/sum(vec)
      lpi <- log(pi)
      result <- -(sum(pi*lpi))
    } else stop("wrong log parameter")
    
    return(round(result, digits = 5))
  }


#----------------------------Shannon Plot
ggshannon <-
  
  function(){
    ggplot() +
      geom_smooth(method = "lm", formula = y ~ (x^2))
  }




shannondat <- 
  
  function(vec, log = 'log nat'){
    
    if(any(vec <=0)) stop("non positive number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")               #exception no value in vector
    if(sum(vec)==0) stop("no values")
    
    pi <- vec/sum(vec)
    
    if(log == 'log 2'){
      lpi <- log2(pi)
    } else if(log == 'log 10'){
      lpi <- log10(pi)
    } else if(log == "log nat") {
      lpi <- log(pi)
    } else stop("wrong log parameter")
    
    result <- -(pi*lpi)
    
    back <- data.table("Value" = as.integer(vec), 
                       "Share" = round(pi,4), 
                       "Logarithm of Share" = round(lpi, 4), 
                       "Negative Product of Share and log" = round(result, 4))
    return(round(back, 4))
  }
