# Load tidyverse package 
library(tidyverse)

# Compare data of two and more groups
# Load the data
rats <- read_csv("data/rats.csv") 

# Get an overview of the rats data
glimpse(___)

# 60 rats
# Source: source of protein given, a factor with levels Beef and Cereal.
# Protein: amount of protein given, a factor with levels High and Low.
# Gain: weight gain in grams.
# Source: D. J. Hand, F. Daly, A. D. Lunn, K. J. McConway and E. Ostrowski (1994). A Handbook of Small Datasets, Chapman and Hall/CRC, London. 

# Let's start by creating a canvas for the data. Data are rats, with Gain on the y-axis and Protein on the x-axis
p_rats <- ggplot(data = ___, aes(y = ___, x = ___))

# Check out the plot so far: 
p_rats

# Dynamite plots are frequently used to compare groups although there are very good reasons to NOT use these to 
# show differences between groups.
# For practice here is how to create a dynamite plot.

# stat_summary allows us to calculate summary statistics such as the mean and error bars
# Check the following code. Medians are plotted as point.
# Try instead to represent the mean as "bar":
p_rats + stat_summary(fun = median, geom = "point", fill = "grey") 
# HINT: change median to mean and point to bar.

# Repeat the above for the first stat_summary function below.
# The second stat_summary() should add the geom "errorbar"s. 
# Set width to 0.5.
p_rats + stat_summary(fun = ____, geom = "____", fill = "grey") +
  stat_summary(fun.data = mean_sdl, 
               geom = "____", width = ____)

# Pitfalls for dynamite plots
# 1. we don't know how the data are distributed (plot suggest normal distribution),
# 2. and how many observation do we have in each group.
# 3. bars suggest data where there are none (e.g. zero gains).
# 4. there are values above the bar that are not shown in ink.
# Ergo, don't bother with dynamite plots :)

# Here are some alternatives equivalent to what you have done in the previous script:
p_rats + geom_point()
p_rats + geom_jitter(width = .1)
p_rats + geom_boxplot(width = .25)

# For boxplots you can change the colour attribute of outliers. Try red.
p_rats + geom_boxplot(width = .25, outlier.colour = "___")

# You can add notches which represent 95% confidence intervals.
# Set notch from FALSE to TRUE (FALSE is default)
p_rats + geom_boxplot(width = .25, notch = FALSE) 

# The middle line shows the median. You can add the mean though.
# Set fun to mean, geom to point and display the means in red.
p_rats + geom_boxplot(width = .25) +
  stat_summary(fun = ___, geom = "____", colour = "___") 

# As alternative you can use violin plots but they are not always helpful.
p_rats + geom_violin(draw_quantiles = c(.025,.5,.975), trim = F) # matter of taste ;)

# Add jittered data points to the boxplot below (reduce width).
# Note: outlier.shape = NA removes "outliers" because we want to add the raw data as jittered data points anyway.
p_rats + 
  geom_boxplot(width = .25, outlier.shape = NA, notch = TRUE) + 
  ____

# Consider this plot:
p_rats + 
  geom_jitter(width = .1) +
  stat_summary(fun = mean, geom = "point", size = 5, colour = "darkred") +
  stat_summary(fun.data = mean_sdl, 
               geom = "errorbar", 
               colour = "darkred",
               width = .25)

# Task:
# The errorbars indicate 2 times SD
# Instead you might want to use confidence intervals. 
# For CIs use the function mean_cl_normal instead of mean_sdl
# Change mean to median.
# Beautiful :)
