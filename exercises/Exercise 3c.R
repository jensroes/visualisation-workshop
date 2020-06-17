# Load tidyverse
library(tidyverse)

# Load weight data frame and store it in the variable weight
weight <- read_csv("data/weight.csv")

# Remind yourself about the variables contained in this data frame.
glimpse(____)

# As before, we need the selfreport differences.
weight2 <- mutate(weight, height_diff = height_selfreport - height,
                  weight_diff = weight_selfreport - weight)

# Lets focus again on the distribution of the height and weight differences.
# This transformation moves height and weight differences into one column
weight3 <- pivot_longer(weight2, cols = ends_with("_diff"),
                        names_to = "category", names_pattern = "(.*)_",
                        values_to = "difference") 

# Check the last two variables (category and difference):
glimpse(weight3)

# To create a histogram, we just need to map the variable difference on the x axis.
# Add the variable difference to x.
# To distinguish weight and height, we need to separate fill and colour for category.
hist_diff <- ggplot(weight3, aes(x = ____, fill = ____, colour = ____)) +
  lims(x = c(-15,15))

# So far, we created the canvas for plotting
hist_diff

# Data can be rendered as a histogram. Set alpha to .25: 
hist_diff + geom_histogram(alpha = ___)

# By default the two groups are shown as stacked bars which can be made explicit as:
hist_diff + geom_histogram(position = "stack", alpha = ___)

# Better ways of representing the data is by replacing stack with "dodge"
hist_diff + geom_histogram(position = "___", alpha = ___)

# Or "identity"
hist_diff + geom_histogram(position = "____", alpha = ___)

# Or "fill".
hist_diff + geom_histogram(position = "____", alpha = ___)

# Note how the position of the bars changed.

# Above we set both the fill and colour aesthetic to category.
# Let's see what happens if we don't do this.
# 1. use fill as aesthetic and map category on it but set colour to "white" (note that colour is declared in the histogram geom).
ggplot(weight3, aes(x = difference, ____ = ____)) +
  geom_histogram(position = "identity", alpha = .25, colour = "___") +
  lims(x = c(-15,15)) 

# 2. use colour as aesthetic and map category on it but set fill to "white" (note that fill is declared in the histogram geom).
ggplot(weight3, aes(x = difference, ____ = ____)) +
  geom_histogram(position = "identity", alpha = .25, fill = "___") +
  lims(x = c(-15,15)) 

# Another commonly used aesthetic / attribute is linetype.
# We can use linetype as aesthetic to indicate different groups. Use category for linetype:
ggplot(weight3, aes(x = age, y = difference, linetype = ____, colour = gender)) +
  stat_smooth(method = "lm")

# Or we can use linetype as attribute, for example to indicate the 0 mark (no difference) in geom_hline (horizontal line):
# Set linetype in the aesthetics part to category as before.
# Then set linetype in geom_hline to "dotted".
ggplot(weight3, aes(x = age, y = difference, linetype = ____, colour = gender)) +
  stat_smooth(method = "lm") +
  geom_hline(yintercept = 0, linetype = "____") 
