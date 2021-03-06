library(dplyr)
library(ggplot2)
library(plotly)
#Load Data
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-07-2021.csv"
df <- read.csv(url, header = TRUE)
#Nhom du lieu
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Deaths = sum(Deaths))
#Sort
country <- country[order(-country$Deaths),]
country_n<-country[1:5,]
others=sum(country$Deaths)-sum(country_n$Deaths)
others<-data.frame("Others", others)
names(others)<-c("Country_Region","Deaths")
country <- rbind(country_n, others)

pie <- country %>%
  plot_ly(labels = ~ Country_Region, values = ~ Deaths, type = 'pie',
          textposition = 'inside',
          textinfo = 'label+percent',
          insidetextfont = list(color = 'white'),
          hoverinfo = 'text',
          text = ~paste(Deaths, 'human'),
          marker = list(line = list(color = 'white', width = 2)),
          showlegend = TRUE)

pie <- pie %>% 
  layout(title = 'Deaths by Country region (7/7/2021)',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

ggplotly(pie)

