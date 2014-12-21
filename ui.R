# ui.R

shinyUI(
  navbarPage("Navigation Bar",
    tabPanel("App",
      titlePanel("Height Predictor App"),
      sidebarLayout(
        sidebarPanel(
          numericInput('fatherHeight','Input your father\'s height in inches:', 50, min= 36, max = 96, step = 1)
        ),
        mainPanel(
          h4("You entered the following for your father\'s height in inches:"),
          verbatimTextOutput("oFatherHeight"),
          h4("Our prediction of your adult height in inches: "),
          verbatimTextOutput("oSonHeight")
        )
      )
    ),
    tabPanel("Documentation",
      titlePanel("Height Predictor App Documentation"),
      "The Height Predictor App is very simple to use.",
      h4("Instructions"),
      tags$ol(
        tags$li("Enter your father's height in inches via the input box on the left panel.  The allowed input range is 36 to 96."), 
        tags$li("Verify that your father's height is correctly displayed on the right panel."), 
        tags$li("View your predicted height (or predicted height of a son of your father's) in the right panel.")
      ),
      h4("Other notes"),
      tags$ul(
        tags$li("Due to data availability, this app is restricted to height of males (fathers and sons)."), 
        tags$li("The prediction uses a linear model based on the father.son data in the UsingR package.")
      )
    )
  )
)