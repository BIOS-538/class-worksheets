library(tidyverse)
library(patchwork)

# set the theme for all plots
theme_set(theme_classic())

# make some mock data 
a <- tibble(a1 = 1:12, a2 = a1^2, a3 = 5 * a1,
            ax = rep(c('ants', 'cats', 'dogs'), each = 4))


# plot a2
plt_a2 <- 
ggplot(a, aes(a1, y = a2)) + 
  geom_point() #+ 
  #facet_wrap(vars(ax))
  
# plot a3
plt_a3 <- 
ggplot(a, aes(a1, y = a3)) + geom_point()
            
plt_a2 + plt_a3

# goal : make a2 and a3 as two separate facets in the same plot
# then we will use plotly

a_wide <- pivot_longer(a,
                       cols = c(a2, a3),
                       names_to = 'func', values_to = 'value')


# plot as facets 
facet_plot <- 
    {
      ggplot(a_wide, aes(x = a1, y = value, 
                         colour = func)) + 
      geom_point() # +
      # geom_line() +
      # facet_wrap(vars(func))
    } %>% print

      
plotly::ggplotly(facet_plot) 

#%>%
  # plotly::animation_slider(currentvalue = list(prefix='current_value: ', 
                                               # font = list(color='red')))

             