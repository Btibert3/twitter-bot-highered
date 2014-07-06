###############################################################################
## Interface with the NYT API
## http://developer.nytimes.com/io-docs (need to be signed in)
## 
###############################################################################

## basics
library(RCurl)
library(rjson)


## API basics
KEY = ""
 
## DEFINE THE ENDPOINT
EP = "http://api.nytimes.com/svc/search/v2/articlesearch.json"

## the parameters
# QUERY = 'subject:("Colleges and Universities")'
START_DATE = "20140701"
END_DATE = "20140704"

## Build the URL
## uses subject to filter on keywork Colleges and Universities
URL = paste(EP, "?fq=",
            'subject%3A%28%22Colleges+and+Universities%22%29', 
            "&begin_date=", START_DATE,
            "&end_date=", END_DATE, 
            "&api-key=", URLencode(KEY), sep="")
tmp = getURL(URL)
  

## KEY = search for the day, and if more than 10, page through
## store the urls in the database, check to see if they are being tweeted
## when sample gets big enough, predict if the story will be shared, and if so, tweet