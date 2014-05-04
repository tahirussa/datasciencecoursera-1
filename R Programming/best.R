best <- function(state, outcome){
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if(nrow(data[data$State == state, ]) == 0){
    stop("invalid state")
  }
  if(!any(outcome == c("heart attack", "heart failure", "pneumonia"))){
    stop("invalid outcome")
  }
  ## Return hospital name in that state with lowest 30-day death rate
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
  hospital <- subdata[subdata[ , 2] == min(subdata[ , 2], na.rm = TRUE), 1]
  hospital <- hospital[!is.na(hospital)]
  if(length(hospital)== 1){
    hospital
  }else{
    sort(hospital)
    hospital[1]
  }
}