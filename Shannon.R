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
