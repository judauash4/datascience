x <- c(1,3,8,25,100)
seq(along.with=x)
seq_along(x) #建立屬於x的index
seq_len(10)


###### 在data內建立新var #####################
data$nearMe <- data$neighborhood %in% c("Roland Park","Homeland")
table(data$nearMe)

data$zipWrong <- ifelse(data$zipCode<0, TRUE, FALSE)
table(data$zipWrong)

###### 在data內建立categorical var ################
data$zipGroups <- cut(data$zipCode,breaks=quantile(data$zipCode))
table(data$zipGroups)
table(data$zipGroups,data$zipCode)

# 更容易的作法
library(Hmisc)
data$zipGroups <- cut2(data$zipCode,g=4)
table(data$zipGroups)


###### 在data內建立factor var ##################
data$zcf <- factor(data$zipCode)
data$zcf[1:10]

###### 更改factor的level #################
d <- sample(c("yes","no"),size=10,replace=TRUE)
new_factor <- factor(d) # Levels: no yes
new_factor <- factor(d,levels=c("yes","no")) # Levels: yes no

as.numeric(new_factor)

