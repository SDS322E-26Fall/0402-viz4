library(tidyverse)
library(patchwork)
library(ggthemes)
library(gapminder)

#################################################################
# the package socviz is associated with the textbook
# Data Visualization A practical introduction by Kieran Healy
socviz::gss_sm

# basic bar chart
ggplot(data = gss_sm, mapping = aes(x = bigregion)) +
  geom_bar()

# Your time (1/2)
# There is also a geometry called geom_col() that does something similar.
# Read the example in the documentation with ?geom_col() and create the plot above using geom_col().

#################################################################
gss_sm |>
  ggplot(aes(x = bigregion, fill = religion)) +
  geom_bar()

# different position layouts
gss_sm |>
  ggplot(aes(x = bigregion, fill = religion)) +
  geom_bar(position = "fill")

gss_sm |>
  ggplot(aes(x = bigregion, fill = religion)) +
  geom_bar(position = "dodge")


#################################################################
# data.frame vs. tibble
mtcars
as_tibble(mtcars)

rownames_to_column(mtcars, var = "model")
rownames_to_column(mtcars, var = "model") |> as_tibble()

#################################################################
# what's wrong with this plot?
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = cyl))

#################################################################
# factor basics
my_fct <- c("apple", "banana", "orange", "apple")
# create a factor from a vector
as.factor(my_fct)


my_fct2 <- c(4, 6, 8, 4)
as.factor(my_fct2)

#################################################################
# convert a variable to factor
mtcars2 <- mtcars |>
  mutate(cyl = as.factor(cyl))

# change the legend title
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = as.factor(cyl)), size = 5) +
  labs(color = "cylinder")

# equivalence
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = as.factor(cyl)), size = 5) +
  scale_color_brewer(palette = "Dark2", name = "cylinder")

#################################################################
# reorder factor levels
mtcars_tbl <- rownames_to_column(
  mtcars, var = "model") |>
  as_tibble()

mtcars_tbl2 <- mtcars_tbl |>
  mutate(cyl = as.factor(cyl)) |>
  mutate(model = fct_reorder(model, disp))

mtcars_tbl2 |>
  ggplot(aes(x = disp, y = model, fill = cyl)) +
  geom_col() +
  scale_fill_brewer(palette = "Dark2")

#################################################################
# Your time (2/2)
# Start from this code, how would you change it into the plot on the right? 

mtcars |>
  rownames_to_column(var = "model") |> 
  ggplot(aes(x = disp, y = model, fill = cyl)) + 
  geom_col()






#################################################################
# Your time (bonus)
# Take the `gapminder` data and focus on all the European countries. 
# Plot the `lifeExp` for each country and order the country by their max `lifExp`.





