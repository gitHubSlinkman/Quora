# oil_quality_back.r

library(tidyverse)
library(readr)

home <- getwd()
file_path <- file.path( home, 
                        "scatterplots",
                        "OilQualityBank.csv")
oqb <- read_csv( file_path )

ggplot( oqb,
        aes(x=API, y=Price)) +
    geom_point() +
    geom_smooth( method="lm",
                 se=FALSE,
                 color="red") +
    ggtitle( "Oil Quality Bank") +
    theme_cowplot()

fit <- lm( Price ~ API, data=oqb )
summary(fit)
