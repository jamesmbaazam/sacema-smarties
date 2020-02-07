library(readr)
library(dplyr)
library(ggplot2)
library(here)
library(incidence)

set_here()
ebola_dat <- read_csv(file = './assignment1/data/ebola_1_update.csv')
ebola_dat_update <- read_csv(file = './assignment1/data/ebola_1_update.csv') %>% 
    arrange(reportDate) %>% mutate(reportDelay = reportDate - onsetDate) 

ebola_inc <- incidence(ebola_dat_update$onsetDate, groups = ebola_dat_update$status)
plot(ebola_inc, xlab = 'Date of onset')


reportDelay_mean <- mean(ebola_dat_update$reportDelay)

confirmed_cases <- ebola_dat_update %>% 
    filter(status == 'confirmed') %>% 
    nrow()

confirmed_cases

fatality <- ebola_dat_update %>% 
    filter(status == 'confirmed') %>% 
    tidyr::drop_na(deathDate) %>% 
    nrow()

cfr <- binom.test(fatality, confirmed_cases, conf.level = .95) %>% 
    broom::tidy(cfr) %>% 
    select(conf.low, estimate, conf.high)

cfr*100 #case-fatality ratio

case_status_by_sex <- ebola_dat %>% 
    filter(status == 'confirmed') %>% 
    group_by(status, sex) %>% 
    count() 

case_status_by_sex

