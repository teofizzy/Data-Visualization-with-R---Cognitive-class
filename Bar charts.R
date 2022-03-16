mtcars
library(ggplot2)
qplot(
    mtcars$cyl,
    geom = "bar")
mtcars$cyl
qplot(mtcars$cyl,
      geom = "bar")
#geometry type set to bar
#to make it more visually appealing, you can alter the colors using the fill parameter.
#you can also label the axes as xlab and ylab for their respective axes
qplot(
    mtcars$cyl,
    geom = "bar",
    fill = I("blue"),
    xlab = "cylinders",
    ylab = "Number of vehicles",
    main = "cylinders in mtcars"
    
)

######### Histograms
# Histograms are used to visualize the frequency of numerical values
# A histogram can also display the variable's probability distribution
qplot(mtcars$hp,
      geom = "histogram",
      )
#When we run this, we get a warning about the number of bins.
#We can improve the smoothness of the histogram by addressing this problem.
qplot(mtcars$hp,
      geom = "histogram",
      binwidth = 25
)
#Larger bin widths will result in more smoothing, but you may start to lose some of the important
#details of the distribution.
qplot(mtcars$hp,
      geom = "histogram",
      binwidth = 25,
      colour = I("black"),
      xlim = c(50,350),
      xlab = "horsepower",
      ylab = "number of cars",
      alpha = I(0),
      main = "Histogram"
)
# The binwidth smooths the histogram, the xlim gives the range for the x values
# The alpha parameter removes the fill colour completely
