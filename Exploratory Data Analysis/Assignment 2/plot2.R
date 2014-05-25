## Read data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)

## Extract data of Baltimore and split it and calculate sum of emissions.

NEIofBC <- NEI[NEI$fips == "24510", ]
splitNEI <- split(NEIofBC, NEIofBC$year)
totalByYear <- data.frame(Year = character(), TotalEmissions = numeric(), 
                          stringsAsFactors = FALSE)
for(i in 1:length(splitNEI)){
    sum <- sum(splitNEI[[i]]$Emissions)
    totalByYear[i , 1] <- names(splitNEI)[i]
    totalByYear[i , 2] <- sum
}

## Create plot.

png(file = "plot2.png", bg = "transparent", width = 640, height = 640)
plot(totalByYear$Year, totalByYear$TotalEmissions, 
     type = "l", main = "Total Emissions by Year in the Baltimore City", 
     xlab = "Year", ylab = "Total Emissions (t)", pch = 16, lwd = 2)
points(totalByYear$Year, totalByYear$TotalEmissions, pch = 16, cex = 2)
dev.off()