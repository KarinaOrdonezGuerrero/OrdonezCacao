#install.packages('tidyverse')
install.packages("RPostgreSQL")
library (ggplot2)
require("RPostgreSQL")
pw <- { "12345678"}
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "ordonezgcacao",
                 host = "localhost", port = 5432,
                 user = "karinaordonezg", password = pw)
out <- dbGetQuery(con,"select *from plantacion")
ggplot(data=out,
       mapping =aes(x=tipo,
                    y=cantidad))+
  geom_point()+
labs(title='HISTOGRAMA DE LA PLANTACION DE CACAO')

#####VALIDO
library(DBI)
con <- dbConnect(odbc::odbc(),database="ordonezgcacao", .connection_string = "Driver={PostgreSQL Unicode};", timeout = 10)
result <- dbSendQuery(con,"select *from plantacion)
