###############################################################################
## The bot
###############################################################################

## load the libraries
library(RSQLite)
library(twitteR)

## connect
ch = dbConnect(SQLite(), "data/em-bot.db")


## find the last id to use
SQL = ""
since =

## source the credentials
source("R/creds.R")

## authenticate with the twitter API using twitteR package
setup_twitter_oauth(consumer_key = consumer_key, 
                    consumer_secret = consumer_secret, 
                    access_token = access_token, 
                    access_secret = access_token_secret)

## use twitteR to search for the tweets we want
## NOTE: query strings seems to want things parsed by regex (not emchat OR heweb)
Q = c("emchat", "highered", "hemtkg", "heweb")
s = searchTwitter(Q, n=1500, lang="en")
tweets = twListToDF(s)

## if the table doesnt exist, create it with a PK
# if (! "emtweets" %in% dbListTables(ch)) {
#   SQL = sprintf("CREATE TABLE %s(%s, primary key(%s))", "emtweets",
#                 paste(names(tweets), collapse = ", "),
#                 "id")
#   dbGetQuery(ch, SQL)
# }


## write the data to the database
dbWriteTable(ch, "emtweets", tweets, append=TRUE, row.names=F)




