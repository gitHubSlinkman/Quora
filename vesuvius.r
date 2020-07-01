# vesuvius.r

library( tidyverse )
library( readr )
library( cowplot )
library( simpleboot )
library( flextable )

theme_set(theme_cowplot())                       # Turn on cowplot ...

vesuvius <- read_csv( "Vesuvius.csv" )           # Read suvius data ...

vesuvius %>%                                     # Displa data in a flextable ...
    flextable()

source('~/R-Projects/Rsource/plot_distribution.R')

plot_distribution( vesuvius$Interval,
                   "Interval between eruptions",
                   "Relative frequency distribution and density plot")

interval <- vesuvius$Interval[2:length( vesuvius$Interval)]

set.seed( 99979 )
interval
class( interval )
sum( interval )
ybar <- round( mean( interval ), 2)
ybar

ybar <- mean( interval )

set.seed( 99979 )                          # Set seed so answers don't
                                           # change 
boot_sample  <- 
    sample( interval,
            n, 
            replace = TRUE )
boot_sample

REPS <- 10000
bsmean <- rep( 0, REPS )

for( i in 1:REPS ){
    bsmean[i] <- mean( sample(interval,
                              n,
                              replace=TRUE)) 
}




