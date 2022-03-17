##The importance of graphs
##     The difference between R libraries
##        Qualitative vs Quantitative Data
##        The `mtcars` dataset
##        Bar Plots
##        Histograms
##        Pie Charts

##It's a way to summarize your findings and display it in a form that facilitates interpretation and can help in identifying patterns or trends.
##||Having great data visualizations will make your work more interesting and clear
install.packages("plot")
require(plot)
count <- table(mtcars$cyl)
barplot(count)
library(ggplot2)
ggplot(data= mtcars, aes(mtcars$hp))  + 
    geom_histogram(breaks=seq(40, 350, by = 25),  
                   colour = I("black"),
                   aes(fill=..count..))
head(mtcars)
tail(mtcars)
summary(mtcars)
summary(mtcars$cyl)
mean(mtcars$cyl)
mean(mtcars$mpg)
summary(mtcars$hp)
mean(mtcars$hp)
?qpot
??qplot
?qplot

## The main parameters in gglpot2 are qplot() and ggplot()
#### qplot() has a much simpler syntax than ggplot()
## colour modifies the colour to the outline and fill gives colour to the bar

qplot(mtcars$cyl, geom = "bar", fill = I("black"), colour = I("red"))

##There are more colours that are in the ggplot2 package
## This is the list of more colours: http://sape.inf.usi.ch/quick-reference/ggplot2/colour
qplot(mtcars$cyl, geom = "bar", fill = I("blue"),
      xlab = "Cylinders",
      ylab = "Number of Vehicles",
      main = "Cylinders in mtcars")
qplot(mtcars$hp, geom="histogram")
qplot(mtcars$hp, geom="histogram", binwidth = 25)
qplot(mtcars$hp, geom="histogram",
      binwidth = 25,
      colour = I("black")
      )
qplot(mtcars$hp, geom="histogram",
      binwidth = 25,
      colour = I("black"),
      xlim=c(50,350)
      )

## The xlim parameter provides the lower and upper limits to the code
## If the limit indicated leaves out a few rows or columns, R notifies you

qplot(mtcars$hp, geom="histogram",
      binwidth = 25,
      colour = I("black"),
      xlim=c(80,300)
      )
qplot(mtcars$hp,
      geom="histogram",
      binwidth = 25,
      colour = I("black"),
      xlim=c(50,350),
      alpha = I(0),
      main = "Histogram")
## Pie chart - no change from module I class
