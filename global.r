library(tidyverse)

theme_set(theme_light())

filter_df <- function(.df, .playerid, .tour, .limit21 = FALSE){
  rez <- .df %>% 
    filter(PlayerID == .playerid, Tournament == .tour)
  
  last21_days <- rez %>% 
    distinct(Date) %>% 
    arrange(Date) %>% 
    tail(21)
  
  if(.limit21){
    return(rez %>% right_join(last21_days, by = "Date"))
  } else {
    return(rez)
  }
}


phys_pca <- readRDS("data/phys_pca.rda") 
ment_pca <- readRDS("data/ment_pca.rda")
rpe <- readRDS("data/rpe2.rda")
  
source("R/slider.R")
source("R/bargraph.R")
source("R/timeseries.R")
source("R/trainingTime.R")
source("R/which_tournament_training_for.R")