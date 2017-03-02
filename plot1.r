
library(dplyr)

#Read in data
NEI <- readRDS("summarySCC_PM25.rds")

#Convert nei_data columns to correct type
nei_data$SCC <- as.factor(nei_data$SCC)
nei_data$Pollutant <- as.factor(nei_data$Pollutant)
nei_data$type <- as.factor(nei_data$type)
nei_data$year <- as.factor(nei_data$year)

#Sum emissions by year. 
aggem<- aggregate(Emissions ~ year, nei_data, sum)

#Open png device and specify file name. 
png("plot1.png", height = 480, width = 480)

#Create plot
barplot(aggem$Emissions, names=aggem$year)

#Close device
dev.off()