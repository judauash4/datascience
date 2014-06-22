
# select mean(breaks) from warpbreaks group by tension
library(stats)

aggregate(warpbreaks$breaks,list(tension=warpbreaks$tension),mean)

tapply(warpbreaks$breaks,list(tension=warpbreaks$tension),mean)

library(sqldf)
sqldf("select tension, avg(breaks) from warpbreaks group by tension")

# select * from airquality group by month
library(datasets)

split(airquality,airquality$Month)