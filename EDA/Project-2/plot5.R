library(dplyr)
library(ggplot2)
library(stringr)

# Load the NEI & SCC data frames
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
SCC <- as.data.table(readRDS("Source_Classification_Code.rds"))

# Filter SCC for vehicle sources
vehicleSCC <- SCC %>%
  filter(str_detect(SCC.Level.Two, "[Vv]ehicle"))

# Filter NEI for vehicle sources
vehicleNEI <- NEI %>%
  filter(SCC %in% vehicleSCC$SCC)

# Filter for Baltimore
balt_vehicleNEI <- vehicleNEI %>%
  filter(fips == "24510")

# Save the plot as a PNG file
png("plot5.png", width = 480, height = 480)

# Create the plot with improved aesthetics
ggplot(balt_vehicleNEI, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(x = "Year", y = "Total Emissions", 
       title = "Motor Vehicle Emissions in Baltimore (1999-2008)")

# Close the PNG device
dev.off()
