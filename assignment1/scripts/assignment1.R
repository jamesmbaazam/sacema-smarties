library(readr)
library(dplyr)
library(ggplot2)
library(here)
library(incidence)

set_here()
ebola_dat <- read_csv(file = './assignment1/data/ebola_1.csv')

View(ebola_dat)

ebola_inc <- incidence(ebola_dat$onsetDate, groups = ebola_dat$status)
plot(ebola_inc, xlab = 'Date of onset')
