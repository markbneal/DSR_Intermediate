
# V 2 ---------------------------------------------------------------------

ggplot(data = diamonds, mapping = aes(x = price, y = carat)) + 
  geom_boxplot(mapping = aes(group = cut_width(price, 1000)))


# V 3 ---------------------------------------------------------------------

diamonds %>% 
  filter(!between(carat, .5, 3)) %>% 
  mutate(size = ifelse(carat < .5, "small", "large")) %>% 
ggplot(aes(x = size, y = price)) + 
  geom_quasirandom()

# V 4 ----------------------------------------------------------------------

diamonds %>%
  ggplot() +
  geom_point(aes(carat, price)) +
  facet_grid(. ~cut)

ggplot(diamonds, aes(x = carat, y = price))+
  geom_smooth(aes(colour = cut))

ggplot(diamonds, aes(x = carat, y = price))+
  geom_smooth() +
  facet_wrap(~cut)

ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_violin(mapping = aes(group = cut_width(carat, 1))) +
  facet_wrap(~cut)


