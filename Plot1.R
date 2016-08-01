format <- c(Voltage="numeric", Global_active_power="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE, na.strings = "?",colClasses=format)

data_set <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

as.Date(data_set$Date)

data_set <-na.omit(data_set)

hist(data_set$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

dev.off()