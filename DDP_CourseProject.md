Developing Data Products - Course Project
========================================================
author: Hasan Shojaei
date: 11/12/2018
autosize: true

Overview
========================================================

The main goal of this presentation is to introduce a Shiny web app we have developed for the Developing Data Products course from Coursera. 

The app loads <span style="font-weight:bold;">mtcars</span> dataset and allows the user to 

1. Plot different parameters relative to each other

2. Set marker shape and color based on different parameters

3. Fit a linear regression model to the data and display the equation

Structure of the Source Code
========================================================

The source code is made of two parts:
- <span style="font-weight:bold; color:blue;">ui.R</span> which defines the user interface
- <span style="font-weight:bold; color:blue;">server.R</span> which includes the server logic of the web app

Both of these files have been placed on GitHub for your refernce. The GitHub link can be found on the last slide. 

Code Demo
========================================================


```r
library(ggplot2)
g <- ggplot(data = mtcars, aes(x=wt, y=mpg))+
  geom_point(aes(x=wt, y=mpg, colour = factor(cyl), 
                 shape = factor(am)), size = 3, alpha = 1)+
  labs(colour = "cyl", shape = "am")+
  geom_smooth(method = "lm", se = FALSE)
g +theme_bw(base_size = 18) 
```

![plot of chunk unnamed-chunk-1](DDP_CourseProject-figure/unnamed-chunk-1-1.png)


```
[1] "Y =  -5.34 X +  37.29"
```

Links
========================================================

The Shiny app and the source codes can be found from the follwing links respectively:

- Application URL: https://hshojaei.shinyapps.io/Coursera_DDP_CourseProject/
- GitHub Repository: https://github.com/hshojaei2017/DevelopingDataProducts

