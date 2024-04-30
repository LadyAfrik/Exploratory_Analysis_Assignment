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




# Plot 2: Time Series Plot
png("plot2.png", width = 480, height = 480)
plot(data_sub$Global_active_power ~ data_sub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
