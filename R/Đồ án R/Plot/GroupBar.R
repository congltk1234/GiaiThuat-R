  library(dplyr)
  library(tidyverse)
  library(ggplot2)
  library(plotly)
  
  #Load Data
  url<-'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/07-07-2021.csv'
  df <- read.csv(url, header = TRUE)
  #Sort
  state <-df
  state<- state[order(-state$Confirmed),]
  state <-state[c('Province_State','Confirmed','Deaths')]
  state<-state[1:10,] %>% mutate(death_rate = Deaths/Confirmed*100)
  #Fig
  fig <- plot_ly(state, x = ~Province_State, y = ~Confirmed, type = 'bar', name = 'Confirmed',text =state$Confirmed, textposition = 'auto',
                 marker= list(color='lightred'))
  fig <- fig %>% add_trace(y = ~Deaths, name = 'Deaths',text =state$Deaths, textposition = 'auto',
                           marker=list(color='red'))
  fig <- fig %>% layout(title='Group Bar Chart',
                        yaxis = list(title = 'Count'),
                        xaxis = list(title = 'State'), barmode = 'group')
  
  fig
