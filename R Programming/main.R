library(datasets)
data(iris)

temp <- aggregate(x=iris[,1:4],
                  by=list(species=iris$Species),
                  FUN=mean,
                  na.rm=TRUE)

temp2 <- apply(iris[, 1:4], 2, mean)


library(datasets)
data(mtcars)

temp3 <- sapply(split(mtcars$mpg, mtcars$cyl), mean)
temp4 <- sapply(split(mtcars$hp, mtcars$cyl), mean)
abs(temp4["4"]-temp4["8"])



