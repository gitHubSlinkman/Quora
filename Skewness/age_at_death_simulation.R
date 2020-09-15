# Simulation of Australian age at death doe 2012'\

require(tidyverse)                             # I live in the tidyverse ...

setwd("D:/R-Projects/Skewness")

fp <- file.path( getwd(),
                 "data",
                 "age_at_death.csv" )

age_at_death <- read.csv( fp )
