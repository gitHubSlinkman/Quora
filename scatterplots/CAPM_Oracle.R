# Oracle CAPM

library(tidyverse)                               # I live in the tidyverse ...
library(readr)                                   # To read csv files in the
                                                 # tidyverse environment ...
library(cowplot)                                 # For superior graphics ...

here <- getwd()

file_path <- file.path( here,                    # Set path to data file            
                        "scatterplots",
                        "DailyReturns.csv")

daily_returns <-                                 # Read data ...
    read_csv( file_path )


daily_returns$Date[1]                            # Get start date and ending dates of
daily_returns$Date[dim(daily_returns)[1]]        # data ...

CAPM <- ggplot( daily_returns,                           # Draw scatterplot ...
                aes( x=SP500r, y=ORCLr)) +
                geom_point() +
                xlab( "Daily return on S&P 500") +
                ylab( "Daily return on Oracle Stock" ) +
                ggtitle( "Daily Oracle returns versus daily returns on SP500") +
                theme_cowplot()

save_plot( "CAPM.jpeg", CAPM )
    