# R-Marginal Histograms on Scatterplot

###############################################################################
# You will need to install ggpubr if you if haven't installed it.
###############################################################################

# install.packages("ggpubr")          # Install package ggpubr if not 
                                      # installed

library(tidyverse)                    # I live in the the tidyverse
library(ggpubr)                       # Provides marginal histograms
library(cowplot)                      # Provides convenient way to
                                      # save plots ...

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

p1 <- ggscatterhist( iris, 
                        x = "Sepal.Length",
                        y = "Sepal.Width",
                        color = "#00AFBB",
                        margin.params = list(fill = "lightgray"))
p1


##################################################################################
# We used grouped data and marginal histograms.
##################################################################################

ggscatterhist( iris, x = "Sepal.Length", 
               y = "Sepal.Width",
               color = "Species", 
               size = 3, 
               alpha = 0.6,
               palette = c("#00AFBB", "#E7B800", "#FC4E07"),
               margin.params = list(fill = "Species", color = "black", size = 0.2)
)

###################################################################################
# We use boxplots instead of histograms.
###################################################################################

ggscatterhist(
    iris, x = "Sepal.Length", y = "Sepal.Width",
    color = "Species", size = 3, alpha = 0.6,
    palette = c("#00AFBB", "#E7B800", "#FC4E07"),
    margin.plot = "boxplot",
    ggtheme = theme_bw()
)