library(ggplot2)
library(dplyr)
library(broom)
install.packages("ggpubr")
install.packages("broom")
summary(income.data)
summary(heart.data)
library(ggpubr)

###### Simple Linear Reg Prerequisites

## Before you perform regression, first confirm for independence(no autocorrelation),
##||normality of the dist.,linearity and homoscedasticity (aka homogeneity of variance)

##To check whether the dependent variable follows a normal distribution, use the hist() function.
hist(income.data$happiness)

##To check linearity use the plot function, it results in a scatterplot
plot(happiness ~ income, data = income.data)

###### MUltiple Linear Reg Prerequisites

## To confirm independence, use the cor() function
cor(heart.data$biking, heart.data$smoking)
## The correlation is only , only about 1.5% thus we can include both variables in our model

## To check for normality, use hist() function on the variable heart.disease
hist(heart.data$smoking)
hist(heart.data$biking)
hist(heart.data$X)
hist(heart.data$heart.disease)

## To check for linearity, use the plot() function
plot(heart.disease ~ biking, data = heart.data)

?lm

#### Simple Linear Regression
income.happiness.lm <- lm(happiness ~ income, data = income.data)
income.happiness.lm
summary(income.happiness.lm)
residuals(income.happiness.lm)
predict(income.happiness.lm)
anova(income.happiness.lm)
fitted(income.happiness.lm)
range<-income.data$happiness
range
summary(range)
coefficients(income.happiness.lm)
install.packages("moments")
library(moments)
?skewness

### Need to research on skewness and kurtosis in the moments package

## Check for homoscedasticity

## Note that the par(mfrow()) command will divide the Plots window into the
#| number of rows and columns specified in the brackets.
#| So par(mfrow=c(2,2)) divides it up into two rows and two columns.
#| To go back to plotting one graph in the entire window,
#| set the parameters again and replace the (2,2) with (1,1).

par(mfrow=c(2,2))
plot(income.happiness.lm)
par(mfrow=c(1,1))par(mfrow=c(2,2))
plot(income.happiness.lm)
par(mfrow=c(1,1))

#### Multiple Linear Regression
heart.disease.lm<-lm(heart.disease ~ biking + smoking, data = heart.data)
heart.disease.lm
summary(heart.disease.lm)
residuals(heart.disease.lm)
predict(heart.disease.lm)


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

graph_0<-income.graph +
    theme_bw() +
    labs(title = "Reported happiness as a function of income",
         x = "Income (x$10,000)",
         y = "Happiness score (0 to 10)")
graph_0


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
plotting.data_1<-as.factor(plotting.data$smoking)
plotting.data_1

## Plot the original data
heart.plot <- ggplot(heart.data, aes(x=biking, y=heart.disease)) +
    geom_point()

## To add regression line
heart.plot_0<- heart.plot +
    geom_line(data=plotting.data, aes(x=biking, y=predicted.y, color=smoking), size=1.25)
heart.plot_0

## Readying the graph
heart.plot_1 <-
    heart.plot_0 +
    theme_bw() +
    labs(title = "Rates of heart disease (% of population) \n as a function of biking to work and smoking",
         x = "Biking to work (% of population)",
         y = "Heart disease (% of population)",
         color = "Smoking \n (% of population)")
heart.plot_1
