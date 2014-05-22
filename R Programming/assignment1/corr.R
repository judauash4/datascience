source("complete.R")

corr <- function(directory = "specdata", threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  data <- complete(directory)
  # 只有nobs大於threshold的資料才保留
  subbed <- data[data$nobs>threshold,]
    
  result <- c()
  for(i in subbed$id){
    id_char <- sprintf("%03d.csv", as.numeric(i))
    
    # read in file
    raw_data <- read.csv(paste(directory,"/", id_char,sep=""))
    complete_data <- na.omit(raw_data)
    
    # 對sulfate,nitrate計算相關係數
    result <- append(result, cor(complete_data$sulfate, complete_data$nitrate))
  }  
  return(result)
}




