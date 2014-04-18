library(sqldf)

data <- read.csv("outcome-of-care-measures.csv",colClasses="character")

colnames(data)[7] <- "s" #state
colnames(data)[2] <- "h" #hospital
colnames(data)[11] <- "ha" #heart attack
colnames(data)[17] <- "hf" #heart failure
colnames(data)[23] <- "p" #pneumonia

data[,11] <- as.numeric(data[,11]) #heart attack
data[,17] <- as.numeric(data[,17]) #heart failure
data[,23] <- as.numeric(data[,23]) #pneumonia

data$ha_rank <- unlist(tapply(data$ha, data$s, function(x) rank(x,ties.method=,na.last=TRUE))) #heart attack ranking
data$hf_rank <- unlist(tapply(data$hf, data$s, function(x) rank(x, ties.method="first"))) #heart failure ranking
data$p_rank <- unlist(tapply(data$p, data$s, function(x) rank(x, ties.method="first"))) #pneumonia ranking


temp <- sqldf("select h,s,ha,ha_rank from data where s='AL' order by ha_rank ")

