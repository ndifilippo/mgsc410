library(tidyverse)
library(factoextra)
library(cluster)
library(VIM)
# install.packages("devtools")
library(devtools)
# install dev version of ggmap
# devtools::install_github("dkahle/ggmap")

library(ggmap)

library(knitr)
library(kableExtra)
tinytex::install_tinytex()
#> Loading required package: ggplot2
#> Google Maps API Terms of Service: http://developers.google.com/maps/terms.
#> Please cite ggmap if you use it: see citation("ggmap") for details.

# save api key
register_google(key = "AIzaSyCgDlbIH6DyxUJ5b4VcfVP-7LY5-cbjHsc")
setwd("C:/git/mgsc410/datasets")


# clean data 
data <- read.csv("dma_and_msa.csv", stringsAsFactors = F)

# delete non states: west, northeast etc 
data <- filter(data, !(str_detect(str_to_lower(data$location),"all consumer")))
# variables are not needed 
data <- select(data, -c(dma, name, dma_name, region, name, dma_name, name))
data <- filter(data, date_id == 2009)
temp <- data[, 4:49]

data.percents <- temp[, 1:44] / data$income_before_taxes


data_kmeans <- data.percents[, 9:40]
# Kmeans
kmeans4 <- kmeans(data_kmeans, centers = 4, nstart = 25)
# cluster to data frame 
data$cluster <- (kmeans4$cluster)
data.percents$cluster <- kmeans4$cluster
data.percents$location <- data$location


# USA MAP 
p <- get_map(location = c(lon = mean(as.numeric(data$longitude)) - 5, lat = mean(as.numeric(data$latitude))), zoom = 4,
             maptype = "roadmap", scale = 2)

p
ggmap(p) + geom_point(data = data,
                      aes(x = as.numeric(data$longitude ),
                                       y = as.numeric(data$latitude)),
                      fill = data$cluster, alpha =0.4,
                      size = (data$income_before_taxes)/10000 ,
                      shape = 21, color = data$cluster) +
                      labs(y="Latitude", x = "Longitude",
                           title = "Clustering DMAs by 2009's Consumer Expenditure Survey") +
                      theme(plot.title = element_text(size = 18), axis.title = element_text(size = 14), legend.position="top")
options(digits=2)
table <- cbind( data.percents[c(9,45:46)], data$income_before_taxes)
print(table[order( table$cluster, table$`data$income_before_taxes` ),])

table <- table[order( table$cluster, table$`data$income_before_taxes` ),]
colnames(table) <- c("Avg expenditure / Income", "Cluster", "Location", "Income before Taxes")


table$`Income before Taxes` <-  paste('$',formatC(table$`Income before Taxes`, big.mark=',', format = 'f', digits = 2))
table
