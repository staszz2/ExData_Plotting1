if(!exists("dataSet"))
{
  source("getDataSet.R")
}

#extract variables
timestamp <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
power <- as.numeric(dataSet$Global_active_power)
power2 <- as.numeric(dataSet$Global_reactive_power )
voltage <- as.numeric(dataSet$Voltage)

sub1 <- as.numeric(dataSet$Sub_metering_1)
sub2 <- as.numeric(dataSet$Sub_metering_2)
sub3 <- as.numeric(dataSet$Sub_metering_3)

png("plot4.png", width=480, height=480)

#set layout
par(mfrow = c(2, 2))

#graph 1.1 from plot2
plot(timestamp, power, type="l", xlab="", ylab="Global Active Power")

#graph 1.2 from plot2 modified with voltage
plot(timestamp, voltage, type="l", xlab="", ylab="Voltage")

#graph 2.1 from plot3
plot(timestamp, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(timestamp, sub2, type="l", col="red")
lines(timestamp, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#graph 2.2 plot 1 with reactive power
plot(timestamp, power2, type="l", xlab="", ylab="Global_reactive_power")

dev.off()