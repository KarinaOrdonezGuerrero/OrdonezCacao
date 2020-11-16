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
#############
ggplot(data=out, 
       aes(x=tipo))+
  geom_bar(width = 0.4,fill=rgb(0.1,1,0.5,0.7))+
  scale_x_discrete("tipo")+
  scale_y_continuous("cantidad")+
  labs(title = "HISTOGRAMA DE PLANTACION DE CACAO")

#####VALIDO
library(DBI)
con <- dbConnect(odbc::odbc(),database="ordonezgcacao", .connection_string = "Driver={PostgreSQL Unicode};", timeout = 10)
result <- dbSendQuery(con,"select *from plantacion)
