
#-----------Prozente vom Anteil der Summe
anteil_merkmal <- 
  
    function(vec){
        newvec <- c(length(vec))
        newvec[1] = 0
        for(i in 2:length(vec)){
            newvec[i] <- vec[i]/sum(vec)*100
        }
        return(round(newvec, digits=3))
}



#-------------Kumulierte Prozente vom Anteil der Summe
cum_anteil_merkmal <- 
  
    function(vec){
        newvec <- c(length(vec))
        help <- 0
        newvec[1] = 0
        for(i in 2:length(vec)){
          help <- help + vec[i]/sum(vec)*100
          newvec[i] <- help
        }
        return(round(newvec, digits=3))
}


#-------------Prozente vom Anteil der Tr?ger
anteil_traeger <- 
  
    function(vec){
        newvec <- c(length(vec))
        newvec[1] = 0
        for(i in 2:length(vec)){
          newvec[i] <- 1/(length(vec)-1)*100
        }
        return(round(newvec, digits=3))
}


#------------Kumulierte Prozente vom Anteil der Tr?ger
cum_anteil_traeger <- 
  
    function(vec){
        newvec <- c(length(vec))
        help <- 0
        newvec[1] = 0
        for(i in 2:length(vec)){
          help <- help + 1/(length(vec)-1)*100
          newvec[i] <- help
        }
        return(round(newvec, digits=3))
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
    if(any(is.negative(vec))) warning("negative hallo found")
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
    x <- data.table(count = 1:length(vec)-1,
                    amount = vec, 
                    shareunits = anteil_merkmal(vec), 
                    cumshareunits = cum_anteil_merkmal(vec), 
                    sharecomp = anteil_traeger(vec), 
                    cumsharecomp = cum_anteil_traeger(vec)
    )
    return(x)
  }

#---------------------


finalDT_inc_calc <- 
  
  function(vec){
    if(length(vec) == 0) stop("no values in vector")
    if(sum(vec) == 0) stop("no positive value in vector")
    if(any(is.negative(vec))) stop("negative hallo found")
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


#-------------------

finalDT_ratio_calc <- 
  
  function(vec){
    df <- finalDT_inc(vec)
    df <- df[-1, ]
    df <- rbind(df, df)
    
    for(i in 1:(nrow(df)/2)){
      #palma ratio
      df$ratio[i] <- "Palma Ratio"
      
      if(ceiling(df$cumshareunits[i]) <= 41){
        df$group[i] <- "bottom"
      }else if(ceiling(df$cumshareunits[i]) <= 91){
        df$group[i] <- "mid"
      }else{
        df$group[i] <- "top"
      }
    }
    for(i in (nrow(df)/2+1):(nrow(df))){
      #quintile ratio
      df$ratio[i] <- "S80:S20 Ratio"
      
      if(ceiling(df$cumshareunits[i]) <= 21){
        df$group[i] <- "bottom"
      }else if(ceiling(df$cumshareunits[i]) <= 81){
        df$group[i] <- "mid"
      }else{
        df$group[i] <- "top"
      }
    }


    
    df$ratio <- factor(df$ratio, levels = c("Palma Ratio", "S80:S20 Ratio"))
    df$group <- factor(df$group, levels = c("top", "mid", "bottom"))
    
    return(df)
    
  }


#------------------------------------------- Data for ratios


foot <- " CC BY-NC \u00a9 2021"

