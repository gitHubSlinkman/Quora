# R-Marginal Histograms on Scatterplot

###############################################################################
# You will need to install ggpubr if you if haven't installed it.
###############################################################################

install.packages("ggpubr")            # Install package ggpubr

library(tidyverse)                    # I live in the the tidyverse
library(ggpubr)                       # Provides marginal histograms

###############################################################################
# We will be using iris data.  I prefer to work with tibbles instaed of data
# frames so I convert the iris data.frame to a tibble.
###############################################################################

iris <- as.tibble(iris)               # Convert iris to tibble ...
iris

###############################################################################
# This example code can be found at: 
# https://rpkgs.datanovia.com/ggpubr/reference/ggscatterhist.html
###############################################################################

ggscatterhist(iris, x = "Sepal.Length", y = "Sepal.Width",
              color = "#00AFBB",
              margin.params = list(fill = "lightgray"))
