library(dplyr)
library(ggplot2)
library(plotly)
#Load Data
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-01-2020.csv"
df <- read.csv(url, header = TRUE)
#Nhom du lieu
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Deaths = sum(Deaths))
#Sort
country <- country[order(-country$Deaths),]
country_n<-country[1:7,]
others=sum(country$Deaths)-sum(country_n$Deaths)
others<-data.frame("Others", others)
names(others)<-c("Country_Region","Deaths")
country <- rbind(country_n, others)
colnames(country)[2]<-'Year2020'

#2021
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/07-01-2021.csv"
df <- read.csv(url, header = TRUE)
#Nhom du lieu
a <- df %>% group_by(Country_Region)
a<- a %>% summarise(Deaths = sum(Deaths))
#Sort
a <- a[order(-a$Deaths),]
a_n<-a[1:7,]
others=sum(a$Deaths)-sum(a_n$Deaths)
others<-data.frame("Others", others)
names(others)<-c("Country_Region","Deaths")
a <- rbind(a_n, others)
colnames(a)[2]<-'Year2021'
country<-merge(country,a,by='Country_Region')

fig <- plot_ly(country) %>%
  add_pie(labels = ~Country_Region, values = ~Year2021, type = 'pie', hole = 0.7, sort = F,
          textinfo = 'value+percent',
          insidetextfont = list(color = 'white'),
          hoverinfo = 'text', name='2021',
          marker = list(line = list(color = 'white', width = 2)),
          showlegend = TRUE) %>%
  add_pie(labels = ~Country_Region, values = ~Year2020, name='2020',
          textinfo = 'value+percent',insidetextfont = list(color = 'white'),
          marker = list(line = list(color = 'white', width = 2), opacity = 0.8), hole=0.3,
          domain = list(
            x = c(0.15, 0.85),
            y = c(0.15, 0.85)),
          sort = F) %>%
  layout(title = 'Deaths confirmed by Country region (07/07/2020 & 07/07/2021)')
fig
