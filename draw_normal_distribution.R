### How to compute and draw a normal distribution in R

###############################################################################
# We will draw a density plot of a normal distribution with a mean of 80 and 
# a stadard deviation of 5 using ggplot.
###############################################################################


require(tidyverse)                          # I use the tidyverse because it
                                            # my life easier...
require(cowplot)                            # For better looking graphs ...

###############################################################################
# Set desired mean an standard deviation of the normal distribution.
###############################################################################

mu    <- 80                                 
sigma <- 5

###############################################################################
# We will draw the distribution from -4 standard deviations below the mean
# to 4 standard deviations above the mean in increments of 0.10 standard 
# deviations.
###############################################################################

z <- seq( from = -4, to = 4, by = 0.10  )

###############################################################################
# We ceonvert standard normal z scores with a mean of0 and a standard
# deviation of 1 to y scores with a mean of 80 and a standard deviation of 5.
###############################################################################

y <- mu + z * sigma

###############################################################################
# Compute the probability density function of the normal distribution with 
# a mean of 80 and a standard deviation of 5.
###############################################################################

density <- dnorm( y, mean = mu, sd = sigma )

###############################################################################
# Create a data.frame for ggplot2.
###############################################################################

df <- data.frame( y, density )

ggplot( df, aes( x = y, y=density )) +
    geom_line() +
    xlab( "y") +
    ylab( "Probability density" ) +       
    theme_cowplot()


