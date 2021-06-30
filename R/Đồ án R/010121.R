#Load Data
url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports_us/01-01-2021.csv"
df <- read.csv(url, header = TRUE)
df <- df[1:10]

#Summarize
str(df)
summary(df)
library(dplyr)
library(ggplot2)

ggplot(data=df, aes(x=Province_State, y=Deaths)) + geom_boxplot(stat="boxplot")
df=sample(df,10)
