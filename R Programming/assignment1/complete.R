complete <- function(directory = "specdata", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  new_dataset <- data.frame()
  for(i in id){
    # format i as 3 digit
    id_char <- sprintf("%03d.csv", as.numeric(i))
    
    # read in file
    raw_data <- read.csv(paste(directory,"/", id_char,sep=""))
    
    # find complete observations
    nobs <- nrow(raw_data[complete.cases(raw_data),])
    
    new_dataset <- rbind(new_dataset, data.frame("id"=i, nobs))
  }
  return(new_dataset)
}
