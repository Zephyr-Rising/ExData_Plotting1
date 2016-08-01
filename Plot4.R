format <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=format)

data_set <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

as.Date(data_set$Date)

data_set <-na.omit(data_set)

data_set$Timestamp <- paste(data_set$Date, data_set$Time)

par(mfcol = c(2,2))

plot(strptime(data_set$Timestamp, "%d/%m/%Y %H:%M:%S"), data_set$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")


plot(strptime(data_set$Timestamp, "%d/%m/%Y %H:%M:%S"), data_set$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(strptime(data_set$Timestamp, "%d/%m/%Y %H:%M:%S"), data_set$Sub_metering_2, type = "l", col = "red" )

lines(strptime(data_set$Timestamp, "%d/%m/%Y %H:%M:%S"), data_set$Sub_metering_3, type = "l", col = "blue" )

legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(strptime(data_set$Timestamp, "%d/%m/%Y %H:%M:%S"), data_set$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(strptime(data_set$Timestamp, "%d/%m/%Y %H:%M:%S"), data_set$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()