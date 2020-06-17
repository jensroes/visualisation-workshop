# Load tidyverse
library(tidyverse)

# Load weight data frame and store it in the variable weight
weight <- read_csv("data/weight.csv")

# Check out the variables in the data frame
glimpse(____)

# There are 4 more (optional) grammatical elements.

# Create a scatter plot with height (x-axis) and height_selfreport (y-axis)
height_plot <- ggplot(data = ____, aes(y = ____, x = ____ )) + 
  geom_jitter() # similar to geom_point() but adds some jitter to avoid overplotting
  
# Check out the height plot
height_plot

# 1. Facets: in facet_grid, replace "___" with gender to create one panel per gender:
height_plot + facet_grid(. ~ ___)

# 2. Statistics: run the code below, then add + stat_smooth(method = "lm") and run again
ggplot(data = weight, aes(y = weight_selfreport, x = weight, colour = gender)) +
  geom_jitter(size = .1) 

# Run this code:
age_plot <- ggplot(data = weight, aes(x = age, fill = gender, colour = gender)) + 
  geom_density(alpha = .5) # "alpha controlls the transparency of the colour

# Check the plot
age_plot

# 3. Coordinates: add + coord_flip()
age_plot + _____

# 4. Themes: non-data related information (ink)
# can be changed using preexisting "themes" as in the example below
height_plot + facet_wrap(~race) +
  theme_bw()

# Copy the previous code and change theme_bw() to theme_linedraw().

# Try theme_minimal() instead.

# We can make manual adjustments too. Remember this plot:
age_plot

# Let's change the position of the legend by adding a layer called "theme" and the argument legend.position.
# "right" is the default position. Replace "___" with "top" or "bottom"
age_plot + theme(legend.position = "___")

# Use number below 1 to make manual adjustments to the position
age_plot + theme(legend.position = c(___, ___))
