library(tidyverse)
library(httr)
library(XML)
options(warn=-1)
Source <- "CSSE at Johns Hopkins University"

deaths <- read_csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")) %>%
  select(-Lat, -Long) %>%
  rename(Country = `Country/Region`,
         State = `Province/State`) %>%
  pivot_longer(cols = -Country:-State, names_to = "Date", values_to = "Deaths") %>%
#  filter(is.na(State)) %>%
  group_by(Country, Date) %>%
  summarise(Deaths = sum(Deaths)) %>%
  ungroup() %>%
  mutate(Date = as.Date(Date, "%m/%d/%y")) 

confirmed <- read_csv(url("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")) %>%
  select(-Lat, -Long) %>%
  rename(Country = `Country/Region`,
         State = `Province/State`) %>%
  pivot_longer(cols = -Country:-State, names_to = "Date", values_to = "Infections") %>%
  group_by(Country, Date) %>%
  summarise(Infections = sum(Infections)) %>%
  ungroup() %>%
  mutate(Date = as.Date(Date, "%m/%d/%y")) 

covid <- left_join(deaths, confirmed, by = c("Country", "Date")) 

covid[covid$Country == "US",]$Country <- "United States"


url <- "https://worldpopulationreview.com/"
r <- GET(url)
doc <- readHTMLTable(doc=content(r, "text"), header = T)
d <- doc[1]$`NULL` %>% as_tibble()
d <- d[,c(2,3,4,6,8)]
names(d) <- c("Country", "Pop2020", "Pop2019", "Density2019km2", "WPop")
pop <- d %>% mutate_at(vars(-Country), parse_number) %>%
  mutate(Country = trimws(Country))


url <- "https://en.wikipedia.org/wiki/List_of_countries_by_age_structure"
r <- GET(url)
doc <- readHTMLTable(doc=content(r, "text"), header = T, skip.rows = 1)
pop65 <- doc[1]$`NULL` %>% as_tibble() %>%
  mutate(V1 = substr(V1, start = 2, stop = nchar(V1))) %>%
  mutate(V1 = ifelse(str_detect(V1, "Nepal"), "Nepal", 
                     ifelse(str_detect(V1, "Switzerland"), "Switzerland", V1))) %>%
  mutate_at(vars(-V1), parse_number) %>%
  rename(Country = V1,
         Pop65 = V4) %>%
  select(-starts_with("V"))


covid <- covid %>% left_join(pop) %>%
  left_join(pop65) %>% select(-Pop2020)

covid$Region <- countrycode::countrycode(covid$Country, origin = "country.name", destination = "region")

covid <- covid %>% filter(!is.na(Region))

print("Name of data object: covid")
print(paste0("Source: ", Source))
print(paste0("Latest update: ", covid$Date[nrow(covid)]))

options(warn=0)
