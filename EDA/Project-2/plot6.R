library(data.table)
library(ggplot2)
library(dplyr)

# Load the NEI & SCC data frames
SCC <- as.data.table(readRDS(file = "Source_Classification_Code.rds"))
NEI <- as.data.table(readRDS(file = "summarySCC_PM25.rds"))

# Filter SCC for vehicle sources
vehiclesSCC <- SCC %>%
  filter(str_detect(SCC.Level.Two, "[Vv]ehicle"))

# Filter NEI for vehicle sources
vehiclesNEI <- NEI %>%
  filter(SCC %in% vehiclesSCC$SCC)

# Subset the vehicles NEI data for each city and add city name
vehiclesBaltimoreNEI <- vehiclesNEI[fips == "24510"]
vehiclesBaltimoreNEI[, city := "Baltimore City"]

vehiclesLANEI <- vehiclesNEI[fips == "06037"]
vehiclesLANEI[, city := "Los Angeles"]

# Combine data.tables into one data.table
bothNEI <- rbind(vehiclesBaltimoreNEI, vehiclesLANEI)

# Save the plot as a PNG file
png("plot6.png", width = 480, height = 480)

# Create the plot with improved aesthetics
ggplot(bothNEI, aes(x = factor(year), y = Emissions, fill = city)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ city, scales = "free", space = "free") +
  labs(x = "Year", y = expression("Total PM"[2.5] * " Emission (Kilo-Tons)"), 
       title = expression("PM"[2.5] * " Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"),
       fill = "City")

# Close the PNG device
dev.off()
