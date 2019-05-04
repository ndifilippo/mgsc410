library(lubridate)
library(devtools)
library(fastDummies)
library(tidyverse)
library(randomForest)
setwd("C:/git/mgsc410/datasets")

# import data
raw <- read.csv("sales_feat_dma.csv", stringsAsFactors = F)

# clean data 

raw$date_id <- mdy(raw$date_id)
# transform categorical variables 
categ_var <- dummy_columns(raw$dma)
type.dum <- dummy_columns(raw$type)
data <- cbind(raw, categ_var)
# variables used in regression 
data <- select(data, -store, -dma, -msa, -".data", -markdown_1,-markdown_2,
               -markdown_3,-markdown_4,-markdown_5, -date_id, -dept,
               -.data_Austin, -'.data_Orlando-Daytona Beach-Melbourne',
               -.data_Charlotte, -'.data_Tampa-St Petersburg',
               -'.data_Salt Lake City', -'.data_Kansas City')


# transform dates to discrete 
data$month <- as.factor(data$month)
data$year <- as.factor(data$year)
# linear regression 
fit <- lm(weekly_sales ~. -.data_Chicago, data = data)
summary(fit)
colnames(data)


xy <- filter(raw, store == 1 )
yz <- filter(raw, year == 2010)
de <- filter(raw, dept == 1)

ggplot() + geom_line(aes(x = dmy(de$date_id), y = de$weekly_sales))
