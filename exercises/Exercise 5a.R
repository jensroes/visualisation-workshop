# Load tidyverse package 
library(tidyverse)
library(ggthemes)
# If not installed, install ggthemes
#install.packages("ggthemes")

# Get up-to-date COVID-19 data
source("scripts/get_covid_data.R")

# You might need to install the following packages if the previous command gives an error.
# install.packages(c("httr", "XML", "countrycode"))
# Then run line 5 again before moving on. 
# If this line works, everything is fine.
glimpse(covid)

# The data frame contains up-to-date covid data.
# For a range of countries the cumulative number of deaths and infections by date.
# Pop2019: population in 2019
# Desnity2019km2: population density in 2019 (in km²)
# WPop: % of the world population
# Pop65: % of population that is older than 65
# Region: Regions as defined in the World Bank Development Indicators

# The countries included:
unique(covid$Country)

# Select three countries from the list above and insert them here:
covid3 <- covid %>% filter(Country %in% c("___", "____", "___"))

# Check out the new data frame covid3
glimpse(___)

# Lets show the cumulative number of deaths for these countries over time.
# Set data to covid3
# x needs to be Date
# y should be Deaths
ggplot(data = ____, aes(x = ____, y = ____)) +
  geom_line() +
  facet_wrap(~Country, nrow = 3)

# facet_wrap spits up the data for each of the three countries. 
# Depending on you combination of countries it might be hard to see the curve for some countries.
# In the below code, set scales to "free_y". This is not always ideal but helps to see the trends of individual countries in this example.
# Repeat the steps from above in the code below.
# This plot will add ribbons to each line as well.
plot_covid3 <- ggplot(data = ____, aes(x = ____, y = ____, ymin = 0, ymax = Deaths)) +
  geom_line() +
  geom_ribbon(alpha = .25) +
  facet_wrap(~Country, scales = "_____", nrow = 3)

# Check out your plot
plot_covid3

# Lets makes this one pretty (this may reflect my personal taste to some extent).
# Follow the instructions next to each line:
plot_covid3 +
  labs(y = "____", caption = ____) + # set y to "Cumulative number of COVID-19 deaths"; set caption to Source (no quotes for this one).
  theme_grey(base_size = ____) + # Use theme_light() and increase the base font size to 14.
  theme(strip.text = element_text(hjust = 0, face = "____"), # Set face to bold
        axis.title = element_text(hjust = ____), # Set hjust to 0
        panel.grid = _____, # remove panel packground with element_blank()
        axis.ticks.x = _____) # Remove ticks on the x axis


# To save the plot you can use the following line. Before name the plot "myplot.pdf"
# Set width and height to 6.
# This code will save the plot that is currently open in the viewer.
ggsave("____.pdf", width = ___, height = ___)

# The pdf with the plot is now in the visulisation workshop folder (top level).

# Continue with script "Exercise 5b.R".