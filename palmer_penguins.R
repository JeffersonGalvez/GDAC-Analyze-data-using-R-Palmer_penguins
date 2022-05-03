library(palmerpenguins)
View(penguins)
library(tidyverse)

penguins %>% arrange(bill_length_mm) #  default in ASC order
penguins %>% arrange(-bill_length_mm) #  DESC order due to minus sign before column name

penguins_desc_bill = penguins %>% arrange(-bill_length_mm)
View(penguins_desc_bill)

penguins %>%
  group_by(island) %>%
  drop_na() %>%
  summarise(mean_bill_length = mean(bill_length_mm))
#  above code groups penguins by island name and calculate mean bill length each on island
#  drop_na() removes rows containing N/A values in any field

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarise(max_bill_length = max(bill_length_mm))
#  summary of max penguin bill length, groupped by their island

#  finding max, min, and mean bill length, grouped by island and species
penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>% 
  summarise(max_bil = max(bill_length_mm), min_bl = min(bill_length_mm), mean_bl = mean(bill_length_mm))

#  filtering by species
penguins %>% filter(species=='Adelie')
penguins %>% 
  filter(species=='Adelie') %>% 
  group_by(island)
  drop_na() %>% 
    summarise()