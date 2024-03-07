# Read the dataset
data <- readRDS("subset_household_power_consumption.rds")

# Set the graphics device to PNG with the desired file name and size
png(filename = "plot1.png", width = 480, height = 480)

# Create the histogram
hist(data$Global_active_power, 
     breaks=20, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency",
     ylim=c(0, 1200))

# Close the PNG device
dev.off()
