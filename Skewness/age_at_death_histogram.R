# Age at death histogram

require(tidyverse)                             # I live in the tidyverse ...
require(flextable)
require(cowplot)


fp <- file.path( getwd(),
                 "Skewness",
                 "data",
                 "age_at_death.csv" )

age_at_death <- read.csv( fp )

renamed <- 
    age_at_death %>% 
       rename( lower = lower_bound,
               upper = Upper_bound,
               males_nm = M_never_married,
               males_m  = M_males_married,
               males_w  = M_widowed,
               males_d  = M_divorced,
               males_t  = M_total,
               females_nm = F_never.married,
               females_m  = F_married,
               females_w  = F_Widowed,
               females_d  = F_divorced,
               females_t  = F_total )

age_at_death <-
    renamed %>% 
        mutate( all_genders_t = males_t + females_t )


n <- dim(age_at_death)[1]



i = 1

frequency  <- 
    age_at_death %>% 
        pull(all_genders_t)
lower <- 
    age_at_death %>% 
        pull(lower)

upper <- 
    age_at_death %>% 
        pull(upper )

age <- runif( n = frequency[1], min=0,max= 1)



for( i in 2:n ){
    
    f <- frequency[i]
    l <- lower[i]
    u <- upper[i]
    
    age <- c( age, runif( f, l, u ))
}

xbar <- mean( age )
med  <- median( age )
mod <- 87



limits <- pretty( age,
                  n = 100,
                  min.n = 20,
                  high.u.bias = 10 )

my_breaks <- seq( from=0, to = 110, by = 10 )

tibble( age ) %>% 
    ggplot( aes( x = age, y = ..density.. )) +
        geom_histogram( binwidth = 5,
                        color = "black",
                        fill = "white" ) +
    geom_vline( xintercept = xbar,
                size = 1,
                color = "darkblue") +
    geom_vline(xintercept = med,
                size = 1,
                color = "red ") +
       annotate("text", 
                x = 10, y = 0.03, 
                label = "Mean is 76.06",
                hjust = 0,
                color = "darkblue" ) +
       annotate( "text",
                  x = 10,
                  y = 0.028,
                 label = "Median is 81.24",
                 hjust = 0,
                 color = "red") +
        annotate( "rect",
                   xmin = 82.5, ymin = 0,
                   xmax = 87.5, ymax = 0.036,
                   label = "Median is 81.24",
                   hjust = 0,
                   color = "purple",
                   fill  =  "purple",
                   alpha = 1 ) +
         annotate( "text",
                    x=10, y = 0.026,
                    label = "Modal class is from 82.5 to 87.5.",
                   hjust = 0,
                   color = "purple" ) + 
         annotate( "text", x = 10, y =0.024,
                    label = "Mean < Median < Mode imples negative skewnwss.",
                    hjust = 0,
                    color = "black") +
         scale_x_continuous( name = "Age at death",
                           breaks = my_breaks,
                           labels = my_breaks) +
        ylab( "Empircal density" ) +
        ggtitle("Australian ages at death for all deaths in 2012" ) +
        theme_cowplot()



        
    


