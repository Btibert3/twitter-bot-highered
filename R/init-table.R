## if the table doesnt exist, create it with a PK
if (! "emtweets" %in% dbListTables(ch)) {
  SQL = sprintf("CREATE TABLE %s(%s, primary key(%s))", "emtweets",
                paste(names(tweets), collapse = ", "),
                "id")
  dbGetQuery(ch, SQL)
}