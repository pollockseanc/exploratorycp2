library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

nei_data$fips <- as.factor(nei_data$fips)
nei_data$SCC <- as.factor(nei_data$SCC)
nei_data$Pollutant <- as.factor(nei_data$Pollutant)
nei_data$type <- as.factor(nei_data$type)
nei_data$year <- as.factor(nei_data$year)


subset3 <- scc_data[grep("[Cc]oal", scc_data$EI.Sector),]
codes <- subset3$SCC

#png("plot4.png" height = 480, width = 480)
#dev.off()