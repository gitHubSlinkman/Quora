# QQplots.r

source('~/R-Projects/Rsource/load_packages_v001.R')

set.seed( 11 )

 sample_t <-                                # Generates a sample of size n drawn from
    function( n,                            # Student's t distribution with df degrees
              df,                           # of freedom and scaled to loaction 
              central_tendency,             # central_tendency with a normal standard
              dispersion ){                 # deviation given by dispersion.
                 central_tendency +                   
                 dispersion * rt( n, 100 )
    } 

n <- 100
t <- rt( n, 1 )
x <- round( 69 + 5 * t, 0 )
x[x<0] <- 0
x
x[x>100]<- 100
x

bins <- floor( log2(100) )

intervals <- pretty( y, 
                     n=bins, 
                     min.n=5,
                     shrink.small= 0,
                     high_.u.bias=2,
                     eps.correct=0 )

y_breaks <- intervals
width    <- y_breaks[2] - y_breaks[1]
y_labels <- sprintf( "%2.0f", y_breaks )
#

p1 <- 
    ggplot( tibble( y ), aes( x=y ),) +
        geom_histogram( binwidth = width,
                        color="black",
                        fill="yellow" ) +
    
