### XML package ###

library(XML)

url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlParse(url,useInternalNodes=TRUE)

xpathSApply(html,"//title",xmlValue)

xpathSApply(html,"//td[@id='col-citedby']",xmlValue)


### httr package ###

library(httr)

html2 <- GET(url)
html2 <- htmlParse(html2,asText=TRUE)

xpathSApply(html2,"//title",xmlValue)

### with passwords ###

url <- "http://httpbin.org/basic-auth/user/passwd"
page <- GET(url,authenticate("user","passwd"))

names(page)

### keep authentication ###

auth <- handle("http://google.com")
page <- GET(handle=auth,path="/")
page <- GET(handle=auth,path="search")











