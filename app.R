## Shiny App Template ##
#
# library(shiny)
#
# ui <- fluidpage(
# *Input functions
# *Output functions
# )
#
# server <- function(input, output) {}
#
# shinyApp(ui=ui, server=server)

#Common Errors
## *Cannot have setwd() in web app because server can't follow that directory* ##
#install.pacakges("Don't forget quotation marks")



library(shiny)

#control user interface and how input data is recieved 
ui <- fluidPage(
 
 wellPanel(
  fluidRow(column(4,offset = 4,tags$h1("Hello World")))
 ),
  
 sliderInput(inputId = "num", 
              label = "Choose a number",
              value = 25, min = 1, max = 100),
 
  plotOutput("hist")
)
  
#tells server how to convert the inputs into outputs
# Steps for reactivity:
# 1. Save the output that you build to output$
# 2. Build the output with the render function  (converts to html)
# 3. Access inputs with input$(name of input)

server <- function(input, output) {
 output$hist <- renderPlot({
   hist(rnorm(input$num))      
 })
  #output$title <- renderText("Welcome")
}

  
#links it all together and converts everything to HTML, CSS, and JS 
shinyApp(ui = ui, server = server)


#library(rsconnect)
#rsconnect::deployApp("C://Users//Joshua Marangoni//Desktop//R Projects//App-1")


