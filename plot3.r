require(ggplot2)

#Read data
NEI <- readRDS("summarySCC_PM25.rds")

#Changes NEI data type to be usable
NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

#Creates a subset for baltimore city
sub <- subset(NEI, fips ==  "24510")

#Aggregates data by type+type  and sums the emissions for each year
aggemtype <- aggregate(Emissions ~ year + type, sub, sum)
 
#Open png device and specify file name.        
png("plot3.png", height = 480, width = 720)

#Create plot
ggplot(aggemtype, aes(year, Emissions)) +
        geom_point() + facet_grid(.~type)  +
        ggtitle("Question 3")

#Close device
dev.off()
