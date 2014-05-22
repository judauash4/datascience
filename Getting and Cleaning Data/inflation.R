if(Sys.getenv("JAVA_HOME") != "") Sys.setenv("JAVA_HOME"="")
library(xlsx)

# 打開excel檔
url <- "./data/weoreptc.xlsx"
data <- read.xlsx(file=url,sheetIndex=1,header=TRUE)

# 取出屬於通彭資料的列
inflation <- data[grep("Inflation",data$Subject.Descriptor),]

library(reshape)

# 定義不要的欄位
ex_col <- names(inflation) %in% c("Subject.Descriptor", 
                              "Units", 
                              "Scale", 
                              "Country.Series.specific.Notes",
                              "Estimates.Start.After")
# 拿掉不必要的欄位
inflation <- inflation[,!ex_col] 

# 轉換成可以繪圖的格式
inflation <- melt(inflation,id=c("Country"))
inflation <- rename(inflation, c(variable="Year",value="Inflation.Rate"))

library(ggplot2)

ggplot(inflation,
       aes(x=Year,y=Inflation.Rate,colour=Country,group=Country))
      +geom_point()
      +geom_line()



