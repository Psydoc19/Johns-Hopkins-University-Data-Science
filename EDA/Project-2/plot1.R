# Load the necessary data
NEI <- readRDS("summarySCC_PM25.rds")

# Convert Emissions to numeric to prevent scientific notation
NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

# Aggregate total emissions by year
totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

# Start PNG device
png("plot1.png", width=480, height=480, units="px")

# Create bar plot
barplot(totalNEI[, Emissions]
        , names.arg = totalNEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years",
        col = "blue")

# Turn off the device to save the plot to the file
dev.off()
