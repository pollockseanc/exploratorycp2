#Read data
NEI <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#Changes NEI data type to be usable
NEI$fips <- as.factor(NEI$fips)
NEI$SCC <- as.factor(NEI$SCC)
NEI$Pollutant <- as.factor(NEI$Pollutant)
NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

#Find out Coal is used
sub <- scc[grep("[Cc]oal", scc$EI.Sector),]

#Retrive the SCC codes
codes <- sub$SCC

#Find the locations in NEI where the SCC codes match those used for fuel comb - coal
scclocs <- NEI$SCC %in% codes

#Find rows that match SCC codes
neicoal <- NEI[scclocs == T,]

#Sum Emissions by year
aggem <- aggregate(Emissions ~ year, neicoal, sum)

#Open png device and specify file name. 
png("plot4.png", height = 480, width = 480)

#Create barpolt
barplot(aggem$Emissions, names=aggem$year)
title(main="Question 4")

#Close device
dev.off()


#Theoretically these might work to remove intermediate steps, but they aren't particularly clear
#scclocs <- NEI$SCC %in% scc$SCC[grep("[Cc]oal", scc$EI.Sector)]
#neicoal <- NEI[NEI$SCC %in% scc$SCC[grep("[Cc]oal", scc$EI.Sector)],]