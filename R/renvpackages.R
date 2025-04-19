install.packages("renv")

library(renv)

renv::init()

renv::status()

renv::install(c("lavaan", "dplyr"))

renv::activate()

renv::snapshot()
