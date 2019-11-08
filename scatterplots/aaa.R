#aaa.R

require(tidyverse)

set.seed( 111 )

t1 <- round( rnorm( 31, 12, 15 ))
t2 <- round( rnorm( 28, 15, 18 ))
t <- c( t1, t2 )

pmh <- round( 50 - 0.22 * t + rnorm( length(t), 0, 3), 1)

tibble( t, pmh ) %>% 
    ggplot( aes( x=t, y=pmh)) +
        geom_point() +
        geom_smooth( method="lm",
                     se=FALSE,
                     color="red") +
    xlab( "Forcasted Temperature (Fahrenheit)") +
    ylab( "Precent avail;ble manpower required") +
    ggtitle( "AAA manpower requirements prediction") +
    theme_cowplot()

