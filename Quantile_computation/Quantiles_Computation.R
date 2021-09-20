# Quantile Computations

################################################################################
# This cript shows how to use the R quantile function to computer the quartiles
# of a distribution.  We wil use the data set USArrests which is p[rovided by
#  R.
#
# This data set contains statistics, in arrests per 100,000 residents for 
# assault, murder, and rape in each of the 50 US states in 1973. Also given is 
# the percent of the population living in urban areas.
################################################################################

head( USArrests )                       # Display first 10 rows of  the data.

################################################################################
# We are asked to compute the quantile values for Q1, Q2, Q3, and Q4. In the
# below I will list the corresponding precentile and quantil for each quartile
# listed abive.  I will   We will use US Arrests for murders for our data.
# 
# Quartile   Percentile   fraction

# Q1                25%       0.25
# Q2                50%       0.50
# Q3                75%       0.75
# Q4               100%       1.00

Q1 <- quantile(USArrests$Murder, 0.25 )
Q1
Q2 <- quantile(USArrests$Murder, 0.50 )
Q2
Q3 <- quantile(USArrests$Murder, 0.75 )
Q3
Q4 <- quantile(USArrests$Murder, 1.00 )
Q4

################################################################################
# We can also do the same operatrion by using a vector of the frqactions.
################################################################################

Q <- quantile(USArrests$Murder, c(0.25,0.50,0.75,1.00))
Q

################################################################################
# There is even a more parsimonius way to compute thequartiles.
################################################################################