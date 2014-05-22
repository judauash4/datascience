### Q2 ###

library(sqldf)

path <- "./data/acs.csv"
acs <- read.csv(file=path,header=TRUE)
sqldf("select pwgtp1 from acs where AGEP < 50")


### Q4 ###

library(XML)

path <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(path)
data <- readLines(con,n=100)
close(con)

nchar(data[10])
nchar(data[20])
nchar(data[30])
nchar(data[100])

### Q5 ###

path <- "./data/getdata-wksst8110.csv"
data <- read.csv(path,header=TRUE)

sum(data[,"SST.1"])







