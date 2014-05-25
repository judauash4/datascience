set.seed(13435)
x <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
x <- x[sample(1:5),]
x$var2[c(1,3)] <- NA
x

########## 條件式 ####################

x[which(x$var2 > 8),] #沒有na,較佳
x(x$var2 > 8, ) #有na,較差

######### 排序 #######################

sort(x$var1)

x[order(x$var1),]

######## plyr排序 ####################
library(plyr)

arrange(x, var1)

arrange(x, desc(var1))

####### 加入column ###################
x$var4 <- rnorm(5) #var4是新的column header

y <- cbind(x, var5=rnorm(5)) #var5是新的column header
