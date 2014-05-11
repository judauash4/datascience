x <- Sys.time()
ct <- as.POSIXct(x)
lt <- as.POSIXlt(x)

d <- c("2012/12/25","2013/11/10")
y <- strptime(x=d, format="%Y/%m/%d")
