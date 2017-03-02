library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")


NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

par(mfrow = c(1,2))
#create a subset that sorts by fips
subba <- subset(NEI, fips ==  "24510" & type == "ON-ROAD")
subla<-subset(NEI, fips == "06037" & type == "ON-ROAD")





#Sum emissions by year. 
aggemba <- aggregate(Emissions ~ year + type, subba, sum)
aggemla <- aggregate(Emissions ~ year, subla, sum)

#Doesnt seem to be prining in two lines atm

png("plot6.png")
#has to be run line by line
plot(aggemba$year, aggemba$Emissions,  type = "p")
plot(aggemla$year, aggemla$Emissions,  type = "p")
#barplot(aggemba$Emissions, names=aggemba$year)
#barplot(aggemla$Emissions, names=aggemla$year)




dev.off()

