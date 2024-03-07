library(dplyr)
library(ggplot2)
library(stringr)

# Load the NEI & SCC data frames
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))
SCC <- as.data.table(readRDS("Source_Classification_Code.rds"))

# Filter SCC for coal combustion sources
SCC_coal_comb <- SCC %>%
  filter(str_detect(SCC.Level.One, "[Cc]omb") & 
           str_detect(SCC.Level.Three, "[Cc]oal") &
           str_detect(SCC.Level.Four, "[Cc]oal"))

# Filter NEI for coal combustion sources
NEI_coal_comb <- NEI %>%
  filter(SCC %in% SCC_coal_comb$SCC)

# Save the plot as a PNG file
png("plot4.png", width = 480, height = 480)

# Create the plot
ggplot(NEI_coal_comb, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", fill = "blue") +  
  theme_minimal() +  
  labs(x = "Year", y = "Total Emissions (Tons)", 
       title = "Coal Combustion Source Emissions Across the US from 1999 to 2008")

# Close the PNG device
dev.off()
