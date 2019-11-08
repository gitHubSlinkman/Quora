# O=old_faaithful,R

require(alr4)

ggplot( faithful,
        aes( x=eruptions, y=waiting )) +
    geom_point() +
    geom_smooth( method="lm",
                 se=FALSE,
                 color="red") +
    xlab( "Last eruption length(minutes)") +
    ylab( "Wait to next eruption(minutes) ") +
    ggtitle( "Prediction of Old Faithful waiting time to next eruption") +
    theme_cowplot()
