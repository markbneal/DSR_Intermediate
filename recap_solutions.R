# Recap: Import and Visualisations ----------------------------------------

# 1. Import mpg.csv from the data_raw directory

library(tidyverse)
library(here)

my_mpg <- read_csv(here("data_raw", "mpg.csv"))

# 2. Create a box plot of the fuel efficiency in the city (cty) for each class of car (class)

my_mpg %>% ggplot() + geom_boxplot(aes(cty, class))

# 3. Do 1 and 2 in a pipe without saving any value to the environment and facet_wrap it cyl

here("data_raw", "mpg.csv") %>%
  read_csv %>%
  ggplot() +
  geom_boxplot(aes(cty, class)) + 
  facet_wrap(~cyl, nrow = 2)

# 4. Which cylinder count has the biggest variance for which class of car?

here("data_raw", "mpg.csv") %>%
  read_csv %>%
  ggplot() +
  geom_boxplot(aes(cty, as.character(class))) +
  facet_wrap(~cyl)

# 1. Import flights.csv from the data_raw directory
# 2. Create a smaller data set that only includes flights leaving on "May the Fourth"
# 3. Normalise  sched_dep_time colum so it represents minutes past midnight
# 4. Create a new column with the information of whether a flight was cancelled
# 5. How many minutes past midnight was the earliest flight scheduled, 
#    when was the earliest cancelled flight scheduled?

here("data_raw", "flights.csv") %>%
  read_csv %>%
  filter(day == 4, month == 5) %>%
  mutate(sched_dep_time = sched_dep_time %% 100 + ((sched_dep_time %% 2400) %/% 100) * 60,
         cancelled = is.na(dep_time)) %>%
  arrange(sched_dep_time)
  
here("data_raw", "flights.csv") %>%
  read_csv %>%
  filter(day == 4, month == 5) %>%
  mutate(sched_dep_time = sched_dep_time %% 100 + ((sched_dep_time %% 2400) %/% 100) * 60,
         cancelled = is.na(dep_time)) %>%
  filter(cancelled) %>%
  arrange(sched_dep_time) %>%
  slice(1) %>%
  pull(sched_dep_time)


