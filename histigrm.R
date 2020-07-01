# histogram.R
#
############################################################################
# We load the ggplot2 package.
############################################################################

library( ggplot2 )

############################################################################
# The ggplot function is not designed to work with tabulated data so I
# had to use the geom_bar function.  This has the deficiency of having gaps
# between the histogram bars.   I will given you a superior solution below
# this histogram.
############################################################################


#############################################################################
# Set up a character vector containing  the ages
#############################################################################

age <- c( " 0-5",
           "5-15",
           "15-20",
           "20-25",
           "25-30",
           "30-35",
           "35-45",
           "45-55",
           "55-65",
           "65-75",
           "75-100" )

############################################################################
# Set up the percent of ages that dall in each age bib
############################################################################

percent <- c( 7, 14, 7, 7, 7, 7, 7, 15, 10, 6, 6)

df <- data.frame( age, percent )

df

############################################################################
# The ggplot function is not designed to work with tabulated data so I
# had to use the geom_bar function.
############################################################################

ggplot( df, 
        aes( x = age, 
             y = percent )) +
    geom_bar( stat = "identity",
              color="black",
              fill="green") +
    xlab( "Age") +
    ylab( "Percent") +
    theme_bw()