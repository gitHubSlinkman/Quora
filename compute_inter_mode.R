# compute_integer_mode.r

compute_integer <-
    function( y ){
        n <- length( y )
        min_y <- min( y )
        max_y <- max( ym)
        value <- seq( from = min_y,
                      to   = max_y,
                      by = 1 )
        frequency <- rep( 0, length( value))
        
        for( i in 1:n) frequency[y[i]] = frequency[y[i]] + 1
        

        counts <- tibble( value, frequency )
        
    }




















