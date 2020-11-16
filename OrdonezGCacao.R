#install.packages('tidyverse')
install.packages("RPostgreSQL")
require("RPostgreSQL")
pw <- { "12345678"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "ordonezgcacao",
                 host = "localhost", port = 5432,
                 user = "karinaordonezg", password = pw)
out <- dbGetQuery(con,"select *from plantacion")
outi <- dbGetQuery(con,"select *from produccion")
#####VALIDO
library(DBI)
con <- dbConnect(odbc::odbc(),database="ordonezgcacao", .connection_string = "Driver={PostgreSQL Unicode};", timeout = 10)
result <- dbSendQuery(con,"select *from plantacion)
