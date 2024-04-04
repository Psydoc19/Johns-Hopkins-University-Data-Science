library(shiny)
library(gapminder)

# Define the user interface
ui <- fluidPage(
  titlePanel(tags$h3("Gapminder World Data Exploration", style = "text-align: center;")),
  tags$h4("Explore trends in life expectancy, GDP per capita, and population across various countries and continents.", 
          style = "text-align: center;"),
  sidebarLayout(
    sidebarPanel(
      # Country selection input with United States and China as default selections
      selectizeInput("selectedCountries", "Select Countries:",
                     choices = unique(gapminder$country), 
                     selected = c("United States", "China"), 
                     multiple = TRUE),
      # Continent selection input
      checkboxGroupInput("selectedContinents", "Select Continents:",
                         choices = unique(gapminder$continent),
                         selected = unique(gapminder$continent)),
      # Year range slider input
      sliderInput("yearRange", "Year Range:",
                  min = min(gapminder$year), max = max(gapminder$year),
                  value = c(1952, 2007), step = 1),
      # Metric comparison selection input
      selectInput("comparisonMetric", "Comparison Metric:",
                  choices = c("GDP per Capita" = "gdpPercap", 
                              "Population" = "pop"),
                  selected = "gdpPercap"),
      # Adding instructions for users
      tags$p("Select countries, continents, and year range to start the exploration. Use the comparison metric to analyze alongside life expectancy.", 
             style = "margin-top: 20px;")
    ),
    mainPanel(
      plotOutput("lifeExpPlot"), # Plot for Life Expectancy Over Time
      plotOutput("gdpPlot") # Second plot for GDP or Population
    )
  )
)
