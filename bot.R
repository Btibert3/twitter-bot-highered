###############################################################################
## The bot
###############################################################################

## load the libraries
library(RSQLite)
library(twitteR)

## connect
ch = dbConnect(SQLite(), "data/em-bot.db")

## source the credentials
source("R/creds.R")

## authenticate with the twitter API using twitteR package
setup_twitter_oauth(consumer_key = consumer_key, 
                    consumer_secret = consumer_secret, 
                    access_token = access_token, 
                    access_secret = access_token_secret)

## use twitteR to search for the tweets we want
## NOTE: query strings seems to want things parsed by regex (not emchat OR heweb)
Q = "emchat"
s = searchTwitter(Q, n=1500, lang="en")

## write the data to the database
tweets = twListToDF(s)
dbWriteTable(ch, "highered", tweets, append=TRUE)



## find the since id
SQL = ""
since =
