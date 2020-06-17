# Load tidyverse
library(tidyverse)

# Load weight data frame and store it in the variable weight
weight <- read_csv("data/weight.csv")

# Check out the variables in the data frame
glimpse(weight)

# Lets go through the essential 3 grammatical elements and apply them to the code below:
# 1. Data: map the data frame weight to "data = " 
# 2. Aesthetics: map "weight" (not the name of the data frame but the weight variable in the data frame)
# on x-axis and "weight_selfreport" on the y-axis
# Run and check what happens; you should see a blank plot
ggplot(data = ___, aes(y = ___, x = ___)) 

# 3. Geometries: let's now visualise the data as points; add + geom_point()

# Lets add another aethetic. Add gender to colour (everything else as before)
ggplot(data = ___, aes(y = ___, x = ___, colour = ___)) +
  geom_point()
  
# Map age on size (everything else as before)
ggplot(data = ___, aes(y = ___, x = ___, size = ___)) +
  geom_point()

# Map age on size and alpha (everything else as before)
ggplot(data = ___, aes(y = ___, x = ___, size = ___, alpha = ___)) +
  geom_point()

# Map race on shape (everything else as before)
ggplot(data = ___, aes(y = ___, x = ___, shape = ___)) +
  geom_point()

# ATTENTION: you probably got an error message. 
# "Error: A continuous variable can not be mapped to shape"
# This is because shape expects discrete levels but race is numeric. There is an easy fix:
# Fill in the blanks and try again.
ggplot(data = ____, aes(y = ____, x = ____, shape = factor(____))) +
  geom_point()

# Geometries control the visual encoding of the data. 
# For example, lets look at the frequency distribution of ages in the sample:
# First we create a plotting canvas and save it to an object called "age_plot".
# Map age on x 
age_plot <- ggplot(data = weight, aes(x = ____))  

# Look at it:
age_plot

# We can now manipulate this object by adding a geometry layers:
age_plot + geom_histogram()

# You'll see a message like this:
# "`stat_bin()` using `bins = 30`. Pick better value with `binwidth`."
# That means that there are 30 bins in the plot so the age variable was divided into 30 bins 
# such that each bin spans over the following number of years
(age_range <- range(weight$age)) # age range
(age_range_diff <- diff(age_range)) # age span
age_range_diff/30 # years per bin

# Instead of the number of bins we can use the width of the bins:
# Inside of the brackets of geom_histogram add binwidth = 1.
age_plot + geom_histogram(binwidth = ___)

# Change to 5 and then 10 and observe what happens.
age_hist + geom_histogram(binwidth = ___)
age_hist + geom_histogram(binwidth = ___)

# The binwidth argument controls the age span within each bar / bin; binwidth = 1 is one year.
# Instead one can use a density plot: add geom_density() 
age_plot + 

