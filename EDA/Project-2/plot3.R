library("data.table")
library("ggplot2")

# Load the NEI & SCC data frames
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
SCC <- as.data.table(readRDS("Source_Classification_Code.rds"))

# Subset NEI data by Baltimore
baltimoreNEI <- NEI[fips == "24510"]

# Save the plot as a PNG file
png("plot3.png", width = 480, height = 480)

# Convert year to factor and specify the order of levels
baltimoreNEI[, year := factor(year, levels = unique(year))]

# Create the ggplot
ggplot(baltimoreNEI, aes(x = year, y = Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  theme_bw() +
  facet_grid(. ~ type, scales = "free", space = "free") + 
  labs(x = "Year", y = "Total PM2.5 Emission (Tons)") + 
  ggtitle("PM2.5 Emissions in Baltimore City (1999-2008) by Source Type") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  

# Close the PNG device
dev.off()
