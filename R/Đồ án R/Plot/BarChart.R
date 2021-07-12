#Load Data
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-29-2021.csv"
df <- read.csv(url, header = TRUE)

#Summarize
str(df)
summary(df)
library(dplyr)
library(ggplot2)
library(plotly)
#Nhom du lieu
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Deaths = sum(Deaths))
#Sort
country <- country[order(-country$Deaths),]
country<-country[1:10,]
country <- country[order(-country$Deaths),]
#BarChart
fig <- plot_ly(country,y=~Country_Region) %>%
  add_trace(x =~Deaths,
  name = "Deaths",marker=list(color = 'Reds'),
  type = "bar", text =country$Deaths, textposition = 'auto'
)
fig <- fig %>% layout(title='Deaths by Country (Bar Chart)',yaxis = list(title = 'Country'))

fig
