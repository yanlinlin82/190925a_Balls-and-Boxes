library(tidyverse)

set.seed(190925)
g <- tibble(times = 1:1000) %>%
  mutate(counts = sapply(times, function(x) {
    sample(100, replace = TRUE) %>% unique %>% length
  })) %>%
  ggplot(aes(times, counts)) +
  geom_violin(fill = "pink") +
  geom_point(size = .5) +
  scale_y_continuous(breaks = 50:80)
g %>% ggsave(filename = "plot.png")
