library(ggplot2)

# 散佈圖
qplot(x=displ, y=hwy, data=mpg, color=manufacturer)

# 加入線性迴歸線
qplot(x=displ, y=hwy, data=mpg, geom=c("point","smooth"), method="lm")

# 用color分類
qplot(x=displ, y=hwy, data=mpg, geom=c("point","smooth"), color=class)

# 用facets分類
qplot(x=displ, y=hwy, data=mpg, geom=c("point"), facets=class~cyl)

# 密度圖
qplot(x=log(displ),data=mpg, geom="density", color=manufacturer)