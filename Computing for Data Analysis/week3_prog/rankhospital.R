rankhospital <- function(state, outcome, num="best"){
  data <- read.csv("outcome-of-care-measures.csv",colClasses="character")
  data[,11] <- as.numeric(data[,11]) #heart attack
  data[,17] <- as.numeric(data[,17]) #heart failure
  data[,23] <- as.numeric(data[,23]) #pneumonia
  
  if(!(state %in% data$State)) {
    stop("invalid state") 
  }
  if(!(outcome %in% c("heart attack","heart failure","pneumonia"))) {
    stop("invalid outcome")
  }
  
  subdata <- subset(data, data[,7]==state)  
  
  if(outcome == "heart attack" ){
    subdata <- subdata[order(subdata[,11], subdata[,2]),] #排序
    subdata <- subset(subdata, !is.na(subdata[,11])) #過濾na
    return(pickdata(subdata, num))
  }
  else if(outcome == "heart failure"){
    subdata <- subdata[order(subdata[,17], subdata[,2]),] #排序
    subdata <- subset(subdata, !is.na(subdata[,17])) #過濾na
    return(pickdata(subdata, num))
  }
  else if(outcome == "pneumonia"){
    subdata <- subdata[order(subdata[,23], subdata[,2]),] #排序
    subdata <- subset(subdata, !is.na(subdata[,23])) #過濾na
    return(pickdata(subdata, num))
  }
}

pickdata <- function(data, num){ #data是已排序好的資料
  if(num == "best"){ #best就是第1筆資料
    return(data[1,]$Hospital.Name)
  }else if(num == "worst"){ #worst就是最後1筆資料
    return(data[nrow(data),]$Hospital.Name)
  }else if(num > nrow(data)){ #若num超出範圍
    return(NA)
  }else{
    return(data[num,]$Hospital.Name)
  }
}


