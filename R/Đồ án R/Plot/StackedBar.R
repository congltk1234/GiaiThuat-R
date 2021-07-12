library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)

#Load Data
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-29-2021.csv"
df <- read.csv(url, header = TRUE)
#Nhom du lieu
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Recovered=sum(Recovered),
                                 Confirmed=sum(Confirmed),
                                 Deaths=sum(Deaths),
                                 Active=sum(Active))
#Sort
country <- country[order(-country$Confirmed),]
stacked <- country %>% filter(Country_Region == "Brazil")
india<-country %>% filter(Country_Region == "India")
stacked<-rbind(stacked,india)
rus<-country %>% filter(Country_Region == "Russia")
stacked<-rbind(stacked,rus)

fig <- plot_ly(stacked, x = ~Country_Region, y = ~Active, type = 'bar', name = 'Active',marker= list(color='blue'))
fig <- fig %>% add_trace(y = ~Recovered, name = 'Recovered',marker= list(color='lightgreen'))
fig <- fig %>% add_trace(y = ~Deaths, name = 'Deaths',text =stacked$Confirmed, textposition = 'auto',marker= list(color='red'))
fig <- fig %>% layout(title='Stacked Bar Chart',yaxis = list(title = 'Count'), barmode = 'stack')

fig

