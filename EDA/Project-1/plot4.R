# Read the dataset
data <- readRDS("subset_household_power_consumption.rds")

# Set the graphics device to PNG with the desired file name and size
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# Calculate breaks and labels for weekday plotting
breaks <- seq(from=min(as.Date(data$DateTime)), to=max(as.Date(data$DateTime)), by="1 day")
labels <- format(breaks, "%a")

# Plot 1: Global Active Power
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", xaxt='n')
axis.POSIXct(1, at=breaks, labels=labels, cex.axis=0.8)

# Plot 2: Voltage
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt='n')
axis.POSIXct(1, at=breaks, labels=labels, cex.axis=0.8)

# Plot 3: Energy Sub Metering
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt='n')
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
axis.POSIXct(1, at=breaks, labels=labels, cex.axis=0.8)
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty="n", cex=.5) 

# Plot 4: Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power", xaxt='n')
axis.POSIXct(1, at=breaks, labels=labels, cex.axis=0.8)

# Ensure the plot is saved and the device is turned off
dev.off()
