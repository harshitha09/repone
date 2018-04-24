# Murders age group wise
"PS5 : Murders age group wise"

set.seed(12345)
setwd("E://data visualization/Data Set/rajanand-crime-in-india")
murder <- read.csv("32_Murder_victim_age_sex.csv", na.strings = "NULL")
write.csv("muredrfile.csv",x = murder)
View(murder)
dim(murder)

require(Hmisc) #to impute missing data
require(ggplot2) #to visualize
require(reshape2) #data transformation
require(tidyr) #data transformation
require(dplyr) #data manipulation
colSums(is.na(murder)) #checking the na values

boxplot(murder$Victims_Above_50_Yrs)
boxplot(murder$Victims_Upto_10_15_Yrs)
boxplot(murder$Victims_Upto_10_Yrs)
boxplot(murder$Victims_Upto_15_18_Yrs)
boxplot(murder$Victims_Upto_18_30_Yrs)
boxplot(murder$Victims_Upto_30_50_Yrs)

murder$Victims_Above_50_Yrs <- impute(murder$Victims_Above_50_Yrs,median)
murder$Victims_Upto_10_15_Yrs <- impute(murder$Victims_Upto_10_15_Yrs,median)
murder$Victims_Upto_10_Yrs <- impute(murder$Victims_Upto_10_Yrs,median)
murder$Victims_Upto_15_18_Yrs <- impute(murder$Victims_Upto_15_18_Yrs,median)
murder$Victims_Upto_18_30_Yrs <- impute(murder$Victims_Upto_18_30_Yrs,median)
murder$Victims_Upto_30_50_Yrs <- impute(murder$Victims_Upto_30_50_Yrs,median)



















