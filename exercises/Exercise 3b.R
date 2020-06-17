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


# Working with position jitter.
# Create this plot:
height_plot <- ggplot(weight, aes(y = 0, x = height_selfreport))

# Consider this example. There are a lot of data hidden.
height_plot + geom_point()

# This can be solved by adding additional jitter to the data
height_plot + geom_point(position = "jitter")

# Or by using the wrapper function
height_plot + geom_jitter() 

# Set alpha to .25 and size to .5 to improve the visability of the data.
height_plot + geom_jitter(alpha = ___, size = ____) 

# For using positioning in histograms continue with script "Exercise 3c.R".