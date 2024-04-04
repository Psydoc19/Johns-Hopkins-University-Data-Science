library(shiny)
library(ggplot2)
library(dplyr)
library(gapminder)

# Define server logic
server <- function(input, output) {
  # Reactive expression to filter data based on user inputs
  filtered_data <- reactive({
    gapminder %>%
      filter(country %in% input$selectedCountries,
             continent %in% input$selectedContinents,
             year >= input$yearRange[1], year <= input$yearRange[2])
  })
  
  # Render plot for Life Expectancy Over Time
  output$lifeExpPlot <- renderPlot({
    data <- filtered_data()
    ggplot(data, aes(x = year, y = lifeExp, color = country)) +
      geom_line() + geom_point() +
      labs(title = "Life Expectancy Over Time", 
           subtitle = paste("Data from Gapminder", min(input$yearRange), "-", max(input$yearRange)),
           x = "Year", y = "Life Expectancy") +
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "bottom")
  })
  
  # Render plot for GDP per Capita or Population Over Time
  output$gdpPlot <- renderPlot({
    data <- filtered_data()
    metric_name <- ifelse(input$comparisonMetric == "gdpPercap", "GDP per Capita", "Population")
    ggplot(data, aes_string(x = "year", y = input$comparisonMetric, color = "country")) +
      geom_line() + geom_point() +
      scale_y_continuous(labels = scales::comma) +
      labs(title = paste(metric_name, "Over Time"), 
           subtitle = paste("Data from Gapminder", min(input$yearRange), "-", max(input$yearRange)),
           x = "Year", y = "") +
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5), legend.position = "bottom")
  })
}
