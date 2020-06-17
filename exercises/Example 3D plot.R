#remotes::install_github("tylermorganwall/rayshader")
library(rayshader)
library(tidyverse)

plot <- ggplot(weight2, aes(x = height_diff, y = weight_diff)) +
  stat_density_2d(aes(fill = stat(nlevel)), 
                  geom = "polygon",
                  n = 300,bins = 20,contour = TRUE) +
  facet_wrap(gender~.) +
  scale_fill_viridis_c(option = "A") +
  theme_light(base_size = 14) +
  labs(x = "Difference to actual height", 
       y = "Difference to actual weight")
plot

plot_gg(plot, multicore=TRUE, width=6, height=6, scale=250)
