#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system,
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Read in data
NEI <- readRDS("summarySCC_PM25.rds")

#Convert nei_data columns to correct type
NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

#Sum emissions by year. 
aggem <- aggregate(Emissions ~ year, NEI, sum)

#Open png device and specify file name. 
png("plot1.png", height = 480, width = 480)

#Create plot
barplot(aggem$Emissions, names=aggem$year)
title(main = "Question 1")

#Close device
dev.off()
