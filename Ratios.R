


palma <- 
  
  function(x){
    ownratio(x, 0.4, 0.9)
  }


quintile <- 
  
  function(x){
    ownratio(x, 0.2, 0.8)
  }


decile <- 
  
  function(x){
    ownratio(x, 0.1, 0.9)
  }


ownratio <- 
  
  function(v, poor, rich){
    if(any(v<0)) stop("negative value")
    vecsort <- sort(v)
    richstart <- 100-rich
    print(richstart)
    sumpoor <- sum(vecsort[1:(length(vecsort)*poor/100)])
    sumrich <- sum(vecsort[(length(vecsort)*richstart/100+1):length(vecsort)])
    print(sumrich)
    print(sumpoor)
    return(round((sumrich/sumpoor), digits = 5))
  }


#----------------------------------Ratios

ggratio <- 
  
  function(vec, ownbottom, owntop){
    mycolors <- c("#3a87b3", "#cecdcd", "#aa2d2f")
    
    ggplot(data = finalDT_ratio(vec, ownbottom, owntop)) +
      geom_col(aes(x = ratio, y = shareunits, fill = group, alpha = 0.6)) +
      scale_fill_manual(values = mycolors) +
      theme_minimal() 
    
  }



#--------------------------------Ratio Data

finalDT_ratio <- 
  
  function(vec, ownbottom, owntop){
    df <- finalDT_inc(vec)
    df <- df[-1, ]
    df <- rbind(df, df, df, df)
    
    for(i in 1:(nrow(df)/4)){
      #decile ratio
      df$ratio[i] <- "Decile Ratio"
      
      if(ceiling(df$cumshareunits[i]) <= 11){
        df$group[i] <- "bottom"
      }else if(ceiling(df$cumshareunits[i]) <= 91){
        df$group[i] <- "mid"
      }else{
        df$group[i] <- "top"
      }
    }
    for(i in (nrow(df)/4+1):(nrow(df)/2)){
      #quintile ratio
      df$ratio[i] <- "Quintile Ratio"
      
      if(ceiling(df$cumshareunits[i]) <= 21){
        df$group[i] <- "bottom"
      }else if(ceiling(df$cumshareunits[i]) <= 81){
        df$group[i] <- "mid"
      }else{
        df$group[i] <- "top"
      }
    }
    for(i in (nrow(df)/2+1):(nrow(df)*(3/4))){
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
    for(i in (nrow(df)*(3/4)+1):(nrow(df))){
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
    
    df$ratio <- factor(df$ratio, levels = c("Decile Ratio", "Quintile Ratio", "Palma Ratio", "Own Ratio"))
    df$group <- factor(df$group, levels = c("top", "mid", "bottom"))
    
    return(df)
    
  }



onlyones <- rep(1, 100)