library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")


NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

sub <- subset(NEI, fips ==  24510)
aggemtype <- aggregate(Emissions ~ year + type, sub, sum)
        
png("plot3.png", height = 480, width = 720)

ggplot(aggemtype, aes(year, Emissions)) +
        geom_point() + facet_grid(.~type)
dev.off()