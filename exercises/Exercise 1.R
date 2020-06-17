# To run a command click in the corresponding line and press CTRL + ENTER (Mac: CMD + ENTER).

# Load tidyverse package (which includes ggplot2 and many other useful functions for data processing)
# If you haven't installed tidyverse, uncomment and run this line:
# install.package("tidyverse")
library(tidyverse)

# Load the data
mammels <- read_csv("data/mammals.csv") %>%
  rename(species = X1)

# Explore the data frame mammels with glimpse()
glimpse(___) # replace "____"

# First 10 rows of data frame:
mammels

# Map body on the x-axis and brain on the y-axis
ggplot(mammels, aes(x = ____, y = ____)) +
  geom_point()

# There are some animals with more extreme values. Let's see which ones.
# 1. Map body on the x-axis and brain on the y-axis (as before)
# 2. Map species on label.
# 3. Replace geom_point() with geom_text() or geom_label().
ggplot(mammels, aes(x = ____, y = ____, label = ____)) +
  geom_point()

# It's still hard to see the animals on the lower end. Use the logarithm for both axis to increase the 
# distance between values on the lower end of the scale.
# 1. x and y as before.
# 2. I already added scale_y_log10() to log transform the y-axis. Do the same for the x-axis.
ggplot(mammels, aes(x = ____, y = ____)) +
  geom_point() +
  scale_y_log10() +
  ____

# Repeat the previous code with text or labels instead of points.

# Copy the previous code and add a linear model to it, i.e.:
# + geom_smooth(method = "lm")

# We can change the attributes of the points. For example we can have large red £ signs (if you think that's a good idea). 
ggplot(mammels, aes(y = brain, x = body)) +
  geom_point(colour = "red", shape = "£", size = 16 )

# Recreate the same plot as before but instead of red £s use green filled triangles in size 8.
# To figure out how to get the shape filled triangle, check here:
# http://www.sthda.com/english/wiki/ggplot2-point-shapes

ggplot(____, aes(y = ____, x = ____)) +
  geom_point(colour = "___", shape = "___", size = ___)