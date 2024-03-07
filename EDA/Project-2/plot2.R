library(data.table)

# Load the necessary data
NEI <- as.data.table(readRDS("summarySCC_PM25.rds"))

# Filter for Baltimore City (FIPS 24510) and aggregate emissions by year
baltimore_emissions <- NEI[fips == "24510", .(Total_Emissions = sum(Emissions, na.rm = TRUE)), by = year]

# Sort data by year to ensure chronological plotting
baltimore_emissions <- baltimore_emissions[order(year)]

# Plotting
png("plot2.png", width = 480, height = 480)
par(mar = c(5, 5, 4, 2) + 0.1)  

barplot(baltimore_emissions$Total_Emissions, names.arg = baltimore_emissions$year,
        main = "Total PM2.5 Emissions in Baltimore City (1999-2008)",
        xlab = "Year", ylab = "Total Emissions (Tons)", col = "blue")

dev.off()

