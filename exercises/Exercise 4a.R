# Load tidyverse package 
library(tidyverse)

## Univariate distributions
# Load the data
mammals <- read_csv("data/mammals.csv") %>%
  rename(species = X1)

# Explore the data frame mammals with glimpse()
glimpse(___)
# or just type the name of the data frame variable in the console.

# Visualising the distribution of brain weight
# Let create the plotting canvas first. Map mammals on data and brain on the x axis
p_brain <- ggplot(data = ____, aes(x = ___)) 

# Create a histogram by adding geom_histogram()
p_brain + ____

# Create another histogram but change the width of the bars to 100 
p_brain + geom_histogram(binwidth = ___) # bars collapse over units of 100 gram

# Create a density plot by adding geom_density()
p_brain + ____

# Use the code for the density plot from before and log scale the x axis: scale_x_log10()
p_brain + ____
  
# Alternatively we can represent the brain weight by species.
# In the code below, map brain on the y axis and species on the x axis.
# Render the data as columns using + geom_col()  
# To make it better readable flip the coordinates by adding + coord_flip()
ggplot(mammals, aes(y = ____, x = ____)) +
  geom_col() 

# Aside, its easier to comprehend the data if we order the species by brain weight.
# Do do this, you can replace the x aesthetic before with reorder(species, brain)
# which reorders the species on the x-axis by brain size.

ggplot(mammals, aes(y = brain, x = ____ )) +
  geom_col() +
  coord_flip() +
  theme(axis.text.y = element_text(size = 8), # make text on y-axis smaller
        axis.ticks.y = element_blank()) #  remove ticks from y-axis


# The last visualisation puts more emphasis on the individual species but looks rather complex (lots of ink for the bars).
# Let's look at another way of representing the distribution of brain weights.

# First lets create a new canvas with the data frame mammals and brain mapped on the x-axis and species on label.
p_brain <- ggplot(data = ___, aes(x = ___, y = 0, label = ___)) +
  ylim(c(-.75,.75))

# To allow us to compare the following visualisations we set y to 0 and the limits of the y-axis to -0.75 to 0.75.

# Have a look at the plot created so far:
p_brain

# Now represent the data as points, i.e. geom_point()
p_brain + ___

# Points are overlapping on the lower end.
# You can add some jitter to the points using position_jitter. Set width to .25 
p_brain + geom_point(position = position_jitter(width = ___))

# The same can be achieved with geom_jitter()
p_brain + ____

# We don't know which data point relates to which animal.
# We specied above label = species. Instead of rendering data as points we can render them as 
# text geom_text() or as label geom_label(). Add either function below.
p_brain + ____

# Similar to how you added add jitter to geom_point() add jitter now to the text / labels.
p_brain + ______

# There are many observations on the lower end and it is hard to see individual species.
# Keep the text / label and positional jitter and log scale the x axis using scale_x_log10()
p_brain + ____ + ____ 

# To add summary descriptives to the plot, we can add a boxplot using geom_boxplot()
p_brain + ____

# Reduce the width of the boxplot by adding width = 0.5 inside the brackets
p_brain + ____

# Repeat the boxplot from before and log scale the x axis as before.
p_brain + ____ + ____

# Repeat the boxplot with log scaled x axis and add data points using geom_jitter().
p_brain + ___ + 
  ___ + 
  ___

# Use the same code but replace geom_jitter() with jittered text: geom_text(position = position_jitter(width = .25))
p_brain + ____ +
  ____ +
  ____

# Continue with the script "Exercise 4b.R".
