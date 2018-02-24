              
                   ##### basic vizualization ########


setwd("C:/Users/Administrator/Downloads/saidatasets")
fin <- read.csv("Future-500.csv",na.strings = c(""))
getwd()
head(fin)
tail(fin)
str(fin)
dim(fin)
summary(fin)
View(fin)  #from here we understand that id and inception should be facotors which are by default of integer type"
 
#so now that change those columns into factor and then override that column

fin$ID<- factor(fin$ID)
fin$ID
class(fin$ID)

fin$Inception<- factor(fin$Inception)
fin$Inception
class(fin$Inception)

#now remove the $,%,Dollars from the columns(Revenue,Expenses,Growth)

#fin$Revenue <- gsub("$","",fin$Revenue)
#fin$Revenue <- gsub("\\$","",fin$Revenue)
#fin$Revenue
#class(fin$Revenue)
#fin$Revenue <- as.numeric(fin$Revenue)
#class(fin$Revenue)

#fin$Growth
#fin$Growth <- gsub("  %","",fin$Growth)
#fin$Growth <- gsub("\\%","",fin$Growth)
#fin$Growth
#class(fin$Growth)
#fin$Growth<- as.numeric(fin$Growth)
#class(fin$Growth)

#View(fin)

#gsub doesnt work since the values are regular expressions, so 
#use stringr package to replace them and then override them


library("stringr")

fin$Growth <- str_replace_all(fin$Growth,"%","")
class(fin$Growth)
fin$Growth <- as.numeric(fin$Growth)
class(fin$Growth)


# Removing the $ sign. We use to covey the expression as a regular expression
# which is denoted inside a []

fin$Revenue<- str_replace_all(fin$Revenue,"[$,]","")
# removing the space in front and behind the numbers
fin$Revenue <- str_trim(fin$Revenue)
fin$Revenue <- as.numeric(fin$Revenue)
class(fin$Revenue)


# Removing the Dollars. We use to covey the expression as a regular expression
# which is denoted inside a []
fin$Expenses<- str_replace_all(fin$Expenses,"[Dollars,]","")
# removing the space in front and behind the numbers
fin$Expenses <- str_trim(fin$Expenses)
fin$Expenses <- as.numeric(fin$Expenses)
class(fin$Expenses)

View(fin)

head(fin)
str(fin)
summary(fin)

#here we find NA's. So now remove the NA

?complete.cases

complete.cases(fin)
!complete.cases(fin)

fin <- fin[complete.cases(fin),]
View(fin[complete.cases(fin),])
summary(fin[complete.cases(fin),])

View(fin)
#now the data is clean without NA's and mossing values.

#visualize using ggplot which shows industry trends fro expenses-revenue relationship

library(ggplot2)
p <- ggplot(data=fin)
p

p + geom_point(aes(x = Revenue, y = Expenses))
p + geom_point(aes(x = Revenue, y = Expenses, colour = Industry))
p + geom_point(aes(x = Revenue, y = Expenses, colour = Industry, size = Profit))

p + geom_point(aes(x = Revenue, y = Expenses, colour = Industry)) + 
          geom_smooth(aes(x = Revenue, y = Expenses, colour = Industry))

d <- ggplot(data = fin, aes(x = Revenue, y = Expenses, colour = Industry ))
d

d + geom_point() + geom_smooth()

d + geom_point() + geom_smooth(fill=NA, size=1.1)

#here the boxplot is used to show growth by industry 
f <- ggplot(data = fin, aes(x = Revenue, y = Growth, colour = Industry ))
f

f + geom_boxplot()
f + geom_boxplot(size = 0.5)

f + geom_jitter() + geom_boxplot(size = 0.5)

f + geom_jitter() + geom_boxplot(size = 0.5, alpha = 0.3)










