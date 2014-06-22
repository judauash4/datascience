# 1. Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, 
# make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# change year into factor level
NEI$year <- factor(NEI$year)

# aggreate the total emission data by year
data <- aggregate(NEI$Emissions,by=list(year=NEI$year),FUN=sum)

# drawing plot
png(filename="plot1.png",width=480,height=480)

barplot(data$x,
        xlab="Year",
        ylab="PM2.5 Total Emission (tons)",
        names.arg=data$year,
        yaxt="n",
        main="PM2.5 Total Emissions from all sources",
        col="Green")
axis(2, axTicks(2), format(axTicks(2), scientific = F))

dev.off()