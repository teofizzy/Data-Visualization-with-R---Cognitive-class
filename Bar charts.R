#####Bar charts
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
#||details of the distribution.
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
require(ggplot2)
install.packages("ggplot")
library(ggplot)


###### Pie charts
## In the ggplot2 package, to draw a pie chart you must first draw a stacked bar plot
##A stacked bar plot places the bars on the vertical axis, 
##||instead of separating the bars across the horizontal axis.
barp<- ggplot(mtcars, aes(x=1, y = sort(mtcars$carb), fill = sort(mtcars$carb)))+ 
    geom_bar(stat = "identity")
print(barp)
##we specify the mtcars dataset in the first parameter, and then we specify the x and y axes.
##Since we're interested in carburetors, we'll use that column of the mtcars dataset.
##The 'geom_bar' method with the 'stat = identity' parameter will help to stack our bars the
##||way we want them.
barp1<- ggplot(mtcars, aes(x=1, y = sort('carb'), fill = sort('carb')))+ 
    geom_bar(stat = "identity")
barp1
barp<-barp + coord_polar(theta = 'y')
print(barp)
##The theta function helps prevent the warping of the axes during transformation.
##It also allows us to see labels on the graph.
barp<-barp + coord_polar(theta = 'y')
barp6<- barp + theme(
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.y = element_blank(),
    panel.background = element_blank()) +
    labs(y = "Carburetors")
print(barp6)
