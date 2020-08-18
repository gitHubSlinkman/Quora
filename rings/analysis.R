# starter_diamond_rings.R

require(tidyverse)                      # I live in the tidyverse  ...
require(readr)                          # To rad the csv file ...
require(ggpubr)                         # For simple plots ...

setwd("rings")
getwd()

###############################################################################
# The data source is: http://jse.amstat.org/v4n3/datasets.chu.html
#
# The source of the data is a full page advertisement placed in the Straits 
# Times newspaper issue of February 29, 1992, by a Singapore-based retailer 
# of diamond jewelry.
#
# The advertisement contained pictures of diamond rings and listed their
# prices, diamond content, and gold purity. Only 20K ladies' rings, each 
# mounted with a single diamond stone, were considered for this study. 
# 20K rings are made with gold of 20 carat purity. (Pure gold is rated as\
# 24K.)
#
# There were 48 such rings of varying designs. The weights of the diamond 
# stones ranged from 0.12 to 0.35 carats (a one carat diamond stone weighs
# 0.2 gram) and were priced between $223 and $1086. The jewelry store 
# adopted a fixed-price policy.
###############################################################################

rings <- read_csv( "rings.csv")         # Read the data file ...

# Draw a scatter plot of proce versus carates 

ggscatter( rings,
           x     = "carats",
           y     = "price",
           color = "black",
           fill  = "black",
           point = TRUE,
           rug  = FALSE,
           title = "Sinagpore starter diamond proces in 1992",
           xlab = "Carats",
           ylab = "Sigapore Dollars",
           add =  "reg.line" )

fit <- lm( price ~ carats, data = rings)
summary(fit)
corr(rings)
sd( ring$carats)
sd(rings$price)

