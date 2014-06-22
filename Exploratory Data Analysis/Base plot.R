# 1 dimentions
## Histogram
hist(pollution$pm25, col="green", breaks=100) #adjust breaks for best plot
rug(pollution$pm25)
abline(v=12,lwd=2)
abline(v=median(pollution$pm25), col="magenta", lwd=4)

## Barplot: for categorical data
barplot(table(pollution$region), col="wheat",main="Number of countries in each region") #table: 次數分配表 

# Multi-dimentions plot
## Boxplot & Histogram
boxplot(pm25 ~ region, data=pollution, col="red")

par(mfrow=c(2,1), mar=c(4,4,2,1))
hist(subset(pollution, region=="east")$pm25, col="green")
hist(subset(pollution, region=="west")$pm25, col="green")

## Scatterplot
with(pollution, plot(latitude, pm25, col="region"))

par(mfrow=c(1,2), mar=c(5,4,2,1))
with(subset(pollution, region=="east"), plot(latitude, pm25, main="East"))
with(subset(pollution, region=="west"), plot(latitude, pm25, main="West"))

######### par(): global variable ##########
# las: axis label orientation
# bg: background color
# mar: margin size
# oma:outer margin size
# mfrow: number of plots per row & column(filled in row-wise)
# mfcol: number of plots per row & column(filled in column-wise)
######### plotting params ###############
# pch:plotting symbol
# lty:line type
# lwd:line width
# col:color
# xlab:x label
# ylab:y label
########## plotting functions ##############
plot
lines
points
text(x, y, "Some text at (x,y)")
title("My title")
mtext
axis
legend("topright", legend="My legend")
abline(lm(x,y), lwd=2, col="red")