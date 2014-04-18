library(reshape)
library(sqldf)

rankall <- function(outcome, num="best"){
  data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  data[,11] <- as.numeric(data[,11]) #heart attack
  data[,17] <- as.numeric(data[,17]) #heart failure
  data[,23] <- as.numeric(data[,23]) #pneumonia
  
  colnames(data)[7] <- "s" #state
  colnames(data)[2] <- "h" #hospital
  colnames(data)[11] <- "ha" #heart attack
  colnames(data)[17] <- "hf" #heart failure
  colnames(data)[23] <- "p" #pneumonia
  
  if(!(outcome %in% c("heart attack","heart failure","pneumonia"))) {
    stop("invalid outcome")
  }
  
  if(outcome == "heart attack" ){
    subdata <- data[, c("s","h","ha")]
    colnames(subdata)[3] <- "d" #把ha改成d
    return(pickdata(subdata, num))
  }
  else if(outcome == "heart failure"){
    subdata <- data[, c("s","h","hf")]
    colnames(subdata)[3] <- "d" #把hf改成d
    return(pickdata(subdata, num))
  }
  else if(outcome == "pneumonia"){
    subdata <- data[, c("s","h","p")]
    colnames(subdata)[3] <- "d" #把p改成d
    return(pickdata(subdata, num))
  }
}

pickdata <- function(subdata, num){ 
  if(num == "best"){ #每一州的min
    byState <- sqldf("select s ,min(d) as d from subdata group by s")
    result <- sqldf("select subdata.h, subdata.s  
                    from subdata join byState 
                    on subdata.s=byState.s and subdata.d=byState.d")
    return(result)
    
  }else if(num == "worst"){ #每一州的max
    byState <- sqldf("select s ,max(d) as d from subdata group by s")
    result <- sqldf("select subdata.h, subdata.s 
                    from subdata join byState 
                    on subdata.s=byState.s and subdata.d=byState.d")
    return(result)
    
  }else if(is.numeric(num)){ 
    #..............
  }else{
    return(subdata[, c("h","s")])
  }
}


best <- rankall("heart attack","best")
worst <- rankall("heart failure","worst")

head(rankall("heart attack", 20), 10)

tail(rankall("pneumonia", "worst"), 3)

tail(rankall("heart failure"), 10)




