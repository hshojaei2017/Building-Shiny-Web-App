#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

varchoices <- names(mtcars)
markerchoices <- names(mtcars)[c(2,8,9,10,11)]

# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Visualizing and Quantifying mtcars Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("response_var",
                   "Response Variable",
                    varchoices,
                    selected = "mpg",
                    multiple = FALSE),
       selectInput("predictor",
                   "Independent Variable",
                   varchoices,
                   selected = "wt",
                   multiple = FALSE),
       selectInput("color",
                   "Marker Color",
                   markerchoices,
                   selected = "cyl",
                   multiple = FALSE),
       selectInput("shape",
                   "Marker Shape",
                   markerchoices,
                   selected = "am",
                   multiple = FALSE),
       checkboxInput("show_lm", 
                     "Show/Hide Regression Line", 
                     value = TRUE),
       checkboxInput("show_se", 
                     "Show/Hide Confidence Interval", 
                     value = FALSE)
    ),
    
    # Show the plot
    mainPanel(
       plotOutput("xyPlot"),
       h5("The fitted equation:"),
       textOutput("LM_coeff"),
       h5("R-squared:"),
       textOutput("LM_R2")
    )
  )
))
