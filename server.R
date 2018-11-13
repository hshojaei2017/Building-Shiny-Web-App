#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(Hmisc)

mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V-shaped", "Straight"))
  am <- factor(am, labels = c("Automatic", "Manual"))
  cyl  <- factor(cyl)
  gear <- factor(gear)
  carb <- factor(carb)
})

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   
  output$xyPlot <- renderPlot({
    
    g <- ggplot(data = mtcars2, aes(x=mtcars2[[input$predictor]], y=mtcars2[[input$response_var]]))+
      geom_point(aes(x=mtcars2[[input$predictor]], y=mtcars2[[input$response_var]],
                     colour = mtcars2[[input$color]], shape = mtcars2[[input$shape]]),
                 size = 3, alpha = 1)+
      labs(x = input$predictor,
           y = input$response_var,
           colour = input$color,
           shape = input$shape)
    
    if (input$show_lm) {
      g <- g + geom_smooth(method = "lm", se = input$show_se)
    }
    
    g +theme_bw(base_size = 18) 

  }, height = 400, width = 600)
  
  
  output$LM_coeff <- renderText({
    modFit <- lm(mtcars2[[input$response_var]] ~ mtcars2[[input$predictor]] )
    paste("Y = ", round(modFit$coefficients[[2]], 2), "X + ",
                  round(modFit$coefficients[[1]],2))
  })
  
  output$LM_R2 <- renderText({
    modFit <- lm(mtcars2[[input$response_var]] ~ mtcars2[[input$predictor]] )
    round(summary(modFit)$r.squared, 2)
  })
  
})
