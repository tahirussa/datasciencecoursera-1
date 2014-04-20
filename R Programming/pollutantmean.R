pollutantmean <- function(directory, pollutant, id = 1:332){
    totalobservations <- numeric(0)
    for (i in id){
        file <- filename(i)
        datafile <- paste(directory, "/", file, sep = "")
        data <- read.csv(datafile)
        observations <- data[[pollutant]]
        totalobservations <- c(totalobservations, observations)
    }
    observationsmean <- mean(totalobservations, na.rm = TRUE)
    print(observationsmean)
}

filename <- function(number){
    if (number < 10){
        filelocation <- paste("00", number, ".csv", sep = "")
    } else if (number >= 10 & number < 100){
        filelocation <- paste("0", number, ".csv", sep = "")
    } else{
        filelocation <- paste(number, ".csv", sep = "")
    }
}