####### CSV ######

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

# R will make use of the ‘internet2.dll’ library for Internet access, 
# which makes use of Internet Explorer functions
setInternet2(use=TRUE)

download.file(fileUrl, destfile="./data/q1.csv", method="auto")

list.files("./data")

q1 <- read.csv("./data/q1.csv")



####### EXCEL ######
# erase environment variable JAVA_HOME, so that rJava could start properly
if(Sys.getenv("JAVA_HOME") != "") Sys.setenv("JAVA_HOME"="")

library(xlsx) # requires java
library(XLConnect) # requires java
#library(gdata) # requires python

fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"

download.file(fileUrl, destfile="./data/cameras.xlsx", method="auto")

list.files("./data")

cameraData <- read.xls(xls="./data/cameras.xlsx",sheet=1)


####### XML ######
library(XML)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc <- xmlTreeParse(fileUrl,useInternal=TRUE)

root <- xmlRoot(doc)

xmlName(root)

names(root)

xpathSApply(root,"//name",xmlValue)

xpathSApply(root,"//price",xmlValue)
