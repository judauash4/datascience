
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
    subdata <- na.omit(data[, c("s","h","ha")])
    colnames(subdata)[3] <- "d" #把ha改成d
    return(pickdata(subdata, num))
  }
  else if(outcome == "heart failure"){
    subdata <- na.omit(data[, c("s","h","hf")])
    colnames(subdata)[3] <- "d" #把hf改成d
    return(pickdata(subdata, num))
  }
  else if(outcome == "pneumonia"){
    subdata <- na.omit(data[, c("s","h","p")])
    colnames(subdata)[3] <- "d" #把p改成d
    return(pickdata(subdata, num))
  }
}

pickdata <- function(subdata, num){ 
  if(num == "best"){ #每一州的min
    state_data <- split(subdata,subdata$s) #依據state分割subdata
    result_list <- lapply(state_data,
                          function(x) {
                            x <- x[order(x$d,x$h),]
                            x[1,c("h","s")]
                          }
    )
    result_df <- do.call(rbind.data.frame, result_list)
    names(result_df) <- c("hospital","state")
    return(result_df)
    
  }else if(num == "worst"){ #每一州的max
    state_data <- split(subdata,subdata$s) #依據state分割subdata
    result_list <- lapply(state_data,
                          function(x) {
                            x <- x[order(x$d,x$h),]
                            x[nrow(x),c("h","s")]
                          }
    )
    result_df <- do.call(rbind.data.frame, result_list)
    names(result_df) <- c("hospital","state")
    return(result_df)
    
  }else if(is.numeric(num)){ 
    state_data <- split(subdata,subdata$s) #依據state分割subdata
    result_list <- lapply(state_data,
                          function(x) if(nrow(x)<num){
                            c(NA,x[1,"s"])
                          }else{
                            x <- x[order(x$d,x$h),]
                            x[num,c("h","s")]
                          }
    )
    result_df <- do.call(rbind.data.frame, result_list)
    names(result_df) <- c("hospital","state")
    return(result_df)
  }
}

# 
# best <- rankall("heart attack","best")
# worst <- rankall("heart failure","worst")
# 
# head(rankall("heart attack", 20), 10)
# 
# rankall("pneumonia", "worst")
# tail(rankall("pneumonia", "worst"), 3)
# 
# tail(rankall("heart failure"), 10)




