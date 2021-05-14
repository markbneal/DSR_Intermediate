
# Libaries needed ---------------------------------------------------------

library(tidyverse)

# Recap: Import and Visualisations ----------------------------------------

# 1. Import mpg.csv from the data_raw directory

my_mpg <- read_csv("data_raw/mpg.csv")

# 2. Create a box plot of the fuel efficiency in the city (cty) for each class of car (class)

ggplot(data = mpg) + geom_boxplot(aes(class, cty)) + coord_flip()

# 3. Do 1 and 2 in a pipe without saving any value to the environment and facet_wrap it cyl

read_csv("data_raw/mpg.csv") %>% ggplot() + geom_boxplot(aes(cty, class)) + facet_wrap(~ cyl)

# 4. Which cylinder count has the biggest variance for which class of car?

# Recap: Data Transformation ----------------------------------------------

# For the following exercise you can either create a pipe or do it step by step

# 1. Import flights.csv from the data_raw directory

myFlights <- read_csv("data_raw/flights.csv")

# 2. Create a smaller data set that only includes flights leaving on "May the Fourth"

maythefourth_flights <- filter(myFlights, month==5, day==4)

read_csv("data_raw/flights.csv") %>% 
  filter(month == 5, day == 4)

# 3. Normalise  sched_dep_time colum so it represents minutes past midnight

maythefourth_flights <- mutate(maythefourth_flights,minpastmn=(hour *60)+ minute)

mutate(flights2, hour2 = sched_dep_time %/% 100, 
       minute2 = sched_dep_time %% 100,
       sched_dep_time = (hour2 *60)+ minute2))

read_csv("data_raw/flights.csv") %>% 
  filter(month == 5, day == 4) %>%
  select(sched_dep_time) %>%
  mutate(sched_dep_time2 = (sched_dep_time %/% 100) * 60 + 
           sched_dep_time %% 100)


# 4. Create a new column with the information of whether a flight was cancelled
flights1 <- read_csv("data_raw/flights.csv")
flights1 %>% mutate(cancelled = is.na(dep_time)) %>% 
  select(cancelled, dep_time) %>% filter(cancelled)

read_csv("data_raw/flights.csv") %>% 
  filter(month == 5, day == 4) %>%
  mutate(sched_dep_time = hour * 60 + minute,
         cancelled = is.na(dep_time))

# 5. How many minutes past midnight was the earliest flight scheduled, 
#    when was the earliest cancelled flight scheduled?

read_csv("data_raw/flights.csv") %>% 
  filter(month == 5, day == 4) %>%
  mutate(sched_dep_time = hour * 60 + minute,
         cancelled = is.na(dep_time)) %>%
  group_by(cancelled) %>%
  summarise(firstFlightCancelled = min(sched_dep_time, na.rm = T))
