#--------------------------Shannon Index
shannon <-
  
  function(vec, log = 'log2'){
    if(length(vec)==0) stop("empty vector")               #exception no value in vector
    if(sum(vec)==0) stop("no values")
    # if(any(vec)==0) stop("NaN")
    vec <- vec[ vec != 0 ]

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



shannondat <- 
  
  function(vec, log = 'log nat'){
    
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
    
    letcol <- c('A','B','C','D','E','F')
    
    back <- data.table(letcol,
                       number = as.integer(vec), 
                       round(pi,3), 
                       round(lpi, 3), 
                       round(result, 3))
    
    back <-  back[number != 0]
    
    colnames(back) <- c("Letter", "Absolute frequency", "Relative frequency",
                        "Logarithm of relative frequency", "Minus relative frequency times its logarithm")
    
    return(back)
  }
