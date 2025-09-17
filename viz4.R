library(tidyverse)
library(patchwork)
library(ggthemes)
library(gapminder)

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

ggplot(mtcars2,
       aes(x = mpg, y = disp, color = cyl)) +
  geom_point(size = 5)

# equivalence
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = as.factor(cyl)), size = 5)

# change the legend title
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = as.factor(cyl)), size = 5) +
  labs(color = "cylinder")

# equivalence
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = as.factor(cyl)), size = 5) +
  scale_color_brewer(palette = "Dark2",
                     name = "cylinder")

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
# Your time
# reproduce the plot - see the slides for hints




#################################################################
# change color palettes
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = as.factor(cyl)), size = 5) +
  scale_color_brewer(palette = "Dark2",
                     name = "cylinder")

# try other palettes
ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point(aes(color = as.factor(cyl)), size = 5) +
  ggthemes::scale_color_colorblind(
    name = "cylinder"
  )


#################################################################
# patchwork for combining multiple plots
p1 <- ggplot(mtcars) +
  geom_point(aes(mpg, disp)) +
  ggtitle('Plot 1')

p2 <- ggplot(mtcars) +
  geom_boxplot(aes(gear, disp, group = gear)) +
  ggtitle('Plot 2')

p1 / p2


p1 + p2 +
  plot_layout(guides = "collect")

p1 + p2 +
  plot_layout(guides = "collect") &
  theme(legend.position = "bottom")

#################################################################
# Your time
# reproduce the plot - see the slides for hints





