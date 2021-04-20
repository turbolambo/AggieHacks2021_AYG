tweets = read.csv("C:/Users/Xuran/Desktop/UCD/Hackathon/COVIDVaccineTweet+Sentiment.csv")

str(tweets)

# Check for Missing Values 
anyNA(tweets)
# Number of Missing Values
sum(is.na(tweets$compound))

row.has.na <- apply(tweets, 1, function(x){any(is.na(x))})
sum(row.has.na)
tweets <- tweets[!row.has.na,]

library(lubridate)

tweets$date <- mdy(tweets$date)
tweets$date

# Install
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

mydata.Corpus = VCorpus(VectorSource(comments$comment_body))
mydata.Corpus <- sapply(mydata.Corpus, function(x) {
  x <- gsub("weâ???Tre", "", x)
  x <- gsub("itâ???Ts", "", x)
  x <- gsub("â???"", "", x)
  x <- gsub("â???o", "", x)
  x <- gsub("donâ???Tt", "", x)
  x <- gsub("itâ???Ts", "", x)
  x <- gsub("letâ???Ts", "", x)
  x <- gsub("â???\u009d", "", x)
  x <- gsub("itâ???Ts", "", x)
  x <- gsub("heâ???Ts", "", x)
} )
mydata.Corpus = VCorpus(VectorSource(mydata.Corpus))

#Data Cleaning and Wrangling
mydata.Clean = tm_map(mydata.Corpus,PlainTextDocument)
mydata.Clean = tm_map(mydata.Corpus, content_transformer(tolower)) #Convert the text to lower case
mydata.Clean = tm_map(mydata.Clean, removeNumbers) #Remove numbers
mydata.Clean = tm_map(mydata.Clean, removeWords, stopwords("english")) 
mydata.Clean = tm_map(mydata.Clean, removePunctuation)
mydata.Clean = tm_map(mydata.Clean, stripWhitespace)
mydata.Clean = tm_map(mydata.Clean, removeWords, c("get","can","will","make","one","just","need","like",'vaccine','covid')) 

#Matrix of Word Frequency
mydatatm = TermDocumentMatrix(mydata.Clean)
m = as.matrix(mydatatm)
v = sort(rowSums(m), decreasing = TRUE)
d = data.frame(word = names(v), freq=v)

head(d,10)
topword = head(d,10)

# 10 Most Frequency Words
library(ggplot2)
ggplot(data=topword,aes(x=reorder(word,-freq), y=freq))+
  geom_bar(stat="identity",fill = "#00AFBB")+
  labs(y="Frequency",x="Top Words",title="Top 10 Words Frequency")

# Word Cloud
set.seed(1234)
wordcloud(words = mydata.Clean, scale=c(4,0.5),min.freq = 5,
          max.words=100, random.order=FALSE, use.r.layout=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))

plot_ly(tweets_avg,x = ~x, type = "histogram")
plot_ly(tweets,x = ~compound, type = "histogram")


# Time Series
install.packages("plotly")
library(plotly)

library(tidyverse)

tweets_avg <- aggregate(tweets$compound, by = list(tweets$date), mean)

# Boxplot of sentiment score
plot_ly(tweets, y= ~compound, type="box")

# Scatterplot of sentiment score vs. retweet count
plot_ly(tweets, x= ~compound, y= ~retweets) %>%
  layout(title="Sentiment Score vs. Retweet Count")

# Sentiment Time Series
plot_ly() %>%
  layout(title="Average Sentiment Score Over Time") %>%
  add_lines(x = tweets_avg$Group.1, y = tweets_avg$x, mode = 'lines', name = "Sentiment Time Series", line=list(color = "#00AFBB"), opacity = 0.8)
