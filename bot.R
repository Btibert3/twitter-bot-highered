###############################################################################
## The bot
###############################################################################

## load the libraries
library(RSQLite)
library(twitteR)
library(stringr)

## The bot
while (TRUE) {
  
  ## connect
  ch = dbConnect(SQLite(), "data/em-bot.db")
  
  ## source the credentials
  source("R/creds.R")
  
  ## authenticate with the twitter API using twitteR package
  setup_twitter_oauth(consumer_key = consumer_key, 
                      consumer_secret = consumer_secret, 
                      access_token = access_token, 
                      access_secret = access_token_secret)
  
  
  ## Every 3 hours, process the tweets
  if (format(Sys.time(), "%M") %in% c('0','3','6','9','12','15','18','21')) {
    ## find the last id to use
    SQL = "SELECT MAX(id) as id FROM emtweets"
    sinceID = dbGetQuery(ch, SQL, stringsAsFactors=F)
    sinceID = as.character(sinceID$id)
    
    ## use twitteR to search for the tweets we want
    ## NOTE: query strings seems to want things parsed by regex (not emchat OR heweb)
    Q = "emchat OR highered OR hemktg OR heweb"
    s = searchTwitter(Q, n=1500, lang="en", sinceID = sinceID)
    tweets = twListToDF(s)
    
    ## process the tweets with various algorithms to test if RT, post, etc. here
    ## ...
    ## ...
    
    ## write the data to the database
    dbWriteTable(ch, "emtweets", tweets, append=TRUE, row.names=F)
    dbDisconnect(ch)

  } #endif for grabbing data
  
  ## get the data from NYT
  
  ## 
}










