###word clouds
#using the dir.create argument to create a directory for our file
# then use the download.file to download the file into our new directory by providing the file path
install.packages("tm")
install.packages("wordcloud")
dir.create("/file_path/wordcloud")
getwd()
setwd("C:/Users/hp/Documents/R/fizzy/Data-Visualization-with-R---Cognitive-class/wordcloud")
getwd()
dir.create("C:/Users/hp/Documents/R/fizzy/Data-Visualization-with-R---Cognitive-class/wordcloud")
download.file("https://ibm.box.com/shared/statis/cmid70rpa7xe4ocitcgalbve7r0kqnia.txt",
              destfile = "C:/Users/hp/Documents/R/fizzy/Data-Visualization-with-R---Cognitive-class/wordcloud/churchill_speeches.txt")
## I need to review, dir.create, download.file and getwd, setwd

###Radar charts - display multivariate data within one plot
library(ggplot2)
require(scales)
require(dplyr)
library(devtools)
devtools::install_github("ricardo-bion/ggradar")
install.packages("installr")

mtcars
mtcars%>% # the expression after mtcars is the pipe operator
add_rownames(var="group")%>%    
mutate_each(funs(rescale),-group)%>% # assign each variable --carnames-- to their related variables   
head(3)%>%select(1:10)->mtcars_radar # select which data to plot   
# this code will generate lots of warnings, to supress them
options(warn=-1)
ggradar(mtcars_radar)
sessionInfo()
