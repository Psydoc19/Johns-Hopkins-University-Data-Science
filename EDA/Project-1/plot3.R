# Read the dataset
data <- readRDS("subset_household_power_consumption.rds")

# Set the graphics device to PNG with the desired file name and size
png(filename = "plot3.png", width = 480, height = 480)

# Adjusting the plotting range if necessary
plot_range <- seq(from=min(data$Date), to=max(data$Date), by="day")

# Prepare the plot with type 'n' to establish the plot area
plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering",
     xaxt = "n", 
     ylim = c(0, max(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3, na.rm = TRUE)))

# Add the lines for each sub-metering category
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

# Add a legend
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1)

# Determine breaks for each day present in the data
breaks <- seq(from=min(as.Date(data$DateTime)), to=max(as.Date(data$DateTime)), by="1 day")

# Format labels with the corresponding weekdays
labels <- format(breaks, "%a")

# Add the x-axis with the above-defined breaks and labels
axis.POSIXct(1, at=breaks, labels=labels, cex.axis=0.8)

# Ensure the plot is saved and the device is turned off
dev.off()
