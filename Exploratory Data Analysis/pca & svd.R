### Matrix data ###############
set.seed(12345)
dataMatrix <- matrix(rnorm(400), nrow=40)
par(mar=c(2,2,2,2))
image(1:10, 1:40, t(dataMatrix)[,nrow(dataMatrix):1]) # 40x10 的圖

### Cluster the data ##########
heatmap(dataMatrix)

### Add a pattern #############
set.seed(678910)
for(i in 1:40) {
	# flip a coin
	coinFlip <- rbinom(1,size=1,prob=0.5)
	# if a coin is heads add a common pattern to that row
	if(coinFlip) {
		dataMatrix[i,] <- dataMatrix[i,]+rep(c(0,3),each=5)
	}
}

par(mar=c(2,2,2,2))
image(1:10, 1:40, t(dataMatrix)[,nrow(dataMatrix):1]) # 40x10 的圖

### Patterns in rows and columns #####
hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order,]

par(mfrow=c(1,3))
image(1:10, 1:40, t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1]) # 40x10 的圖
plot(rowMeans(dataMatrixOrdered), 40:1, xlab="Row Mean", ylab="Row", pch=19) # draw row means by row
plot(colMeans(dataMatrixOrdered), 40:1, xlab="Column", ylab="Column Mean", pch=19) # draw column means by column

### Problems #########################
# Find a new set of multivariate variables that are uncorrelated and explain as much variance as possible.
# If you put all the variables together in one matrix, find the best matrix created with fewer variables(lower rank) that explains the original data.

### SVD ##############################
svd1 <- svd(scale(dataMatrixOrdered))

par(mfrow=c(1,3))
plot(svd1$d, xlab="Column", ylab="Singular Value", pch=19)
plot(svd1$d^2/sum(svd1$d^2), xlab="Column", ylab="Prop. of variance explained", pch=19)

### Relationship to PCA ##############
svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale=TRUE)

plot(pca1$rotation[,1], svd1$v[,1], pch=19, xlab="Principal Component 1", ylab="Right Singular Vector 1")
abline(c(0,1))
# PCA == SVD.Right_Singular_Vector


