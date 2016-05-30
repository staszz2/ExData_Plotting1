if(!exists("dataSet"))
{
  source("getDataSet.R")
}

x <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
y <- as.numeric(dataSet$Global_active_power)
png("plot2.png", width=480, height=480)
plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()