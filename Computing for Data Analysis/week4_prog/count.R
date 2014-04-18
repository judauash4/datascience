count <- function(cause=NULL){
  ## Check that "cause" is non-NULL; else throw error
  if(is.null(cause)){
    stop("invalid cause!")
  }
  ## Check that specific "cause" is allowed; else throw error
  if(!(cause %in% c("asphyxiation","blunt force","other","shooting","stabbing","unknown"))){
    stop("invalid cause!")
  }else if(cause == "asphyxiation"){
    regexp = "(.*)+Cause: [Aa]sphyxiation(.*)+"
  }else if(cause == "blunt force"){
    regexp = "(.*)+Cause: [Bb]lunt [Ff]orce(.*)+"
  }else if(cause == "other"){
    regexp = "(.*)+Cause: [Oo]ther(.*)+"
  }else if(cause == "shooting"){
    regexp = "(.*)+Cause: [Ss]hooting(.*)+"
  }else if(cause == "stabbing"){
    regexp = "(.*)+Cause: [Ss]tabbing(.*)+"
  }else if(cause == "unknown"){
    regexp = "(.*)+Cause: [Uu]nknown(.*)+"
  }
  ## Read "homicides.txt" data file
  ## Extract causes of death
  ## Return integer containing count of homicides for that cause
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

