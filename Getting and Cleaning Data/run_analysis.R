## Main function.
## Variable "input" indicates the location of the raw data files,
## without slash at the end, eg. "UCI HAR Dataset".

generate <- function(input = character()){
    data_test <- read(input, "test")
    data_train <- read(input, "train")
    rawdata <- rbind(data_test, data_train)
    feature <- read.table(paste(input, "/features.txt", sep = ""))
    colnames(rawdata) <- c("subject", "activity", as.character(feature[ , 2]))
    dataset <- extract(rawdata)
    dataset <- nameactivity(dataset, input)
    dataset$subject <- as.factor(dataset$subject)
    dataset <- dataset[order(dataset$subject, dataset$activity), ]
    target <- create(dataset)
    write.table(target, file = paste(input, "/clear data.txt", sep = ""), 
                quote = FALSE, row.names = FALSE)
}

## Read raw data files and merge them into a data frame.
## Variable "set" indicates which data set is read, eg. "test".

read <- function(input = character(), set = character()){
    subject <- read.table(paste(input, "/", set, "/subject_", set, ".txt", 
                                sep = ""))
    activity <- read.table(paste(input, "/", set, "/y_", set, ".txt", 
                                sep = ""))
    dataset <- read.table(paste(input, "/", set, "/X_", set, ".txt", 
                                sep = ""))
    data <- cbind(subject, activity, dataset)
    return(data)
}

## Extract the mean and SD for each measurement.

extract <- function(rawdata = data.frame()){
    data <- rawdata[1:2]
    for(i in 3:ncol(rawdata)){
        name <- strsplit(colnames(rawdata)[i], "-")
        name <- strsplit(name[[1]][2], "(", fixed = TRUE)
        name <- name[[1]][1]
        if(name %in% c("mean", "std")) data <- cbind(data, rawdata[i])
    }
    return(data)
}

## Use descriptive activity names to name the activities.

nameactivity <- function(rawdata = data.frame(), input = character()){
    activity <- read.table(paste(input, "/activity_labels.txt", sep = ""))
    activity <- as.character(activity[ , 2])
    rawdata$activity <- as.factor(rawdata$activity)
    levels(rawdata$activity) <- activity
    return(rawdata)
}

## Create a secondary, independant data frame with the existing data set.

create <- function(rawdata = data.frame()){
    name <- names(rawdata)
    list <- split(rawdata, list(rawdata$subject, rawdata$activity))
    data <- data.frame()
    for(i in 1:length(list)){
        line <- data.frame()
        line[1, 1] <- list[[i]][1, 1]
        line[1, 2] <- list[[i]][1, 2]
        mean <- as.data.frame(lapply(list[[i]][3:ncol(list[[i]])], mean))
        line <- cbind(line, mean)
        data <- rbind(data, line)
    }
    names(data) <- name
    return(data)
}

## Run this script.

generate("UCI HAR Dataset")