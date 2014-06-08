data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

sub_data <- subset(data,data$Date %in% c('1/2/2007','2/2/2007'))

dt <- paste(sub_data$Date,sub_data$Time)

sub_data$DateAndTime <- strptime(dt,format="%d/%m/%Y %H:%M:%S")

png(filename="plot1.png",width=480,height=480)

hist(sub_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()


