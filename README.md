# A Simple Twitter Bot for Enrollment Management
@brocktibert 


## Why
It's more for fun than anything else, but the aim is to highlight to hack together a simple bot that follows a set of related hashtags. 


## Basic Approach
Assuming that the hashtags we are following are relatively low volume, the bot should be able to stay within the existing API limitations.   

1.  Search for hashtags and save the data to a basic SQLite database backend  
2.  Each time the data are collected, apply various scripts to determine what to do next

The bot, for example, could do the following: 

-  Follow key users  
-  Tweet out links to emerging/popular stories  
-  Summarize the key stories / tweets  
-  Create our own `who-to-follow` based on the hashtags and the user's followers  

## Technology

1.  `twitteR` package  
2.  ...


## Notes  

-  Keep this as modules, so we can add functionality as we go  
-  NYT API or Chronicle/Inside Higher Ed news crawling  
-  Post summarized top stories to a wordpress site and tweet out the link  


