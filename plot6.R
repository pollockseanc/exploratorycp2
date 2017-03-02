#Read data
NEI <- readRDS("summarySCC_PM25.rds")

#Convert NEI columns to correct type
NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)


#create a subset that sorts by fips
subba <- subset(NEI, fips ==  "24510" & type == "ON-ROAD")
subla<-subset(NEI, fips == "06037" & type == "ON-ROAD")





#Sum emissions by year for each city. 
aggemba <- aggregate(Emissions ~ year + type, subba, sum)
aggemla <- aggregate(Emissions ~ year, subla, sum)


#Open png device and create file
png("plot6.png")

#Device graphics parameters
par(mfrow = c(1,2), oma = c(0,0,2,0))

#Create barplots
barplot(aggemba$Emissions, names=aggemba$year, main = "Baltimore City")
barplot(aggemla$Emissions, names=aggemla$year, main = "Los Angeles")
mtext("Question 6", outer = T)


#Close device
dev.off()

