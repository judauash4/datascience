# 3. Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# change year into factor level
NEI$year <- factor(NEI$year)

# only Baltimore data will be used
NEI_Baltimore <- NEI[NEI$fips == '24510',]

# aggreate the total emission data by year
data <- aggregate(NEI_Baltimore$Emissions,
                  by=list(year=NEI_Baltimore$year,type=NEI_Baltimore$type),
                  FUN=sum)

# drawing plot
png(filename="plot3.png",width=480,height=480)

qplot(year,x,data=data,facets=.~type,
      ylab="PM2.5 Total Emission (tons)",
      xlab="Year",
      stat="identity",geom="bar",fill=type)

dev.off()