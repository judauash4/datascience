pollutantmean <- function(directory="specdata", pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files  
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  if(is.na(pollutant)) return ("missing argument pollutant=?")
  
  new_data_vec <- c()
  
  for(i in id) {
    # format i as 3 digit
    id_char <- sprintf("%03d.csv", as.numeric(i))
    
    # read in file
    raw_data <- read.csv(paste(directory,"/", id_char,sep=""))
    
    # combine dataframe by row
    new_data_vec <- c(new_data_vec, na.omit(raw_data[,pollutant]))
  }
  
  # return the mean of pollutant
  return(mean(new_data_vec))
  
}