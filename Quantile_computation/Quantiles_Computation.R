# R_quartile_computations

################################################################################
# This script shows how to use the R quantile function to computer the quartiles
# of a distribution.  We will use the data set USArrests which is p[rovided by
#  R.
#
# This data set contains statistics, in arrests per 100,000 residents for 
# assault, murder, and rape in each of the 50 US states in 1973. Also given is 
# the percent of the population living in urban areas.
################################################################################

data( USArrests )                      # Load data sets.
head( USArrests )                   # Display first 10 rows of  the data.

################################################################################
# We are asked to compute the quantile values for Q1, Q2, Q3, and Q4. In the
# below I will list the corresponding precentile and quantil for each quartile
# listed ab0ve.  I will   We will use US Arrests for murders for our data.
# 
# Quartile   Percentile   quantile

# Q1                25%       0.25
# Q2                50%       0.50
# Q3                75%       0.75
# Q4               100%       1.00


################################################################################
# We can also do the same operatrion by using a vector of the frqactions.
################################################################################

quantile(USArrests$Murder)

################################################################################
# Complementing the  quartile computations with graphs.  We will draw a
# density histogram and a boxplot.  I prefer to use the cowplot them for my
# plots.  You will need to install this package if you do not use it.
################################################################################

require(tidyverse)                      # I live in the tidyverse.
require(cowplot)                        # For professional plots.

ggplot( USArrests,
        aes( x = Murder, y = ..density.. )) +
    geom_histogram( bins = 5,
                    fill = "green",
                    color="black") +
    geom_density() +
    xlab( "Murders per 100,000 population") +
    ylab( "Density" ) +
    ggtitle( "US Murders per 100,000 in 1973") +
    theme_cowplot()


x_breaks <- 
    seq( from = 0, by = 1, to = 20 )

ggplot( USArrests,
        aes(x = Murder, y = NULL )) +
    geom_boxplot( fill = "green", size = 1) +
    xlab( "Mirders per 100,000")  +
    ylab( "" ) +
    scale_x_continuous( breaks = x_breaks,
                        labels = x_breaks ) +
    ggtitle( "US Murders per 100,000 in 1973") +
    theme_cowplot() +
    theme( axis.line.y = element_blank(),
           axis.text.y = element_blank(),
           axis.ticks.y = element_blank())


