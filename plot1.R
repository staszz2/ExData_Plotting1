if(!exists("dataSet"))
{
  source("getDataSet.R")
}

x <- as.numeric(dataSet$Global_active_power)
png("plot1.png", width=480, height=480)
hist(x, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()