outcome <- read.csv(file="outcome-of-care-measures.csv",colClasses="character")
outcome[, 11] <- as.numeric(outcome[, 11])

# par(mfrow=c(3,1))
# 
# heartattack <- as.numeric(outcome[,11])
# hist(heartattack,xlim=c(6.7,21.9),xlab="30-day Death Rate",main="Heart Attack",probability=TRUE)
# lines(density(na.omit(heartattack)),col="red")
# abline(v=median(na.omit(heartattack)),col="red")
# 
# heartfailure <- as.numeric(outcome[,17])
# hist(heartfailure,xlim=c(6.7,21.9),xlab="30-day Death Rate",main="Heart Failure",probability=TRUE)
# lines(density(na.omit(heartfailure)),col="red")
# abline(v=median(na.omit(heartfailure)),col="red")
# 
# pneumonia <- as.numeric(outcome[,23])
# hist(pneumonia,xlim=c(6.7,21.9),xlab="30-day Death Rate",main="Pneumonia",probability=TRUE)
# lines(density(na.omit(pneumonia)),col="red")
# abline(v=median(na.omit(pneumonia)),col="red")

# x <- table(outcome$State)
# y <- subset(x, x>20)
# outcome2 <- subset(outcome, outcome$State %in% names(y))
# death <- outcome2[,11]
# state <- outcome2$State
# state_reorder <- reorder(state,death,median,na.rm=TRUE)
# boxplot(death ~ state_reorder)

hospital <- read.csv(file="hospital-data.csv", colClasses="character")
outcome.hospital <- merge(outcome,hospital,by="Provider.Number")
death <- as.numeric(outcome.hospital[,11])
npatient <- as.numeric(outcome.hospital[,15])
owner <- factor(outcome.hospital$Hospital.Ownership)


## Part.4
library(lattice)
myPanel <- function(x,y){
  panel.xyplot(x,y)
  panel.lmline(x,y)
}
xyplot(death~npatient|owner,
       panel=myPanel,
       xlab="Number of Patients Seen",
       ylab="30-Day Death Rate",
       main="Heart Attack")

## Part.5



