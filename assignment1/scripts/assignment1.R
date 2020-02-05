library(readr)
library(dplyr)
library(ggplot2)
library(here)
library(incidence)

set_here()
ebola_dat <- read_csv(file = './assignment1/data/ebola_1.csv')
ebola_dat_update <- read_csv(file = './assignment1/data/ebola_1_update.csv')

View(ebola_dat_update)

ebola_inc <- incidence(ebola_dat_update$onsetDate, groups = ebola_dat_update$status)
plot(ebola_inc, xlab = 'Date of onset')
