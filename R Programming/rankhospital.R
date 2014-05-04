rankhospital <- function(state, outcome, num = "best"){
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(nrow(data[data$State == state, ]) == 0){
    stop("invalid state")
  }
  if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))){
    stop("invalid outcome")
  }
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  outcomeCol <- numeric(1)
  if(outcome == "heart attack"){
    outcomeCol <- 11
  }else if(outcome == "heart failure"){
    outcomeCol <- 17
  }else{
    outcomeCol <- 23
  }
  subdata <- data[data$State == state, c(2, outcomeCol)]
  subdata[ , 2] <- as.numeric(subdata[ , 2])
  ## Failed to handle ties
  ## Need to refurbish
  rank <- sort(subdata[ ,2])
  if(num == "best"){
    num <- 1
  }else if(num == "worst"){
    num <- length(rank)
  }else if(num > length(rank)){
    return(NA)
  }
  hospital <- subdata[subdata[ , 2] == rank[num], 1]
  hospital <- hospital[!is.na(hospital)]
  if(length(hospital)== 1){
    hospital
  }else{
    sort(hospital)
    hospital[1]
  }
}