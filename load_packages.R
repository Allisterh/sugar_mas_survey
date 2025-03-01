# HEADER --------------------------------------------
#
# Author:     Allister O Hodge
# Copyright   Copyright 2025 - Name Surname
# Email:      hodge.allister@gmail.com/hodge_allister2@outlook.com
#
# Date:     2025-02-24
#
# Script Name:    
#
# Script Description:
#
#
# SETUP ------------------------------------
cat("\014")                 # Clears the console
rm(list = ls())             # Remove all variables of the work space
gc()
options(scipen = 6, digits = 4) # I prefer to view outputs in non-scientific notation
memory.limit(30000000)     # this is needed on some PCs to increase memory allowance, but has no impact on macs.


if(!require('renv')) install.packages('renv')
if (!require("pacman")) install.packages("pacman")
library(pacman)
suppressPackageStartupMessages(pacman::p_load(tidyverse, vcd, vcdExtra, questionr, pollster, 
                                              janitor, sjPlot, memisc))
## set working directory for Mac and PC



if (!require("googlesheets4")) install.packages("googlesheets4")
library(googlesheets4)

url1 <- 'https://docs.google.com/spreadsheets/d/'
url2 <- '1a12rNnhmO4rU-hzbfduPnrcRtgzUDgIJz8qcbYvFZMk/edit?resourcekey=&gid=458918389#gid=458918389'

library(super)

super::glue(url1,url2)

url <- super::glue("{url1}{url2}")
url

googlesheets4::read_sheet(url)

gs4_user()
"#562457"
"#552D62"

library(readr)
df <- readr::read_tsv('data_input/KNA_carnival_data.tsv')


if (!require("janitor")) install.packages("janitor")


df2 <- df |>  
  janitor::clean_names()


df2 |> 
  dplyr::mutate(across(c(gender, age, nationality), 
                ~as.factor(.)))


df_l5 %>% map(~tabyl(., q7 , q8))


library(tidyverse)
df2 %>% group_by(nationality) %>% tally() 
library(ggpubr)



df2 %>% group_by(nationality) %>% tally() |> 
  ggpubr::ggpie('n', label = 'nationality', 
                fill = 'nationality',
                color = "white",
                palette = c('#04943b', "#E7B800", '#cb152b',
                            '#7c7c7c', '#665d38',
                            "#00AFBB") )



--salem: '#04943b';
  --crimson: '#cb152b';
  --ripe-lemon: '#f7cb0b';
  --black: '#040404';
  --verdigris: '#665d38';
  --gray: '#848484';
  --boulder: '#7c7c7c';
  --mine-shaft: '#3c3c3c';
  --cannon-black: '#2d2407';
  --mine-shaft: '#2c2c2c';


df2 |>  
  select(20) |> 
  setNames('Q20') |> 
  mutate(Q20 = as.factor(Q20)) |> 
  group_by(Q20) %>% tally() |> 
  drop_na() |> 
  mutate(all = sum(n)) |> 
  mutate(percentage = (n/all)*100) 
  

library(scales)
df2 |>  
  select(12) |> 
  setNames('Q12') |> 
  mutate(Q12 = as.factor(Q12)) |> 
  group_by(Q12) %>% tally() |> 
  drop_na() |> 
  mutate(all = sum(n)) |> 
  mutate(percentage = n/all) |> 
  mutate(percentage1= paste(Q12, scales::percent(percentage))) |> 
  ggpubr::ggpie('percentage', 
                label = 'percentage1', 
                fill = 'Q12',
                color = "white",
                palette = c('#04943b', "#E7B800", '#cb152b',
                            '#7c7c7c', '#665d38',
                            "#00AFBB") ,
                lab.pos = "in", lab.font = "white")


# compute frequency of sectors
df2 |>  
  select(12) |> 
  setNames('Q12') |> 
  mutate(Q12 = as.factor(Q12)) |> 
  group_by(Q12) |> 
           
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))


with(df2, frequency(age, ord = 'desc'))
table(df2$gender, df2$age)

mytable <- xtabs(~age+gender, data=df2)
ftable(mytable) # print table
summary(mytable) # chi-square test of independence

df2 %>%
  tabyl(gender, age) %>% 
  adorn_totals(where = c("row","col"))
  adorn_totals(where = "row")


library(knitr)
kable(df2 %>%
  tabyl(gender, age) %>% 
  adorn_totals("col") %>%
  adorn_percentages("row") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns() %>%
  adorn_title())
df2 |> ncol()
df2 |> dim()



V0:V22
df3 <- df2 |> 
  setNames(paste0("Q",seq(1:ncol(df2)))) |> 
  print(n=10) |> 
  mutate(across(Q3:Q23, ~as.factor(.)))

length(df2)
ncol(df2)

df3 |>  
  select(Q17) |> 
  group_by(Q17) |> 
  
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))


library(pollster)

df1 <- pollster::illinois
crosstab(df = df3, x = Q3, y = Q17) %>%
  kable()       


library(sjPlot)
sjPlot::sjt.xtab(var.row = df3$Q3, 
                 var.col = df3$Q17, 
                 title = "Table Title", 
                 show.row.prc = TRUE)


sjPlot::plot_xtab(df3$Q3,df3$Q17,
                  margin = 'row',
  bar.pos = "stack", 
  coord.flip = TRUE) +
  theme_minimal()

sjPlot::plot_xtab(df3$Q3,df3$Q12,
                  margin = 'row',
                  bar.pos = "stack", 
                  coord.flip = TRUE) +
  theme_minimal()


df3 %>%
  group_by(Q3, Q12) %>%
  summarise(n = n()) %>%
  mutate(freq = n / sum(n))
