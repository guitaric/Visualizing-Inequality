
#-----------Prozente vom Anteil der Summe
anteil_merkmal <- 
  
    function(vector){
        newvector <- c(length(vector))
        newvector[1] = 0
        for(i in 2:length(vector)){
            newvector[i] <- vector[i]/sum(vector)*100
        }
        return(round(newvector, digits=3))
}



#-------------Kumulierte Prozente vom Anteil der Summe
cum_anteil_merkmal <- 
  
    function(vector){
        newvector <- c(length(vector))
        help <- 0
        newvector[1] = 0
        for(i in 2:length(vector)){
          help <- help + vector[i]/sum(vector)*100
          newvector[i] <- help
        }
        return(round(newvector, digits=3))
}


#-------------Prozente vom Anteil der Tr?ger
anteil_traeger <- 
  
    function(vector){
        newvector <- c(length(vector))
        newvector[1] = 0
        for(i in 2:length(vector)){
          newvector[i] <- 1/(length(vector)-1)*100
        }
        return(round(newvector, digits=3))
}


#------------Kumulierte Prozente vom Anteil der Tr?ger
cum_anteil_traeger <- 
  
    function(vector){
        newvector <- c(length(vector))
        help <- 0
        newvector[1] = 0
        for(i in 2:length(vector)){
          help <- help + 1/(length(vector)-1)*100
          newvector[i] <- help
        }
        return(round(newvector, digits=3))
}



#------------------------Datatable for splitting in x% steps
converter_to_xparts <-
  
  function(vec, x){
    if(length(vec) <= x) stop("length of vector has to be more than x")
    if(sum(vec) == 0) stop("no positive value in vector")
    if(any(is.negative(vec))) stop("negative value found")
    
    index <- c(length(x))
    res <- c(length(x))
    for(i in 1:x){
      index[i] <- (i/x)*(length(vec))
    }
    
    for(i in 1:x){
      if(i == 1){
        res[1] <- sum(vec[1:floor(index[i])]) + (index[i]-floor(index[i]))*vec[ceiling(index[i])]
      }else{
        first <- (ceiling(index[i-1])-(index[i-1]))*vec[ceiling(index[i-1])]
        sum <- 0
        if(ceiling(index[i-1]+1) <= floor(index[i])){
          sum <-  sum(vec[(ceiling(index[i-1]+1)):floor(index[i])])
        }
        last <- (index[i]-floor(index[i]))*vec[ceiling(index[i])]
        res[i] <- first + sum + last
      }
    }
    return(res)
  }


shrinker_to_20 <- 
  
    function(vec){
        if(length(na.omit(vec)) > 20){
            return(converter_to_xparts(na.omit(vec), 20))
        } else return(na.omit(vec))
    }

#--------------DATATABLE from vector and 4 calculated columns
finalDT_inc <- 
  
  function(vec){
    if(length(vec) == 0) stop("no values in vector")
    if(sum(vec) == 0) stop("no positive value in vector")
    if(any(is.negative(vec))) stop("negative value found")
    vec <- sort(vec)
    vec <- insert(vec, 1, 0)
    x <- data.table(amount = vec, 
                    shareunits = anteil_merkmal(vec), 
                    cumshareunits = cum_anteil_merkmal(vec), 
                    sharecomp = anteil_traeger(vec), 
                    cumsharecomp = cum_anteil_traeger(vec)
    )
    return(x)
  }


finalDT_dec <- 
  
  function(vec){
    if(length(vec) == 0) stop("no values in vector")
    if(sum(vec) == 0) stop("no positive value in vector")
    if(any(is.negative(vec))) stop("negative value found")
    
    vec <- sort(vec, decreasing = T)
    vec <- insert(vec, 1, 0)
    x <- data.table(amount = vec, 
                    shareunits = anteil_merkmal(vec), 
                    cumshareunits = cum_anteil_merkmal(vec), 
                    sharecomp = anteil_traeger(vec), 
                    cumsharecomp = cum_anteil_traeger(vec)
    )
    return(x)
  }


finalDT_inc_calc <- 
  
  function(vec){
    if(length(vec) == 0) stop("no values in vector")
    if(sum(vec) == 0) stop("no positive value in vector")
    if(any(is.negative(vec))) stop("negative value found")
    vec <- sort(vec)
    vec <- insert(vec, 1, 0)
    x <- data.table("Value (Sorted)" = vec, 
                    "Share of Units (in %)" = anteil_merkmal(vec), 
                    "Cumulated Share of Units (in %)" = cum_anteil_merkmal(vec), 
                    "Share of Components (in %)" = anteil_traeger(vec), 
                    "Cumulated Share of Components (in %)" = cum_anteil_traeger(vec)
    )
    return(x)
  }




