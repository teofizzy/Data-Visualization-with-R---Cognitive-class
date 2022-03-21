library(ggplot2)
mtcars

####Scatterplot
## The qplot parameter is uswed for basic scatter plots
qplot(mpg, wt, data = mtcars)

##For more customization, use the ggplot parameter
ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point(shape = 1) 
## The addition of the geom_point parameter allows for the inclusion of the shape parameter
## If the shape is set to 19, you revert back to the solid dots from before
mtcars$cyl_factor<- factor(mtcars$cyl)

###you can use shape as a third factor, 
###the cars can be categorized by the size of the cylinders
ggplot(mtcars, aes(x= mpg, y = wt, shape = cyl_factor)) + geom_point()

### Color: add color parameter in the geom_point parameter
### YOu can also categorize the cars by the color method
ggplot(mtcars, aes(x= mpg, y = wt))+ geom_point(shape = 19, colour = "blue")

## Third variable as colour
ggplot(mtcars, aes(x =  mpg, y = wt, colour = cyl)) + geom_point(shape = 19)
## When we use cyl_factor as a categorizing variable, we get a different plot
## | compare it with the plot above which uses the cylinder data as numeric range
ggplot(mtcars, aes(x =  mpg, y = wt, colour = cyl_factor)) + geom_point(shape = 19) + labs(title = "scatterplot", x = "Miles per gallon", y = "weight", colour = "cylinders")
ggplot(mtcars, aes(x =  mpg, y = wt, colour = cyl_factor)) + geom_point(shape = 19) + xlab("miles per gallon") + ylab("weight") + labs(colour = "Number of cylinders") + ggtitle("Scatterplot")

##### Line Plots
EuStockMarkets
EuStockMarkets_df<-as.data.frame(EuStockMarkets)
EuStockMarkets_df
head(EuStockMarkets_df)
tail(EuStockMarkets_df)
## The x = c(1:nrow()) simply specifies the current row number
ggplot(EuStockMarkets_df, aes( x= c(1:nrow(EuStockMarkets_df)), y = DAX)) + geom_line()
## You can change the width of the line by adjusting the width parameter
line_plot_1<-ggplot(EuStockMarkets_df, aes( x= c(1:nrow(EuStockMarkets_df)), y = DAX)) + geom_line(size = 1.5, colour = "light blue") + labs(x= "time", y= "stocks")
##you can plot more lines to the graph, by adding more 'geom_lines'
DAX_SMI_Plot<- ggplot()+
    geom_line(data = EuStockMarkets_df, aes(x=c(1:nrow(EuStockMarkets_df)), 
                                         y = DAX, colour = "lightblue")) + 
    geom_line(data = EuStockMarkets_df, aes(x=c(1:nrow(EuStockMarkets_df)),
                                          y = SMI, colour = "red")) +
    labs(x = "time", y = "stocks", title = "Multiple Line plots")
DAX_SMI_Plot
all_stocks_plot<-ggplot()+
    geom_line(data = EuStockMarkets_df, aes(x = c(1:nrow(EuStockMarkets_df)), y = DAX,
                                            colour = "lightblue")) +
    geom_line(data = EuStockMarkets_df, aes(x = c(1:nrow(EuStockMarkets_df)), y = SMI,
                                            colour = "red")) +
    geom_line(data = EuStockMarkets_df, aes(x = c(1:nrow(EuStockMarkets_df)), y = CAC,
                                            colour = "Purple")) +
    geom_line(data = EuStockMarkets_df, aes(x = c(1:nrow(EuStockMarkets_df)), y = FTSE,
                                            colour = "green")) +
    labs(x = "time", y = "stocks")
print(all_stocks_plot)
legend_stocks<-all_stocks_plot +
    xlab("Days") +
    ylab("price")+
    ggtitle("Eu Stocks")
print(legend_stocks)


#### Linear Regression
ggplot(mtcars, aes(x = mpg, y = wt)) +
    geom_point(shape = 19) +
    geom_smooth(method = "lm", se = FALSE, colour = "red")
#se = TRUE <- confidence interval appear (default= TRUE)
# to categorize further, we have included another factor which is colour
ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl_factor)) +
    geom_point(shape = 19) +
    geom_smooth(method = "lm", se = TRUE, colour = "red") +
    xlab("miles per gallon") +
    ylab("weight") +
    labs(colour = "number of Cylinders") +
    ggtitle("Linear Regression")


##### Gaussian Model
### To fit a Gaussian model, model != "lm" but model = "auto"
ggplot(mtcars, aes(x = mpg, y = wt, colour = cyl_factor)) +
    geom_point(shape = 19) +
    geom_smooth(method = "auto", se = TRUE, colour = "red") +
    xlab("miles per gallon") +
    ylab("weight") +
    labs(colour = "number of Cylinders") +
    ggtitle("Gaussian Regression")

    
