#### Visualizing the Results
### Simple Linear Regression


income.graph<-ggplot(income.data, aes(x=income, y=happiness))+
    geom_point()
income.graph
?ggplot2

## Research on why the above code does not work
##Add the regression line using geom_smooth()
#|and typing in lm as your method for creating the line.


income.graph <- income.graph + geom_smooth(method="lm", col="black")
income.graph

##To add the reg line equation
income.graph <- income.graph +
    stat_regline_equation(label.x = 3, label.y = 7)

income.graph

## We can add some style parameters using theme_bw() and making custom labels using labs().

income.graph +
    theme_bw() +
    labs(title = "Reported happiness as a function of income",
         x = "Income (x$10,000)",
         y = "Happiness score (0 to 10)")

### Multiple Linear Regression
## Use the function expand.grid() to create a dataframe with the parameters you supply.
#| Within this function we will:
#|Create a sequence from the lowest to the highest value of your observed biking data;
#|Choose the minimum, mean, and maximum values of smoking, in order to make 3 levels of smoking over which to predict rates of heart disease.
plotting.data<-expand.grid(
    biking = seq(min(heart.data$biking), max(heart.data$biking), length.out=30),
    smoking=c(min(heart.data$smoking), mean(heart.data$smoking), max(heart.data$smoking)))
plotting.data

## To predict the 'y values'
plotting.data$predicted.y <- predict.lm(heart.disease.lm, newdata=plotting.data)
plotting.data$predicted.y

## rounding the smoking to 2 digits makes the legend easier to read later on
plotting.data$smoking <- round(plotting.data$smoking, digits = 2)

## switch the smoking to a factor
plotting.data$smoking <- as.factor(plotting.data$smoking)
plotting.data$smoking

## Plot the original data
heart.plot <- ggplot(heart.data, aes(x=biking, y=heart.disease)) +
    geom_point()

## To add regression line
heart.plot <- heart.plot +
    geom_line(data=plotting.data, aes(x=biking, y=predicted.y, color=smoking), size=1.25)
heart.plot

## Readying the graph
heart.plot <-
    heart.plot +
    theme_bw() +
    labs(title = "Rates of heart disease (% of population) \n as a function of biking to work and smoking",
         x = "Biking to work (% of population)",
         y = "Heart disease (% of population)",
         color = "Smoking \n (% of population)")
