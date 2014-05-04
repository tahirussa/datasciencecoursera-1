rankall <- function(outcome, num = "best"){
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that outcome are valid
    if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))){
        stop("invalid outcome")
    }
    ## For each state, find the hospital of the given rank
    outcomeCol <- numeric(1)
    if(outcome == "heart attack"){
        outcomeCol <- 11
    }else if(outcome == "heart failure"){
        outcomeCol <- 17
    }else{
        outcomeCol <- 23
    }
    subdata <- data[ , c(2, 7, outcomeCol)]
    subdata[ , 3] <- as.numeric(subdata[ , 3])
    subdata <- split(subdata, subdata[2])
    list <- data.frame(hospital = character(), state = character() , stringsAsFactors = FALSE)
    for(i in 1:length(subdata)){
        tempdata <- subdata[[i]]
        tempdata <- tempdata[order(tempdata[ , 3], tempdata[ , 1], na.last = NA), ]
        if(num == "best") list[i, ] <- c(tempdata[1, 1], tempdata[1, 2])
        else if(num == "worst") list[i, ] <- c(tempdata[nrow(tempdata), 1], tempdata[nrow(tempdata), 2])
        else if(num > nrow(tempdata)) list[i, ] <- c("NA", tempdata[1, 2])
        else list[i, ] <- c(tempdata[num, 1], tempdata[num, 2])
    }
    list
}