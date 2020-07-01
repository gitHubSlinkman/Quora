# Partial Regression Coefficients

###############################################################################
# We demonstrate that partial regression coefficients with linear regression
# The data is the drugcost data set in package alr4 that is used in Sandord
# Weeisberg Applied Linear Regression (4 edition).  In my opinion it is the
# applied linear regression book.
###############################################################################

library( tidyverse )                             # I live in the tidyverse ...
library( GGally )                                # To draw scatterplot matrix
library(alr4)                                    # Data is in this package ...
library( broom )                                 # To make tidverse regression
                                                 # libear model objects ...
library( cowplot )                               # For better looking graphs ...
theme_set( theme_cowplot )                       # Turn on cowplot them to
                                                 # professional graphics ...

drugcost <- as_tibble( drugcost )                # Change the df to a tibble ...
drugcost                                         # Display tibble ...


# Our data ...
#############################################################################
# Variable # Use       # Definition
#############################################################################
# COST     # Resonse   # Average. cost to plan for 1 prescription for 1 day
#############################################################################
# RXPM     # Predictor # Number of prescriptions per member per year
#############################################################################
# GS       # Predictor # Percent generic substitution, number between 
#          #           # 0 (no substitution) to 100 (always use generic
#          #           # substitute)
#############################################################################

#############################################################################
# To keep us from getting confued I will remove the remove all the oother
# predictoors from the data tibble.
############################################################################

drugcost <- 
    drugcost %>% 
        select( COST,
                RXPM,
                GS )



#############################################################################
# Our ffirst activity should always be to plot our data.
#############################################################################

scatmat( drugcost ) +
    ggtitle( "Scaterplot matrix of Drug Data")

full_model <- lm( COST ~ RXPM + GS,
                  data = drugcost )
summary( full_model )

fm_coef <- tidy( full_model )
fm_coef

#############################################################################
# We are nogoing to compute the partial regression coefficient for RXPM by
# partial regression.  So we first need to adjust COST and RXPM dor GS. WEe
# do this below.  What we need are the residuals of COST and RXPM regressed
# on GS.
#############################################################################

model_COST.GS <- lm( COST ~ GS, 
                     data=drugcost )

COST.GS    <- residuals( model_COST.GS )

model_RXPM.GS <- lm( RXPM ~ GS,
                     data = drugcost )

RXPM.GS <- residuals( model_RXPM.GS)

residuals.GS <- tibble( COST.GS, 
                        RXPM.GS )
residuals.GS

