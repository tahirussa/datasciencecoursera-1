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

NEIofMotor <- NEI[NEI$SCC %in% SCCCode, ]
NEIofMotor <- NEIofMotor[NEIofMotor$fips == "24510" | 
                             NEIofMotor$fips == "06037", ]

## Split data frame by year and calculate the total emissions.

splitNEI <- split(NEIofMotor, list(NEIofMotor$year, NEIofMotor$fips))
totalByFips <- data.frame(Year = character(), fips = character(), 
                          TotalEmissions = numeric(), stringsAsFactors = FALSE)
for(i in 1:length(splitNEI)){
    sum <- sum(splitNEI[[i]]$Emissions)
    name <- strsplit(names(splitNEI[i]), ".", fixed = TRUE)
    totalByFips[i , 1] <- name[[1]][1]
    totalByFips[i , 2] <- name[[1]][2]
    totalByFips[i , 3] <- sum
}
for(i in 1:nrow(totalByFips)){
    if(totalByFips[i, 2] == "06037") totalByFips[i, 2] <- "Los Angeles County"
    else totalByFips[i, 2] <- "Baltimore City"
}

## Create plot.

library(ggplot2)
png(file = "plot6.png", bg = "transparent", width = 640, height = 640)
ggplot(totalByFips, aes(x = Year, y = TotalEmissions, colour = fips)) + 
    geom_line(aes(group = fips)) + 
    xlab("Year") + 
    ylab("Total Emissions (t)") + 
    ggtitle("Total Emissions by Year in Baltimore and LA County") + 
    guides(color = guide_legend(title = "Location"))
dev.off()