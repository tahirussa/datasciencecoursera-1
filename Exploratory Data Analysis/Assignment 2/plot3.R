## Read data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)

## Extract data of Baltimore and split it and calculate sum of emissions.

NEIofBC <- NEI[NEI$fips == "24510", ]
splitNEI <- split(NEIofBC, list(NEIofBC$year, NEIofBC$type))
totalByType <- data.frame(Year = character(), SourceType = character(), 
                          TotalEmissions = numeric(), stringsAsFactors = FALSE)
for(i in 1:length(splitNEI)){
    sum <- sum(splitNEI[[i]]$Emissions)
    name <- strsplit(names(splitNEI[i]), ".", fixed = TRUE)
    totalByType[i , 1] <- name[[1]][1]
    totalByType[i , 2] <- name[[1]][2]
    totalByType[i , 3] <- sum
}

## Create plot.

library(ggplot2)
png(file = "plot3.png", bg = "transparent", width = 640, height = 640)
ggplot(totalByType, aes(x = Year, y = TotalEmissions, colour = SourceType)) + 
    geom_line(aes(group = SourceType))
dev.off()