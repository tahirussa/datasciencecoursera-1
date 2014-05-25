## Read data.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)

## Extract SCC codes refered to motor vehicle sources.

SCCCode <- character()
for(i in 1:nrow(SCC)){
    EICode <- as.character(SCC[i, 4])
    EICode <- unlist(strsplit(EICode, " ", fixed = TRUE))
    if(EICode[1] == "Mobile" & EICode[length(EICode)] == "Vehicles"){
        SCCCode <- c(SCCCode, as.character(SCC[i, 1]))
    }
}

## Extract data of motor vehicle sources in Baltimore.

NEIofMotor <- NEI[NEI$SCC %in% SCCCode & NEI$fips == "24510", ]

## Split data frame by year and calculate the total emissions.

splitNEI <- split(NEIofMotor, NEIofMotor$year)
totalByYear <- data.frame(Year = character(), TotalEmissions = numeric(), 
                          stringsAsFactors = FALSE)
for(i in 1:length(splitNEI)){
    sum <- sum(splitNEI[[i]]$Emissions)
    totalByYear[i , 1] <- names(splitNEI)[i]
    totalByYear[i , 2] <- sum
}

## Create plot.

png(file = "plot5.png", bg = "transparent", width = 640, height = 640)
plot(totalByYear$Year, totalByYear$TotalEmissions, 
     type = "l", 
     main = "Total Emissions from Motor Vehicles Sources by Year in Baltimore", 
     xlab = "Year", ylab = "Total Emissions (t)", pch = 16, lwd = 2)
points(totalByYear$Year, totalByYear$TotalEmissions, pch = 16, cex = 2)
dev.off()