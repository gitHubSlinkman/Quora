# Simulation of Australian age at death doe 2012'\

require(tidyverse)                             # I live in the tidyverse ...


fp <- file.path( getwd(),
                 "Skewness",
                 "data",
                 "age_at_death.csv" )

age_at_death <- read.csv( fp )

lower <-
    age_at_death %>% 
        pull( lower_bound )

upper <- 
    age_at_death %>%
        pull( Upper_bound )


frequency <- 
    age_at_death %>%
        mutate( frequency = M_total + F_total) %>%
            pull( frequency )

tabulation <- tibble( lower, upper, frequency)
tabulation




    





        


        
    


