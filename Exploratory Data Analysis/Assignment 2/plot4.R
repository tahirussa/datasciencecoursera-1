## Read data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)

## Extract SCC codes refered to coal combustion-related sources.

SCCCode <- character()
for(i in 1:nrow(SCC)){
    EICode <- as.character(SCC[i, 4])
    EICode <- unlist(strsplit(EICode, " - ", fixed = TRUE))
    if(EICode[1] == "Fuel Comb" & EICode[3] == "Coal"){
        SCCCode <- c(SCCCode, as.character(SCC[i, 1]))
    }
}

## Extract data of coal combustion-related sources.

NEIofCoal <- NEI[NEI$SCC %in% SCCCode, ]

## Split data frame by year and calculate the total emissions.

splitNEI <- split(NEIofCoal, NEIofCoal$year)
totalByYear <- data.frame(Year = character(), TotalEmissions = numeric(), 
                          stringsAsFactors = FALSE)
for(i in 1:length(splitNEI)){
    sum <- sum(splitNEI[[i]]$Emissions)
    totalByYear[i , 1] <- names(splitNEI)[i]
    totalByYear[i , 2] <- sum
}

## Create plot.

png(file = "plot4.png", bg = "transparent", width = 640, height = 640)
plot(totalByYear$Year, totalByYear$TotalEmissions, 
     type = "l", 
     main = "Total Emissions from Coal Combustion-Related Sources by Year", 
     xlab = "Year", ylab = "Total Emissions (t)", pch = 16, lwd = 2)
points(totalByYear$Year, totalByYear$TotalEmissions, pch = 16, cex = 2)
dev.off()