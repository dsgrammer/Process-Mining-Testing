# load libraries ####
library(bupaR)
library(edeaR)
library(processmapR)
library(eventdataR)
library(tidyverse)
library(DiagrammeR)
library(xesreadR)

setwd('C:/Users/dsgra/OneDrive/Documents/GitHub/Process-Mining-Testing')

log <- eventdataR::BPIC_14_incident_log
log <- eventdataR::hospital_billing


log %>% 
  summary

log %>% 
  activity_frequency(level = "activity")

log %>% 
  activity_frequency(level = "activity") %>% 
  plot()

# process map ####
processmapR::process_map(log)

processmapR::process_matrix(log) %>%
  plot()

processmapR::trace_explorer(log)

trace_explorer <- log %>%
  trace_explorer(coverage = 0.5)
ggsave('trace-explorer.png', trace_explorer, width = 12)
rm(trace_explorer)#removes from environment

processmapR::idotted_chart(log)

resource_matrix <- processmapR::resource_matrix(log) %>%
  plot()
ggsave('resource-matrix.png', resource_matrix)
rm(resource_matrix)
