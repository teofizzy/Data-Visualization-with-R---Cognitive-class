install.packages("tm")
library(tm)
library(wordcloud)
library(dplyr)
install.packages("wordcloud")
dir.create("C:/Users/hp/Documents/R/fizzy/Data-Visualization-with-R---Cognitive-class/wordcloud")
setwd("C:/Users/hp/Documents/R/fizzy/Data-Visualization-with-R---Cognitive-class/wordcloud")
download.file("https://ibm.box.com/shared/static/cmid70rpa7xe4ocitcga1bve7r0kqnia.txt",
              destfile = "C:/Users/hp/Documents/R/fizzy/Data-Visualization-with-R---Cognitive-class/wordcloud/churchill_speeches.txt",
              quiet = TRUE)
#select the directory that our text is located
path_1.0<-"C:/Users/hp/Documents/R/fizzy/Data-Visualization-with-R---Cognitive-class/wordcloud"
church_speech<-Corpus(DirSource(dirpath))#the corpus method allows us to load our data
church_speech
#the inspect method can be used to test the text structure of our corpus
inspect(church_speech)

#going through a data cleaning process will both the quality if the data and the
#|resulting visualization
church_speech<-tm_map(church_speech, content_transformer(tolower))#transforms all the characters
#|to lower case.
church_speech<-tm_map(church_speech, removeNumbers)# this removes all the numbers
church_speech<-tm_map(church_speech, removeWords, stopwords("english"))#this removes commonwords
#| like the & and
#| you can also remove your own stopwords by specifying them in a character vector.
church_speech<-tm_map(church_speech, removeWords,
                      c("floccinaucinihilipification","squirelled"))
#we can remove punctuation as shown below
church_speech<-tm_map(church_speech, removePunctuation)
#finally we reomve unnecessary whitespac using the stripwhitespace argument.
church_speech<-tm_map(church_speech, stripWhitespace)
# we then create a term matrix document which is a table that contains the frquency of the words
term.mat<-TermDocumentMatrix(church_speech)
# we then tansform it into a matrix form
term.mat1<-as.matrix(term.mat)
term.mat1
#sort to show the most frequent words
term.mat2<-sort(rowSums(term.mat1), decreasing = TRUE)
term.mat2
t<-data.frame(term.mat2)
t
b<-data.frame(word = names(term.mat2), freq = term.mat2)
head(b,20)
wordcloud(words = b$word, b$freq)
#you can adjust the number of words by specifying the minimum frequency
wordcloud(words = b$word, b$freq, min.freq = 1)
#you can also impose a limit on the number of words to be displayed e.g:
wordcloud(words = b$word, b$freq, min.freq = 1, max.words = 200,
          colors = brewer.pal(8,"Dark2"),
          random.order = FALSE, random.color = FALSE)

