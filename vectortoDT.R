
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
    x <- data.table(Amount = vec, 
                    anteilmerkmal = anteil_merkmal(vec), 
                    cumanteilmerkmal = cum_anteil_merkmal(vec), 
                    anteiltraeger = anteil_traeger(vec), 
                    cumanteiltraeger = cum_anteil_traeger(vec)
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
    x <- data.table(Amount = vec, 
                    anteilmerkmal = anteil_merkmal(vec), 
                    cumanteilmerkmal = cum_anteil_merkmal(vec), 
                    anteiltraeger = anteil_traeger(vec), 
                    cumanteiltraeger = cum_anteil_traeger(vec)
    )
    return(x)
  }


#------------------------------------------------------

finalDT_ratio <- 
  
    function(vec, ownbottom, owntop){
        df <- finalDT_inc(vec)
        df <- df[-1, ]
        df <- rbind(df, df, df, df)

        for(i in 1:(nrow(df)/4)){
            #decile ratio
            df$ratio[i] <- "Decile Ratio"

            if(ceiling(df$cumanteilmerkmal[i]) <= 11){
                df$group[i] <- "bottom"
            }else if(ceiling(df$cumanteilmerkmal[i]) <= 91){
                df$group[i] <- "mid"
            }else{
                df$group[i] <- "top"
            }
        }
        for(i in (nrow(df)/4+1):(nrow(df)/2)){
            #quintile ratio
            df$ratio[i] <- "Quintile Ratio"

            if(ceiling(df$cumanteilmerkmal[i]) <= 21){
              df$group[i] <- "bottom"
            }else if(ceiling(df$cumanteilmerkmal[i]) <= 81){
              df$group[i] <- "mid"
            }else{
              df$group[i] <- "top"
            }
        }
        for(i in (nrow(df)/2+1):(nrow(df)*(3/4))){
            #palma ratio
            df$ratio[i] <- "Palma Ratio"

            if(ceiling(df$cumanteilmerkmal[i]) <= 41){
              df$group[i] <- "bottom"
            }else if(ceiling(df$cumanteilmerkmal[i]) <= 91){
              df$group[i] <- "mid"
            }else{
              df$group[i] <- "top"
            }
        }
        for(i in (nrow(df)*(3/4)+1):(nrow(df))){
          #own ratio
          df$ratio[i] <- "Own Ratio"

          if(ceiling(df$cumanteilmerkmal[i]) <= ownbottom + 1){
            df$group[i] <- "bottom"
          }else if(ceiling(df$cumanteilmerkmal[i]) <= 100 - owntop + 1){
            df$group[i] <- "mid"
          }else{
            df$group[i] <- "top"
          }
        }
        
        df$ratio <- factor(df$ratio, levels = c("Decile Ratio", "Quintile Ratio", "Palma Ratio", "Own Ratio"))
        df$group <- factor(df$group, levels = c("top", "mid", "bottom"))
        
        return(df)
          
    }


#-----------------------HHI Index rectdat

rectdat <- 
  
  function(vec){
    dat <- finalDT_inc(vec)
    #print(dat)
    
    xtop <- dat$cumanteiltraeger[2:length(dat$cumanteiltraeger)]
    ytop <- dat$cumanteilmerkmal[2:length(dat$cumanteiltraeger)]
    ybottom <- dat$cumanteilmerkmal[1:length(dat$cumanteiltraeger)-1]
    xbottom <- xtop -(ytop-ybottom)
    
    xtop    <- insert(xtop, 1, 0)
    xbottom <- insert(xbottom, 1, 0)
    ytop    <- insert(ytop, 1, 0)
    ybottom <- insert(ybottom, 1, 0)
    
    
    back <- data.table(dat, ytop, xtop, ybottom, xbottom)
    return(back)
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

    back <- data.table(Value = as.integer(vec), 
                       Share = round(pi,4), 
                       log_of_share = round(lpi, 4), 
                       neg_Product_share_and_ld = round(result, 4))
    return(round(back, 4))
  }


ge_dat <- 
  
  function(vec){
    
    if(any(vec <0)) stop("negative  number found")    #exception negative number in vector
    if(length(vec)==0) stop("empty vector")               #exception no value in vector
    if(sum(vec)==0) stop("no values")
    
    alphas <- c(-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, 3)
    ent <- c()
    
    for(i in 1:11){
      ent[i] <- round(ineq::entropy(vec, alphas[i]), 3)
    }
    
    back <- data.table(AlphaValue = alphas, 
                       GeneralEntropy = ent)
    
    return(back)
    
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





      
#sum(vec[1]:floor(vec[i]))
y <-  c(1, 3, 6, 9, 12, 15, 19, 23, 27, 35, 48, 55, 59, 72, 85, 97, 100, 114, 132, 150, 160, 183)
z <-  c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22)
z2 <-  c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44)
g <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
