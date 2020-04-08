# vesuvius.r

library( tidyverse )
library( readr )
library( simpleboot )
library( flextable )

vesuvius <- read_csv( "Vesuvius.csv" )

vesuvius %>% 
    flextable()