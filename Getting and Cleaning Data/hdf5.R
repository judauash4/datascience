source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)
path<- "./data/example.h5"

created <- h5createFile(path)

created <- h5createGroup(path,"foo")
created <- h5createGroup(path,"baa")
created <- h5createGroup(path,"foo/foobaa")

h5ls(path)

A <- matrix(1:10,nrow=5,ncol=2)
h5write(A,path,"foo/A")
h5ls(path)

B <- array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B,"scale") <- "liter"
h5write(B,path,"foo/foobaa/B")
h5ls(path)

C <- data.frame(1L:5L,seq(0,1,length.out=5),
                stringsAsFactors=FALSE,
                c("ab","cd","ef","gh","ij"))
h5write(C,path,"foo/C")
h5ls(path)

rA <- h5read(path,"foo/A")
rB <- h5read(path,"foo/foobaa/B")
rC <- h5read(path,"foo/C")










