library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)
theme_set(theme_minimal())

covid19_raw <- read_csv("https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

covid19 <- covid19_raw %>%
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

covid19 <- covid19 %>%
  arrange(date) %>%
  group_by(country_region) %>%
  mutate(new_cases_n = confirmed_n - lag(confirmed_n, default = 0)) %>%
  ungroup()
#US
us <-covid19 %>% filter(country_region == "US")
us <- us[c('date','new_cases_n')]

us<-as.numeric(us$new_cases_n)
df <- data.frame(us)

p <- ggplot(df, aes(x=us)) +
  geom_histogram(aes(y = ..density..), binwidth=density(df$us)$bw) +
  geom_density(fill="red", alpha = 0.2) + ggtitle("US newcases distribution") +
  xlab("")

fig <- ggplotly(p)

fig
