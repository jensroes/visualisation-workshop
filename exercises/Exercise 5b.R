# Load tidyverse package 
library(tidyverse)
library(ggthemes)

# Get up-to-date COVID-19 data
source("scripts/get_covid_data.R")

# You might need to install the following packages if the previous command gives an error.
# install.packages(c("httr", "XML", "countrycode"))
# Then run line 5 again before moving on. 
# If this line works, everything is fine.
glimpse(covid)

# The following plots explore the relationship between number of deaths by country and other variables.

# To do this, we create a new data frame that contains only the total of deaths by country rather than the cumulative number of deaths by date.
covid2 <- covid %>%
  group_by(Country) %>%
  mutate(Deaths = max(Deaths)) %>%
  ungroup() %>%
  select(-Date, -Infections) %>%
  unique() 

# Check out the new data frame
glimpse(covid2)

# Lets look at the relationship between deaths and population density
# Look up the variable names in the glimpse output.
# data is covid2
# y is number of deaths
# x is population density
# label is country names
# use theme_bw() and set base_size to 14 (adjust text size in geom_text if necessary)
ggplot(data = ____, aes(y = ____, x = ____, label = ____)) +
  geom_text(size = 3) +
  theme_bw(base_size = 12) 

# log scale both x and y axis (see earlier exercises).
# The number of deaths is to some extent relative to the number of people living in a country.
# The data frame contains the population size from 2019. In the previous plot set x to Deaths / Pop2019
# to show the total number of deaths relative (devided over) to the population size. 

# Repeat the same plot with the percentage of people older than 65: 
# check glimpse(covid2) to remind you of the variable name.
# Set colour and fill to Region.
covid_plot <- ggplot(data = covid2, aes(y = Deaths / Pop2019, 
                                        x = ____,
                                        label = ____, 
                                        colour = ____, 
                                        fill = ____)) +
  geom_text(size = 3) +
  scale_y_log10() 

covid_plot

# Let's make this plot prettier:
covid_plot + 
  _____ + # add theme_bw() with base size 14
  scale_x_continuous(labels = ____, # to show values as percentage use scales::percent_format(scale = 1),
                     limits = c(____, ____)) + # set limits to 0 and 30
  labs(color = "Region", # remove the legend title by deleting Region (only use quotes)
       y = "___", # Set the y title to "Deaths relative to the\npopulation size in 2019 (log-scaled)"*
       x = "___") + # Set the x title to "Population aged 65 years or older"
  theme(legend.position = "___", # If the legend is on the "top" or "bottom" you save space to display data. 
        legend.justification = "____") + # Adjust the oriantation to "left" or "right"
  scale_color_colorblind() # This last line is from the ggthemes package and makes the colours easier distinguishable.

# *Note: you probably noticed the "\n" in the y-label. This is a linebreak meaning the title is split into two lines at that point (try and place "\n" somewhere else).

# And here is a violine plot: violin plots are better in capturing the variance compared across groups (Region)
# y should be Deaths / Pop2019
# x should be Region
# label is Country
covid_violin <- ggplot(data = covid2, aes(y = ____, 
                                          x = ____, 
                                          label = ____)) +
  geom_violin(trim = TRUE, # set to FALSE 
              draw_quantiles = c(___, ___ ,___), # use 0.025, 0.5, and 0.975 to show the 1st, 2nd and 3rd quartile 
              fill = "_____") + # set fill to transparent
  scale_y_log10()

# View the plot
covid_violin

# Again, lets make this one pretty.
covid_violin + # Render the data as text instead of points. 
  geom_point(alpha = ____, # use 0.5
             size = ____,  # use 3
             position = position_jitter(width = ____)) + # set jitter width to 0.15.
  _____ + # use the same theme as before
  labs(____, ____) + # Remove the x title and change the y title to "Deaths relative to\npopulation size in 2019"
  theme(axis.text.x = element_text(angle = ____, vjust = ____), # At the moment the text on the x-axis is overlapping.
        # Tilt the text by setting angle to 45 and adjust the vertical position by 0.5.     
        axis.ticks.x = _____ ) # element_blank() allows you to remove certain theme properties. Remove the ticks on the x axis.

# P.S.: feel free to play with these data. The script will update the data daily.