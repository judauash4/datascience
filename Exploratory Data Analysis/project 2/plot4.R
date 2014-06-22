# 4. Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# change year into factor level
NEI$year <- factor(NEI$year)

# only Coal Combustion related data will be used
row <- grep("(.*)+Comb(.*)+Coal(.*)+",SCC$Short.Name)

SCC_Coal_Combustion <- SCC[row,"SCC"]

NEI_Coal_Combustion <- NEI[NEI$SCC %in% SCC_Coal_Combustion,]

# aggreate the total emission data by year
data <- aggregate(NEI_Coal_Combustion$Emissions,
                  by=list(year=NEI_Coal_Combustion$year),
                  FUN=sum)

# drawing plot
png(filename="plot4.png",width=480,height=480)

barplot(data$x,
        xlab="Year",
        ylab="PM2.5 Total Emission from Coal Combustion(tons)",
        names.arg=data$year,
        yaxt="n",
        main="PM2.5 Total Emission from Coal Combustion",
        col="Blue")
axis(2, axTicks(2), format(axTicks(2), scientific = F))

dev.off()