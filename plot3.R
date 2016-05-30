if(!exists("dataSet"))
{
  source("getDataSet.R")
}

timestamp <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
power <- as.numeric(dataSet$Global_active_power)

sub1 <- as.numeric(dataSet$Sub_metering_1)
sub2 <- as.numeric(dataSet$Sub_metering_2)
sub3 <- as.numeric(dataSet$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(timestamp, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(timestamp, sub2, type="l", col="red")
lines(timestamp, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()