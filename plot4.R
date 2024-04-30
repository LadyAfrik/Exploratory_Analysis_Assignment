# Read the data
data <- read.csv("../household_power_consumption.txt", header=TRUE, sep=';', nrows=2075259, na.strings="?", 
                 check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

# Convert Date column to Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data
data_sub <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create Datetime column
datetime <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)




# Plot 4: Multi-panel Plot
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_sub, {
  plot(Global_active_power ~ Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage ~ Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1 ~ Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2 ~ Datetime, col='Red')
  lines(Sub_metering_3 ~ Datetime, col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type="l", ylab="Global Reactive Power (kilowatts)", xlab="")
})
dev.off()
