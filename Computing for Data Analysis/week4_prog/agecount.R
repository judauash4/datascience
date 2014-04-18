agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  if(is.null(age)){
    stop("invalid age!")
  }
  ## Read "homicides.txt" data file
  ## Extract ages of victims; ignore records where no age is given
  temp1 = "(.*)+ "
  temp2 = " years old(.*)+"
  regexp = paste(temp1,age,temp2,sep="")
  ## Return integer containing count of homicides for that age
  con  <- file("homicides.txt",open="r")
  dataVector <- vector()
  totalMatch = 0
  while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
    dataVector <- c(dataVector, oneLine)
    # do stuff
    match <- grepl(regexp,oneLine)
    if(match){
      totalMatch = totalMatch+1
      #print(paste("Line:",length(dataVector)," / Match:",match))
    }
  }
  close(con)
  return(totalMatch)
}