#setwd("C:/Users/rudy.NETWORK/Documents/R/DataScience/ExploratoryDataAnalysis/Week1/Assignment1/Data")
#getwd()

TempDF1 <- read.delim("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")

TempDF1$Time <- strptime(paste(TempDF1$Date,TempDF1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
TempDF1$Date <- as.Date(TempDF1$Date, "%d/%m/%Y")

TemDF2 = subset(TempDF1, Date > "2007-01-31" & Date < "2007-02-03")
#str(TemDF2)
#summary(TemDF2)

## remove the initial big dataframe
rm(TempDF1) 

#Do plot 1
png(filename = "Plot1.png", width = 480, height = 480)
hist(TemDF2$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#Do plot 2
png(filename = "Plot2.png", width = 480, height = 480)
plot(TemDF2$Time, TemDF2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

##Do plot 3
png(filename = "Plot3.png", width = 480, height = 480)
plot(TemDF2$Time,  TemDF2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(TemDF2$Time, TemDF2$Sub_metering_2, col = "red", type = "l")
points(TemDF2$Time, TemDF2$Sub_metering_3, col = "blue", type = "l")
legend("topright", lwd = c(2.5,2.5,2.5) ,col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

##Do plot 4
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar=c(5,4,4,2))
#Top Left
plot(TemDF2$Time, TemDF2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#Top Right
plot(TemDF2$Time, TemDF2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Bottom Left
plot(TemDF2$Time,  TemDF2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(TemDF2$Time, TemDF2$Sub_metering_2, col = "red", type = "l")
points(TemDF2$Time, TemDF2$Sub_metering_3, col = "blue", type = "l")
legend("topright", lwd = c(2.5,2.5,2.5), box.lwd = 0, box.col = "transparent", bg = "transparent", col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex = 0.8)
#Bottom Right
plot(TemDF2$Time, TemDF2$Global_reactive_power, type = "h", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()



