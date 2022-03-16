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
    ylab = "Number of vehicles"
    
)
