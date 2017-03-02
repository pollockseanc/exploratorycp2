
#Read in data
NEI <- readRDS("summarySCC_PM25.rds")

#Convert nei_data columns to correct type
NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

#create a subset that sorts by fips
sub<-subset(NEI, fips == "24510")

#Sum emissions by year. 
aggem<- aggregate(Emissions ~ year, sub, sum)

#Open png device and specify file name. 
png("plot2.png", height = 480, width = 480)

#Create barplot
barplot(aggem$Emissions, names=aggem$year)
title(main = "Question 2")

#Close device
dev.off()
