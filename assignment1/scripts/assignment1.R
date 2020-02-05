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

?incidence

ebola_dat_u_s <- ebola_dat_update[order(ebola_dat_update$onsetDate),]
eb_only_latest <- ebola_dat_u_s[-c(1,2),]

table(eb_only_latest$status)

##### fit incidence curve

View(eb_only_latest)

ebola_inc2 <- incidence(eb_only_latest$onsetDate, interval=7)
View(ebola_inc2)
ebola_inc2$counts

f1 <- fit(ebola_inc2)

plot(f1)

ebola_inc2$counts

sum(!is.na(eb_only_latest$deathDate))/ nrow(eb_only_latest)

f2 <- fit_optim_split(ebola_inc2)
plot(f2)

##
f3 <- fit(ebola_inc2)
