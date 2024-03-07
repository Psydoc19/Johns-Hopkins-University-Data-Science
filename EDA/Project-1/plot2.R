# Read the dataset
data <- readRDS("subset_household_power_consumption.rds")

# Set the graphics device to PNG with the desired file name and size
png(filename = "plot2.png", width = 480, height = 480)

# Plot 'Global_active_power' against 'DateTime', without x-axis labels for now
plot(data$DateTime, data$Global_active_power, type='l', 
     xlab='', ylab='Global Active Power (kilowatts)', xaxt='n')

# Determine breaks for each day present in the data
breaks <- seq(from=min(as.Date(data$DateTime)), to=max(as.Date(data$DateTime)), by="1 day")

# Format labels with the corresponding weekdays
labels <- format(breaks, "%a")

# Add the x-axis with the above-defined breaks and labels
axis.POSIXct(1, at=breaks, labels=labels, cex.axis=0.8)

# Turn off the graphics device to save the plot
dev.off()

