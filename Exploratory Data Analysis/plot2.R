con <- file("household_power_consumption.txt", "r")
data <- data.frame(Data = character(), Time = character(), 
                   Global_active_power = numeric(), 
                   Global_reactive_power = numeric(), 
                   Voltage = numeric(), 
                   Global_intensity = numeric(), 
                   Sub_metering_1 = numeric(), 
                   Sub_metering_2 = numeric(), 
                   Sub_metering_3 = numeric(), 
                   DateIndex = character(), 
                   stringsAsFactors = FALSE)
i <- 1
## Skip the table header
invisible(readLines(con, n = 1))
repeat{
    rec <- readLines(con, n = 1)
    if(length(rec) == 0) break
    if(substr(rec, 1, 8) == "1/2/2007" | substr(rec, 1, 8) == "2/2/2007"){
        singlerec <- unlist(strsplit(rec, ";"))
        singlerec[10] <- paste(singlerec[1], singlerec[2])
        data[i, ] <- singlerec
        i <- i + 1
    }
}
close(con)
data[ ,10] <- as.POSIXct(strptime(data[ ,10], format = "%d/%m/%Y %H:%M:%S"))
for(col in 3:9) data[ , col] <- as.numeric(data[ , col])

png(file = "plot2.png", bg = "transparent")
plot(data[ , 10], data[ , 3], type = "l", 
             xlab = "", ylab = "Global Acitve Power (kilowatts)")
dev.off()