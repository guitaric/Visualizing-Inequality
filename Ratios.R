
ownratio <- 
  
  function(v, poor, rich){
    if(any(v<0)) stop("negative value")
    vecsort <- sort(v)
    richstart <- 100-rich
    print(richstart)
    sumpoor <- sum(vecsort[1:(length(vecsort)*poor/100)])
    sumrich <- sum(vecsort[(length(vecsort)*(richstart/100)+1):length(vecsort)])
    print(sumrich)
    print(sumpoor)
    return(round((sumrich/sumpoor), digits = 5))
  }

#-----------------
palma <- 
  
  function(x){
    ownratio(x, 40, 10)
  }


quintile <- 
  
  function(x){
    ownratio(x, 20, 20)
  }

decile <- 
  
  function(x){
    ownratio(x, 10, 10)
  }

tenfifty <- 
  
  function(x){
    ownratio(x, 50, 10)
  }


#--------------------------------for share ratios

finalDT_ratio <- 
  
  function(vec, ownbottom, owntop){
    df <- finalDT_inc(vec)
    df <- df[-1, ]
    df <- rbind(df, df, df)
    
    for(i in 1:(nrow(df)/3)){
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
    
    for(i in (nrow(df)/3+1):(nrow(df)*(2/3))){
      #quintile ratio
      df$ratio[i] <- "S20-S20 Ratio"
      
      if(ceiling(df$cumshareunits[i]) <= 21){
        df$group[i] <- "bottom"
      }else if(ceiling(df$cumshareunits[i]) <= 81){
        df$group[i] <- "mid"
      }else{
        df$group[i] <- "top"
      }
    }
    
    for(i in (nrow(df)*(2/3)+1):(nrow(df))){
      #own ratio
      df$ratio[i] <- "Own Ratio"
      
      if(ceiling(df$cumshareunits[i]) <= ownbottom + 1){
        df$group[i] <- "bottom"
      }else if(ceiling(df$cumshareunits[i]) <= 100 - owntop + 1){
        df$group[i] <- "mid"
      }else{
        df$group[i] <- "top"
      }
    }
    
    df$ratio <- factor(df$ratio, levels = c("Palma Ratio", "S20-S20 Ratio", "Own Ratio"))
    df$group <- factor(df$group, levels = c("top", "mid", "bottom"))
    
    return(df)
    
  }

#---------------------for percentile ratios

pratio <-
  
  function(vec, ratio){
    df <- finalDT_inc(vec)
    df <- df[-1, ]
    df <- rbind(df, df)
    
    
    for(i in 1:(nrow(df)/2)){
      #decile ratio
      df$ratio[i] <- "P90:P10 Ratio"
      
    }
    for(i in (nrow(df)/2+1):(nrow(df))){
      #decile ratio
      df$ratio[i] <- "P50:P10 Ratio"
      
    }
    
    df$ratio <- factor(df$ratio, levels = c("P90:P10 Ratio", "P50:P10 Ratio"))
    
    
    if(ratio == "p90p10"){
      hi <- df$amount[min(which(df$ratio == "P90:P10 Ratio" & df$cumsharecomp > 90))]
      lo <- df$amount[min(which(df$ratio == "P90:P10 Ratio" & df$cumsharecomp > 10))]
    } else if(ratio == "p50p10"){
      hi <- df$amount[min(which(df$ratio == "P50:P10 Ratio" & df$cumsharecomp > 50))]
      lo <- df$amount[min(which(df$ratio == "P50:P10 Ratio" & df$cumsharecomp > 10))]
    }
    
    print(hi)
    print(lo)
    return(hi/lo)
    
  }



p90p10 <- 
  
  function(x){
    pratio(x, "p90p10")
  }
    
p50p10 <- 
  
  function(x){
    pratio(x, "950p10")
  }

#----------------------------------ggplot Ratios

ggratio <- 
  
  function(vec, ownbottom, owntop){
    mycolors <- c("#3a87b3", "#cecdcd", "#aa2d2f")
    
    ggplot(data = finalDT_ratio(vec, ownbottom, owntop)) +
      geom_col(aes(x = ratio, y = shareunits, fill = group), alpha = 0.6) +
      scale_fill_manual(values = mycolors) +
      labs(x = "Ratio", y = "Percentage") +
      theme_minimal() 
    
  }

