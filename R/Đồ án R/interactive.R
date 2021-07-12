#Load Data
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/06-29-2021.csv"
df <- read.csv(url, header = TRUE)

#Summarize
str(df)
summary(df)
library(dplyr)
library(ggplot2)
library("ggstance")
#Nhom du lieu
country <- df %>% group_by(Country_Region)
country <- country %>% summarise(Confirmed= sum(Confirmed),
                                 Deaths = sum(Deaths),
                                 Recovered = sum(Recovered),
                                 Active = sum(Active))
# ScatterPlot
https://chart-studio.plotly.com/~namanjain020/8/time-series-with-range-slider-and-selectors/#plot
  https://ggvis.rstudio.com/interactivity.html
http://www.cookbook-r.com/Graphs/Plotting_means_and_error_bars_(ggplot2)/
  http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/
  http://www.cookbook-r.com/Graphs/
  https://plotly.com/r/#controls
  