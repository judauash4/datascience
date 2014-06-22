# 2. Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this 
# question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# change year into factor level
NEI$year <- factor(NEI$year)

# only Baltimore data will be used
NEI_Baltimore <- NEI[NEI$fips == '24510',]

# aggreate the total emission data by year
data <- aggregate(NEI_Baltimore$Emissions,by=list(year=NEI_Baltimore$year),FUN=sum)

# drawing plot
png(filename="plot2.png",width=480,height=480)

barplot(data$x,xlab="Year",
        ylab="PM2.5 Total Emission (tons)",
        names.arg=data$year,
        yaxt="n",
        main="PM2.5 Total Emissions in Baltimore",col="Wheat")
axis(2, axTicks(2), format(axTicks(2), scientific = F))

dev.off()