library(shiny)
library(httr2)

get_news_articles <- function(search_term, num_results = 10) {
  req <- request("https://newsapi.org/v2/everything") |>
    req_url_query(
      q = search_term,
      from = Sys.Date() - 1,
      pageSize = num_results,
      apiKey = Sys.getenv("NEWS_API_KEY")
    )

  resp <- req_perform(req)
  resp_body_json(resp)
}

ui <- fluidPage(
  titlePanel("News Article Search"),
  sidebarLayout(
    sidebarPanel(
      textInput("search_term", "Enter a search term:"),
      actionButton("search", "Search")
    ),
    mainPanel(
      uiOutput("articles")
    )
  )
)

server <- function(input, output, session) {

  articles <- eventReactive(input$search, {
    get_news_articles(input$search_term, num_results = 10)
  })

  output$articles <- renderUI({
    req(articles())

    article_list <- articles()$articles

    if(length(article_list) == 0) {
      return(h3("No articles found."))
    }

    lapply(article_list, function(article) {
      div(
        h3(a(article$title, href = article$url)),
        p(strong("Source:"), article$source$name),
        p(strong("Published at:"), article$publishedAt),
        p(article$description),
        hr()
      )
    })
  })
}

shinyApp(ui, server)
