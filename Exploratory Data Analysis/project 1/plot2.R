data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

data <- subset(data,data$Date %in% c('1/2/2007','2/2/2007'))

dt <- paste(data$Date,data$Time)

data$DateAndTime <- strptime(dt,format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480,height=480)

par(lty=1,lwd=2)

plot(x=data$DateAndTime,y=data$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")

dev.off()





