reviews <- read.csv("./data/reviews-apr29.csv")
solutions <- read.csv("./data/solutions-apr29.csv")

# x join y on x.solution_id and y.id
merged_data <- merge(x=reviews,y=solutions,by.x="solution_id",by.y="id",all=TRUE)
head(merged_data)

intersect(x=names(reviews),y=names(solutions)) # 尋找data之間共有的column












