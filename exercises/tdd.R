# To run a command click in the corresponding line and press CTRL + ENTER (Mac: CMD + ENTER).

# Load tidyverse package (which includes ggplot2 and many other useful functions for data processing)
library(tidyverse)

# If you couldn't load tidyverse, run this:
# install.package("tidyverse")

# Load data frame 
tdd <- read_csv("data/tdd.csv")

# Inspect data frame
glimpse(tdd)

# Summary
summary(tdd)

# First 10 rows 
tdd

# Get the mean and the standard deviation for each of the 13 data sets
# Convince yourself that all dataset have the same mean and standard deviation for x and y.
tdd %>% group_by(dataset) %>%
  summarise_if(is.double, list(Mean = mean, SD = sd)) %>%
  select(dataset, starts_with("x"), starts_with("y"))

# You can also run 13 linear regressions which show relatively similar (if not identical) relationships between y and x.
map(1:13, ~lm(y ~ x, data = tdd, subset = dataset == .)) %>%
  map(summary) %>% map("coefficients") 
# For all data sets there is a negative relationship between x and y.

# Regression lines illustrate this relationship for each of the 13 data sets.
ggplot(data = tdd, aes(y = y, x = x)) +
  facet_wrap(~dataset, labeller = label_both) +
  geom_smooth(method = "lm", fullrange = T, se = F)

# The last line in the previous code creates the regression line.
# Task: Create a scatterplot with points instead of regression lines.
# 1. Copy the previous code (all three lines) and paste it below.
# 2. Remove the last line (i.e. geom_smooth(...))
# 3. Add the following line to the code to create a scatter plot: geom_point(size = 0.5) 
# 4. Convince yourself that the relationship between y and x are very different for each of the data sets.
