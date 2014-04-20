complete <- function(directory, id = 1:332){
    completeresult <- data.frame()
    for (i in id){
        file <- filename(i)
        datafile <- paste(directory, "/", file, sep = "")
        data <- read.csv(datafile)
        incomplete <- is.na(data[["sulfate"]]) | is.na(data[["nitrate"]])
        completecases <- sum(!incomplete)
        completeresult <- rbind(completeresult, c(i, completecases))
    }
    colnames(completeresult) <- c("id", "nobs")
    print(completeresult)
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