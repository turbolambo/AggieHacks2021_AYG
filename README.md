# AggieHacks2021_AYG

## Overview of the Problem

With the COVID vaccines available to public, more and more data analysts are spending time studying social media responses to various producers with vaccination progress. We leveraged the most recent Tweet data from Kaggle to assess user sentiment, identify most popular topics of tweets using topic modelling and sentiment analysis. We also studied the relationship between user sentiment and vaccine producers (extracted from hashtages of tweets) to identify differences in social media reactions toward various vaccine producers. Finally, we explored the relationship between the user behavoir and the user sentiments about the vaccines over time to further decipher social media discussion toward COVID vaccines, which we hope would help gonvernors understand the current and ongoiing attitudes toward COVID vaccine related events and policies and guidelines. 

## Data Collection

This dataset contains recent tweets from 12/20/20 about the COVID-19 vaccines used in entire world on large scale. The data is collected using tweepy Python package to access Twitter API and is stored in csv file. Uploaded to Kaggle by Gabriel Preda.

Link to the Kaggle dataset: https://www.kaggle.com/gpreda/all-covid19-vaccines-tweets

**Data collection frequency**

The collection was in the first days twice a day, until Gabriel Preda identified approximatively the new tweets quota and then collection (for all vaccines) stabilized at once a day, during morning hours (GMT).

The data used in this analysis is updated until 4/8/2021.

Thanks to Kaggler Gabriel Preda for providing such a good dataset!

## Analysis

We performed:
**Tweets Overall Analysis**

**Vaccine Brand Analysis**

**Sentiment Prediction** - Multi-Logistic Regression and Random Forest models were performed to predict sentiment based on features other than Tweet text.
            

Check out the annotated deck for more details!!!

## Recommendation

### References
https://medium.com/swlh/topic-modeling-lda-mallet-implementation-in-python-part-3-ab03e01b7cd7
https://www.kaggle.com/pawanbhandarkar/generate-smarter-word-clouds-with-log-likelihood#Smarter-Word-Clouds
https://data.cdc.gov/browse?q=COVID-19%20Vaccine%20Distribution%20Allocations%20by%20Jurisdiction%20-%20Janssen&sortBy=relevance
https://www.bloomberg.com/graphics/covid-vaccine-tracker-global-distribution/





