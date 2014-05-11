fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

# R will make use of the ‘internet2.dll’ library for Internet access, 
# which makes use of Internet Explorer functions
setInternet2(use=TRUE)

download.file(fileUrl, destfile="./data/cameras.csv", method="auto")

list.files("./data")

cameraData <- read.csv("./data/cameras.csv")

####### EXCEL ######
#library(xlsx)
library(XLConnect)
#library(gdata)

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"

download.file(fileUrl, destfile="./data/cameras.xlsx", method="auto")

list.files("./data")

cameraData <- read.xls(xls="./data/cameras.xlsx",sheet=1)


####### XML ######
library(XML)

fileUrl <- "http://www.w3schools.com/xml/simple.xml"

doc <- xmlTreeParse(fileUrl,useInternal=TRUE)

root <- xmlRoot(doc)

xmlName(root)

names(root)

xpathSApply(root,"//name",xmlValue)

xpathSApply(root,"//price",xmlValue)
