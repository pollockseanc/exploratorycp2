
library(dplyr)

#Read in data
NEI <- readRDS("summarySCC_PM25.rds")

#Convert nei_data columns to correct type
NEI$SCC <- as.factor(NEI $SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI $type)
NEI$year <- as.factor(NEI $year)

#create a subset that sorts by fips
sub2<-subset(NEI, fips == 24510)

#Sum emissions by year. 
aggem2<- aggregate(Emissions ~ year, sub2, sum)

#Open png device and specify file name. 
png("plot2.png", height = 480, width = 480)

barplot(aggem2$Emissions, names=aggem2$year)

dev.off()