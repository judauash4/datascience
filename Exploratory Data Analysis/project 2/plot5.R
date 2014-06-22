# 5. How have emissions from motor vehicle sources changed 
# from 1999–2008 in Baltimore City?


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# change year into factor level
NEI$year <- factor(NEI$year)

# only Motor Vehicles & Baltimore related data will be used
row <- grep("(.*)+Vehicles(.*)+",SCC$SCC.Level.Two)

SCC_Vehicles <- SCC[row,"SCC"]

NEI_Vehicles <- NEI[NEI$SCC %in% SCC_Vehicles & NEI$fips == '24510',]

# aggreate the total emission data by year
data <- aggregate(NEI_Vehicles$Emissions,
                  by=list(year=NEI_Vehicles$year),
                  FUN=sum)

# drawing plot
png(filename="plot5.png",width=480,height=480)

barplot(data$x,
        xlab="Year",
        ylab="PM2.5 Total Emission from Vehicles in Baltimore(tons)",
        names.arg=data$year,
        yaxt="n",
        main="PM2.5 Total Emission from Vehicles in Baltimore",
        col="Orange")
axis(2, axTicks(2), format(axTicks(2), scientific = F))

dev.off()