# first_vowels.r
#

library( stringr )                              # Provides a consisstent set
                                                # of string functions ...

###############################################################################
# We will use the babynames package as our source of baby names.  The code    #
# below will install the babyname packages if you have not installed it       #
# before.                                                                     #
###############################################################################

success <- require(babynames)                   # Installs the babynames package
if( !success ){                                 # and loads the babynames 
    install.packages("babynames")               # package
    success <- require(babynames)
}

dim( babynames )                                # Get the diensions of the
head( babynames )                               # babynaes data frame ...

unique_names <- unique( babynames$name )        # Find unique names ...

str_sub( unique_names, star=1, end=1 )          # This gets the first character ...

first_chr <- str_sub( unique_names,             # Get the first character.  We 
                      start=1,                  # assunme it is a capital because it
                      end=1 )                   # is first ...

str_detect( first_chr, "[AEIOU]" )              # This function detechs if iue
                                                # first character is in the regular
                                                # expression "[AEIOU]".  This function
                                                # a value of TRUE or FALSE ...

sum( str_detect( first_chr, "[AEIOU]" ) )       # Because R stores a TRUE value as 1
                                                # and a FALSE value as a zero we can
                                                # sum rhw number the output of 
                                                # str_detect() to obtain the number
                                                # of unique names that start with a 
                                                # vowels ...
             
            


 