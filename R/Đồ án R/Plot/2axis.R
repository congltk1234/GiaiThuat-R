library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
theme_set(theme_minimal())
#ConfirmDataset
confirm_url<-'https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv'
confirm <- read_csv(confirm_url)
confirm <- confirm %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "confirmed_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(confirmed_n = sum(confirmed_n)) %>%
  ungroup()

confirm <- confirm %>%
  arrange(date) %>%
  group_by(country_region) %>%
  ungroup()
confirm <- confirm %>%
  arrange(date) %>%
  group_by(country_region) %>%
  mutate(new_cases_n = confirmed_n - lag(confirmed_n, default = 0)) %>%
  ungroup()

Vietnam <- confirm %>% filter(country_region == "Vietnam")


#Recovered
recover_url<-'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv'
recover<-read_csv(recover_url)
recover <- recover %>%
  pivot_longer(-c(`Province/State`, `Country/Region`, Lat, Long),
               names_to = "date",
               values_to = "recovered_n"
  ) %>%
  select(-c(Lat, Long)) %>%
  rename(
    province_state = `Province/State`,
    country_region = `Country/Region`
  ) %>%
  mutate(date = mdy(date)) %>%
  group_by(country_region, date) %>%
  summarise(recovered_n = sum(recovered_n)) %>%
  ungroup()

recover <- recover %>%
  arrange(date) %>%
  group_by(country_region) %>%  ungroup()
recover <- recover %>%
  arrange(date) %>%
  group_by(country_region) %>%
  mutate(new_recover = recovered_n - lag(recovered_n, default = 0)) %>%
  ungroup()
recover <- recover %>% filter(country_region=='Vietnam')
recover <-recover[c('new_recover')]
Vietnam <- cbind(Vietnam,recover)

#Fig
ay <- list(
  tickfont = list(color = "green"),
  overlaying = "y",
  side = "right",
  title = "Recover cases")

fig <- plot_ly(Vietnam, x = ~date)
fig <- fig %>% add_trace(y = ~new_recover, name = "Recovered", yaxis = "y2", type='bar',
                         marker=list(opacity=0.5,color='green'),text =Vietnam$new_recover, textposition = 'auto')
fig <- fig %>% add_lines(y = ~new_cases_n, name = "Confirmed", yaxis='y1')

fig <- fig %>% add_trace(y = ~new_cases_n, name = "Confirmed", yaxis='y1', type = 'scatter',mode='text',
                         text =Vietnam$new_cases_n, textposition = 'auto')
fig <- fig %>% layout(
  title = "Vietnam Timeseries newcases",
  xaxis = list(
    rangeselector = list(
      buttons = list(
        list(
          count = 7,
          label = "1week",
          step = "day",
          stepmode = "todate"),
        list(
          count = 14,
          label = "2week",
          step = "day",
          stepmode = "todate"),
        list(
          count = 3,
          label = "3 mo",
          step = "month",
          stepmode = "backward"),
        list(
          count = 6,
          label = "6 mo",
          step = "month",
          stepmode = "backward"))),
    
    rangeslider = list(type = "date")),
  yaxis2=ay)
fig

