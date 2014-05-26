d <- read.csv(file="./data/getdata-data-ss06hid.csv",header=TRUE)

temp <- d[(d$ACR==3 & d$AGS==6),]

agricultureLogical <- d$ACR==3 & d$AGS==6

which(agricultureLogical)

library(jpeg)
temp <- readJPEG(source="./data/getdata-jeff.jpg",native=TRUE)

quantile(temp,probs=c(0.3,0.8))

gdp <- read.csv(file="./data/getdata-data-GDP.csv",header=FALSE)

education <- read.csv(file="./data/getdata-data-EDSTATS_Country.csv",header=TRUE)

sum(gdp$V1 %in% education[,"CountryCode"])

m <- merge(x=gdp,y=education,by.x="V1",by.y="CountryCode")

q4 <- aggregate(m[,"V2"],by=list(m$Income.Group),FUN=mean)

library(Hmisc)

m$q5 <- cut2(m$V2,g=5)
m[,c("V1","V2","q5")]

