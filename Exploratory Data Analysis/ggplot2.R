# ggplot2
# aesthetic attributes(colour, shape, size)
# geometric objects(points, lines, bars)
str(mpg)

# scatterplot with smooth geom
qplot(x=displ, y=hwy, data=mpg, color=drv, geom=c("point","smooth"))

# histogram
qplot(hwy, data=mpg, fill=drv)

# scatterplot with facets
qplot(displ, hwy, data=mpg, facets=.~drv)

# histogram with facets
qplot(hwy, data=mpg, facets=drv~., binwidth=2)

##################################################
str(maacs)

# histogram of eNO
qplot(log(eno), data=maacs)

# histogram by group
qplot(log(eno), data=maacs, fill=mopos)

# density
qplot(log(eno), data=maacs, geom="density")

qplot(log(eno), data=maacs, geom="density", color=mopos)

# scatterplot eNO vs. PM2.5
qplot(log(pm25), log(eno), data=maacs, color=mopos, geom=c("point","smooth"), method="lm")

##################################################
# Building plots with ggplot2

# plots are built up in layers:
## plot the data
## overlay a summary
## metadata and annotations

g <- ggplot(maacs, aes(logpm25, NocturnalSympt)) # no plot yet!
p <- g + geom_point()
print(p) #print out

# or just print out
g + geom_point() + geom_smooth()

g + geom_point() + geom_smooth(method="lm")

# adding more layers: facets
g + geom_point() + facets_grid(.~bmicat) + geom_smooth(method="lm")

# aesthetic
g + geom_point(color="steelblue",size=4,alpha=1/2) # using 'Constant Variables'
g + geom_point(aes(color=bmicat),size=4,alpha=1/2) # using 'Data Variables'

# labels
g + geom_point(aes(color=bmicat)) + labs(title="MAACS Cohort") + labs(x=expression("log " * PM[2.5]), y="Nocturnal Symptoms")

# axis limits
g + geom_line() + ylim(-3, 3) # outliers missing

g + geom_line() + coord_cartesian(ylim=c(-3, 3)) # outliers included

