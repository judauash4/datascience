data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

data <- subset(data,data$Date %in% c('1/2/2007','2/2/2007'))

dt <- paste(data$Date,data$Time)

data$DateAndTime <- strptime(dt,format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png",width=480,height=480)

par(lty=1,lwd=2)

plot(x=data$DateAndTime,y=data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(x=data$DateAndTime,y=data$Sub_metering_1,col="black")
lines(x=data$DateAndTime,y=data$Sub_metering_2,col="red")
lines(x=data$DateAndTime,y=data$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()





