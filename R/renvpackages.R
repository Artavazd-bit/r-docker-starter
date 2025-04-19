install.packages("renv")

library(renv)

renv::init()

renv::install(c("dplyr", "lavaan"))

renv::snapshot()
