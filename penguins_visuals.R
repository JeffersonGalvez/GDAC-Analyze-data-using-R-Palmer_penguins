##  Building visuals from the penguin dataset

#  install and load the necessary packegs
install.packages("ggplot2")
library(ggplot2)
install.packages("palmerpenguins")
library(palmerpenguins)
data("penguins")
View(penguins)
library(tidyverse)
library(tibble)

#  draft your visual
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))

#  adding colour to each species
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species))

#  adding point shape to each species
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species,shape=species))

#  adding alpha to each species to vary transparency - useful for dense plots
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,shape=species,alpha=species))

#  making all datapoints one colour - NB: done OUTSIDE aes()
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g),colour='blue')

#  adding geom_smooth for a trendline
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species,shape=species)) +
  geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))
  
#  line graph for each species
ggplot(data=penguins)+geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species))

#  facting/sub-plotting per species
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species,shape=species)) +
  facet_wrap(~species)

#  facting by 2 variables: sex and species using fact_grid()
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,colour=species,shape=species)) +
  facet_grid(sex~species)

 #  ggplot() function creates a coordinate system that you can add layers to
#  "+” symbol to add a new layer to your plot
#  The geom_point() function uses points to create scatterplot
#  the geom_bar function uses bars to create bar charts, and so on
#  The mapping argument is always paired with the aes() function
#  The x and y arguments of the aes() function specify which variables to map 
#  to the x-axis and the y-axis of the coordinate system

species_mean_mass = penguins %>% 
  select(species, body_mass_g) %>% 
  group_by(species) %>% 
  drop_na() %>% 
  summarise(mean_body_mass_g=mean(body_mass_g))
  
View(species_mean_mass)

ggplot(data = species_mean_mass)+geom_col(mapping = aes(x=species,y=mean_body_mass_g))
help("geom_bar")

#  adding colour to the bar/coloumn chart
ggplot(data = species_mean_mass)+geom_col(mapping = aes(x=species,y=mean_body_mass_g,colour=species,fill=species))

#  counting how many of each species on each island onto a bar chart
ggplot(data = penguins) + geom_bar(mapping = aes(x=species, fill=island))
#  geom_bar has no y-axis input, it counts only rows
