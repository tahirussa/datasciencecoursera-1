corr <- function(directory, threshold = 0){
    corrset <- numeric()
    for (i in 1:332){
        file <- filename(i)
        datafile <- paste(directory, "/", file, sep = "")
        data <- read.csv(datafile)
        incomplete <- is.na(data[["sulfate"]]) | is.na(data[["nitrate"]])
        completecases <- sum(!incomplete)
        if (completecases > threshold){
            resultdata <- data[!incomplete, ]
            correlation <- cor(resultdata[["nitrate"]], resultdata[["sulfate"]])
            corrset <- c(corrset, correlation)
        } else{
            next
        }
    }
    return(corrset)
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