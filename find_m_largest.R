# This function find;s the m largest values in the vector X.

#' find_m_largest
#' This function find the m largest values in a vector. If the vector 
#' has fewer elements than m the entire vector is returned in 
#' descending order.
#'
#' @param x - A vector of numerical objects 
#' @param m - the number of the number of m largest values to
#'            find in the vector 
#'
#' @return -  a list of the m largest valus in reverse sorted order ...
#' @export
#'
#' @examples.
find_m_largest <- function( x, m )               # Begin function definition 
    {              
#
    x <- x[ order( -x) ]                         # Sort x in descing order ...
#
    if( m > length(x)) return( x )               # If the number or requested
                                                 # numbers is grater than the
                                                 # vector length the vector is
                                                 # returned in descending oreder
#    
    return( x[1:m] )  
    }                                            # End function definition.
#


set.seed( 11235813 )                             # So every one gets the
                                                 # sample data ...
#
example <- sample( 1:10, replace=TRUE )          # Generatre a random sample of
                                                 # integers
example                                          # Display integer data
#                    
find_m_largest( example, 3 )                     # Find the three largest integers ...
#
find_m_largest( example, 20 )                    # Find the 20 largest numbers in a
                                                 # vector of size 10 ...
#
scores <- round(  rnorm( 100, 70, 10 ) )         # Simulate statistics class as a
                                                 # normal distribution with a mean 
                                                 # of 70 and a standard deviation of
                                                 # of 10

find_m_largest( scores, 10 )                     # Find 10 highest test scores ... 
#
                                                 