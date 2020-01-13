library(readr)
library(dplyr)
library(ggplot2)
library(here)

set_here()
ebola_dat <- read_csv(file = './assignment1/data/ebola_1.csv')

View(ebola_dat)
