url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"

setInternet2(use=TRUE)
download.file(url, destfile="./data/rest.csv", method="auto") #下載失敗

data <- read.csv("./data/rest.csv")

head(data,n=3)
tail(data,n=3)
str(data)

quantile(data$councilDistrict,na.rm=TRUE)
quantile(data$councilDistrict,probs=c(0.5,0.75,0.9))

table(data$zipCode) #一維table

table(data$councilDistrict,data$zipCode) #二維table

sum(is.na(data$councilDistrict))
any(is.na(data$councilDistrict))
colSums(is.na(data))

all(data$zipCode >0)

table(data$zipCode %in% c("21212")) # 只會回傳true false的count
table(data$zipCode %in% c("21212","21213"))

######### 條件式篩選資料 ###################################

x <- data[which(data$zipCode %in% c("21212")),] #條件: row number
y <- data[data$zipCode %in% c("21212"),] #條件: true false

######### Cross Table #######################
data(UCBAdmissions)
df = as.data.frame(UCBAdmissions)
summary(df)

xt <- xtabs(Freq~Gender+Admit,data=df) #列: Gender; 行: Admit; 數字: Freq


warpbreaks$replicate <- rep(1:9,len=54)
xt <- xtabs(breaks~.,data=warpbreaks) #多維table
ftable(xt)#flat table, 類似excel的








