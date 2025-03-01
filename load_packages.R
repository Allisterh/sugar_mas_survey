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
# renv::init()
# if (!require("pacman")) install.packages("pacman")
# if (!require("janitor")) install.packages("janitor")

# renv::install(packages = c('showtext', 'showtextdb'))
# renv::install('cardx')
renv::install('plotly')
library(pacman)
library(gtsummary)
library(summarytools)
library(fs)
library(here)
library(tidyverse)
library(tidyplus)
library(tidyselect)
library(janitor)
library(scales)
library(ggpubr)
library(plotly)
library(knitr)
library(sjPlot)
library(showtext)
# renv::status()
# ?renv::status
# renv::snapshot()
suppressPackageStartupMessages(
  pacman::p_load(tidyverse, scales,
                 knitr, sjPlot,
                 vcd, vcdExtra, 
                 questionr, pollster, 
                janitor, sjPlot, memisc, 
                ggpubr))
## set working directory for Mac and PC



# if (!require("googlesheets4")) install.packages("googlesheets4")
# library(googlesheets4)
# 
# url1 <- 'https://docs.google.com/spreadsheets/d/'
# url2 <- '1a12rNnhmO4rU-hzbfduPnrcRtgzUDgIJz8qcbYvFZMk/edit?resourcekey=&gid=458918389#gid=458918389'
# 
# library(super)
# 
# super::glue(url1,url2)

# url <- super::glue("{url1}{url2}")
# url
# 
# googlesheets4::read_sheet(url)
# 
# gs4_user()
# "#562457"
# "#552D62"

