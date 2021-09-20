# scatterplot.R

################################################################################
# This package uses the Oldfaithful data four in the apckage alr4.   
#
# Description
#
# Data on eruptions of Old Faithful Geyser, October 1980. Variables are the 
# duration in seconds of the current eruption, and the time in minutes to the 
# next eruption. Collected by volunteers, and supplied by the Yellowstone' 
#National Park Geologist. Data was not collected between approximately
# midnight and 6 AM.
#
# Format
#
# This data frame contains the following columns:
#    
#    Duration Duration in seconds
#    Interval Time to next eruption in minutes
#
################################################################################

library( tidyverse )                     # I live in the tidyverse.
library( ggExtra )

library(alr4)                            # Provides data set oldfaith.     

data( oldfaith )

###############################################################################
# We first need to define the scatter plot and save the definition to p.
################################################################################

p <- 
    ggplot( oldfaith,
            aes( x = Duration, y = Interval )) +
    geom_point() +
        xlab( "Duration of eruption in seconds" ) +
        ylab( "Interval to the next eruption in minutes" ) +
    ggtitle( "Example of a scatterplot with marginal histograms") +
    theme_bw()

################################################################################
# We invoke the ggExtra function ggMarginal to add the histograms to the the
# margins of the scatterplot.
################################################################################

ggMarginal( p, type = "histogram" )



