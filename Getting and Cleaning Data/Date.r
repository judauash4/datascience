d1 <- data()

d2 <- Sys.Date()
format(d2,"%a %b %d") # Weekday Month Day

as.Date("1jan1960","%d%b%Y") #轉成Date

library(lubridate)

ymd("20140601")

mdy("08/04/2013")

dmy("03-04-2013")

ymd_hms("2011-08-01 10:15:13")

?Sys.timezone

