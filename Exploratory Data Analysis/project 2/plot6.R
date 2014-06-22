# 5. Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# change year into factor level
NEI$year <- factor(NEI$year)

# only Motor Vehicles & Baltimore related data will be used
row <- grep("(.*)+Vehicles(.*)+",SCC$SCC.Level.Two)

SCC_Vehicles <- SCC[row,"SCC"]

NEI_Vehicles_BOTH_CITY <- NEI[NEI$SCC %in% SCC_Vehicles 
                              & NEI$fips %in% c('06037','24510'),]

# create a new var 'city' for the purpose of human readable
NEI_Vehicles_BOTH_CITY[NEI_Vehicles_BOTH_CITY$fips == '06037',"city"] <- "LA"

NEI_Vehicles_BOTH_CITY[NEI_Vehicles_BOTH_CITY$fips == '24510',"city"] <- "BA"

# aggreate the total emission data by year & city
data <- aggregate(NEI_Vehicles_BOTH_CITY$Emissions,
                  by=list(year=NEI_Vehicles_BOTH_CITY$year,
                          city=NEI_Vehicles_BOTH_CITY$city),
                  FUN=sum)

# drawing plot
png(filename="plot6.png",width=480,height=480)


qplot(year,x,data=data,facets=.~city,
      ylab="PM2.5 Total Emission (tons)",
      xlab="Year",
      main="PM2.5 Total Emission from Vehicles in Baltimore & Los Angles(tons)",
      stat="identity",geom="bar",fill=city)


dev.off()