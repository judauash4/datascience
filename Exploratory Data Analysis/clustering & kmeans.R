set.seed(1234)
par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(2:4,each=4),sd=0.2)
df <- data.frame(x,y)

library(ggplot2)
qplot(x,y,df) # no labe > bad

g <- ggplot(df,aes(x,y))
#p <- g + geom_point() + geom_text(aes(label=paste(round(x,1),round(y,1),sep=",")),hjust=0,vjust=0)
p <- g + geom_point() + geom_text(aes(label=row.names(df)),
                                  hjust=0,vjust=0)
p

distxy <- dist(df)
hClustering <- hclust(distxy)
plot(hClustering)

source('myplclust.R')
myplclust(hClustering, lab=row.names(df), lab.col=rep(1:3,each=4)) 
#lab: label
#lab.col: color for each coluster

########## K-means ##############################

kmeansObj <- kmeans(df,centers=3) # K-means clustering with 3 clusters

names(kmeansObj)

kmeansObj$cluster

plot(x,y,col=kmeansObj$cluster,pch=19)
points(kmeansObj$centers,col=1:3,pch=3,lwd=3)

k <- p + geom_point(data=as.data.frame(kmeansObj$centers),
                    aes(x,y),
                    shape=25,colour="red",fill="red",size=5)
k

########## Heatmaps ##############################

set.seed(1234)
mat <- as.matrix(df)[sample(1:12),]
kmeansObj2 <- kmeans(mat, centers=3)

par(mfrow=c(1,2),mar=c(4,4,4,4))
image(t(mat)[,nrow(mat):1], yaxt="n")
image(t(mat)[,order(kmeansObj2$cluster)], yaxt="n")

