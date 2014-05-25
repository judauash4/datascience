############# casting data frames ##################
library(reshape2)
head(mtcars)

mtcars$carname <- row.names(mtcars)

melt_car <- melt(mtcars,
                 id.vars=c("carname","gear","cyl"), # 要留下的column
                 measure.vars=c("mpg","hp")) # 要column轉成value

cyl_data <- dcast(melt_car, cyl ~ variable) # count(variable) group by cyl, variable

cyl_mean <- dcast(melt_car, cyl ~ variable, mean) # mean(variable) group by cyl, variable

############## averaging values ####################
head(InsectSprays)

tapply(InsectSprays$count,InsectSprays$spray,sum) # sum(count) group by spray

# 另一種方式: 先分組,後計算
split_insect <- split(InsectSprays$count,InsectSprays$spray)
count_insect <- lapply(split_insect, sum) # 回傳list
count_insect <- unlist(count_insect) # list轉vector
# 或是...
count_insect <- sapply(split_insect, sum) # 回傳vector






















