# Load tidyverse
library(tidyverse)

# Load weight data frame and store it in the variable weight
weight <- read_csv("data/weight.csv")

# Remind yourself about the variables contained in this data frame.
glimpse(____)

# For this exercise we use the differences between reported and actual height and weight.
# For following lines compute two new variables and save the data to a data frame called weight2.
weight2 <- mutate(weight, height_diff = height_selfreport - height,
                          weight_diff = weight_selfreport - weight)

# Check the new data frame weight2 (the new variables are on the bottom of this output):
glimpse(____)

# Scatter plot of the differences
# Fill in the data frame (weight2); map height_diff on the x axis and weight_diff on the y-axis
diff_plot <- ggplot(data = ___, aes(x = ___, y = ___)) 

# Plot was assigned to diff_plot. Have a look at the resulting plot by running
diff_plot

# Add data points to the plot using + geom_point()
diff_plot + geom_point()

# Zoom in (ignore extreme values). The height_diff axis has been reduced to values between -25 and 25. 
# Do the same for the weight_diff (y-axis).
diff_plot <- diff_plot +
  lims(x = c(-25, 25),
       y = c(___,___))

# We can now change the dots to distinguish between males and females.
# For example, we can change the shape of the dots.
diff_plot + geom_point(aes(shape = gender))

# This is not really helpful though. Instead of shape, try colour.
diff_plot + geom_point(aes(___ = ___))

# There are a lot of overlapping data points. There are a couple of things we can do to make more data visible.

# Change shape to a non-filled shape. Use for example 2 as shape. Note that shape as attribute needs to be defined outside
# the aes() mappings.
diff_plot + geom_point(aes(colour = gender), shape = ___)

# Similarily we can make the dots smaller. Change size to .5.
diff_plot + geom_point(aes(colour = gender), size = ___)

# Or we can reduce the increase the transparency by reducing alpha. Try .25
diff_plot + geom_point(aes(colour = gender), alpha = ___)

# And of course we can combine these attributes:
diff_plot + geom_point(aes(colour = gender), alpha = ___, shape = ___)

# These techniques allow us to prevent overplotting. 
# Another way to reduce overplotting is to adjust the position of the data points slightly (see Exercise 3b).

