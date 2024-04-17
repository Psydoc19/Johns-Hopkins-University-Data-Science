library(shiny)
library(data.table)

# Load the nGram data
nGramTable <- fread('predictions.csv')

# Define the text prediction function using different n-grams
nextWords <- function(rawStr, n, nGramTable) {
  # Remove numbers and punctuations
  filtList <- gsub('[[:punct:]]|[[:digit:]]', "", tolower(rawStr))
  filtList <- unlist(strsplit(filtList, "\\s+"))
  
  # Extract the last 6 words for the query
  if (length(filtList) > 6) {
    filtList <- filtList[(length(filtList)-5):length(filtList)]
  }
  filtStr <- paste(filtList, collapse = " ")
  
  # Returns all the matched words
  predText <- nGramTable[filtStr == nGramTable$query, ]$predict
  if (length(predText) > 0) {
    finalText <- predText
  } else {
    for (i in 2:length(filtList)) {
      filtStr <- paste(filtList[i:length(filtList)], collapse = " ")
      predText <- nGramTable[filtStr == nGramTable$query, ]$predict
      if (length(predText) > 0) {
        finalText <- predText
        break
      }
      if (i == length(filtList) - 1) {
        finalText <- 'the'
      }
    }
  }
  return(finalText[1:n])
}

# Define UI for application with CSS for centered title
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      #main-title, #sub-title {
        text-align: center;
        color: #3498DB;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 10px;
      }
      #sub-title {
        font-size: 16px;
        font-weight: normal;
        color: #555;
      }
      .instructions { 
        font-size: 16px; 
        margin-bottom: 20px;
        font-family: Arial, sans-serif; 
      }
      .text-input {
        margin-top: 20px;
      }
      .result {
        color: #2C3E50; 
        font-size: 18px; 
        font-weight: bold;
        margin-top: 20px;
      }
    "))
  ),
  
  # Using div to create a styled title and subtitle
  div(class = 'container-fluid',
      h1('Word Predictor by Vitalii Diakonov', id = 'main-title'),
      h2('Final Project for the Data Science Course by Johns Hopkins University', id = 'sub-title'),
      h2('This application is designed to predict the next word based on a trained model.', id = 'sub-title')
  ),
  
  sidebarLayout(
    sidebarPanel(
      textAreaInput('query', 'Enter your text:', value = "", rows = 3, placeholder = "Type here and press Enter..."),
      numericInput('number', 'Number of words to predict:', 1, min = 1, max = 5),
      div(class = 'instructions',
          tags$h4("Instructions:"),
          p("Type a phrase in the box above and specify how many next words you want predicted."),
          p("The model uses historical data to generate predictions based on the context of your input.")
      )
    ),
    mainPanel(
      tags$h4('Predicted next words:', class = 'title'),
      div(verbatimTextOutput('predicted'), class = "result")
    )
  )
)

# Define server logic for the application
server <- function(input, output) {
  observeEvent(input$query, {
    if (nchar(input$query) > 0) {
      result <- nextWords(input$query, input$number, nGramTable)
      output$predicted <- renderText({
        paste("Predicted words:", result)
      })
    } else {
      output$predicted <- renderText("Please enter a query to get predictions.")
    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)
