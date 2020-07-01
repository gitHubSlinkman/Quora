# nCovid-19.R

library( tidyverse )
library( LearnBayes )
library( cowplot )

theme_set(theme_cowplot())

q1  <- list( p = 0.10, x = 0.05 )
q2  <- list( p = 0.90, x = 0.20 )
shape <- beta.select( q1, q2  )
alpha <- shape[1]
beta  <- shape[2]

c( alpha, beta )

theta <- seq( from = 0, to = 1, by = 0.01 )
density <- dbeta( theta, alpha, beta )



prior <- tibble( theta, density ) %>% 
            ggplot( aes( x = theta, y=density)) +
            geom_line() +
            xlab( "Probability of death") +
            ylab( "Density" ) +
            ggtitle( "Prior distribution of probbilty of death" )
prior

mean <- alpha/( alpha + beta )
median <- qbeta( 0.50, alpha, beta )
mode   <-  ( alpha - 1 ) / ( alpha + beta - 2 )

round( mode, 3 )

c( qbeta( 0.025, alpha, beta ), qbeta(0.975, alpha, beta ) )


r <-  alpha
n <- alpha + beta

mean <- alpha/( alpha + beta )
median <- qbeta( 0.50, alpha, beta )
mode   <-  ( alpha - 1 ) / ( alpha + beta - 2 )


round( c( mean, median, mode ), 3)

# Bayes theorem

rp <- r + 6
np <- n + 100

exp = rp / np 
round( exp, 3)

alpha_prime <- rp
beta_prime  <- np - rp

c( alpha_prime, beta_prime)

density <- dbeta( theta, alpha_prime, beta_prime )

posterior <- tibble( theta, density ) %>% 
    ggplot( aes( x = theta, y=density )) +
    geom_line() +
    xlab( "Probability of death") +
    ylab( "Density" ) +
    ggtitle( "Posterior distribution of probbilty of death" )
posterior

mean <- alpha_prime/( alpha_prime + beta_beta_prime )
median <- qbeta( 0.50, alpha_pprime, beta_prime )
mode   <-  ( alpha_prime - 1 ) / ( alpha_prime + beta_prime - 2 )
c( mean, median, mode )

c( qbeta( 0.025, alpha_prime, beta_prime ), 
   qbeta( 0.975, alpha_prime, beta_prime ) )

phat = 6 / 100
se = sqrt( phat * ( 1 - phat)/ 100)
c( phat - 1.96 * se, phat + 1.96 * se )    
