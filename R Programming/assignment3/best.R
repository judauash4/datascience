best <- function(state, outcome){
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
    irow <- which.min(subdata[,11])
    print(subdata[irow,]$Hospital.Name)
  }
  else if(outcome == "heart failure"){
    irow <- which.min(subdata[,17])
    print(subdata[irow,]$Hospital.Name)
  }
  else if(outcome == "pneumonia"){
    irow <- which.min(subdata[,23])
    print(subdata[irow,]$Hospital.Name)
  }
}