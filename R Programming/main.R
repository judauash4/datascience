require(stats)

names(warpbreaks)

head(warpbreaks)

# select mean(breaks) from warpbreaks group by tension
aggregate(warpbreaks$breaks,list(tension=warpbreaks$tension),mean)

tapply(warpbreaks$breaks,list(tension=warpbreaks$tension),mean)