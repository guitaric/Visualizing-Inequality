


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
      geom_col(aes(x = ratio, y = anteilmerkmal, fill = group, alpha = 0.6)) +
      scale_fill_manual(values = mycolors) +
      theme_minimal() 
    
  }
