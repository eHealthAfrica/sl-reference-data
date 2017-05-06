# R script to curl down and munge WHO ebola virus case reports

library(tidyverse)
library(devtools)

WEEK_LABEL_PATTERN <- '([0-9]+)-W([0-9]+)'

EbolaCasesWHO <- read_csv('http://apps.who.int/gho/athena/xmart/EBOLA_MEASURE/CASES?filter=LOCATION:*;COUNTRY:SLE;INDICATOR_TYPE:SITREP_NEW;DATAPACKAGEID:2016-05-11;SEX:-&x-sideaxis=LOCATION;EBOLA_DATA_SOURCE;INDICATOR_TYPE;CASE_DEFINITION&x-topaxis=COUNTRY;EPI_WEEK&profile=crosstable&format=csv',
                          skip=1, col_types=cols(.default=col_character())) %>%
  select(-`Indicator type`) %>%
  rename(District=Location,
         DataSource=`Ebola data source`,
         CaseDefinition=`Case definition`) %>%
  gather(Week, Cases, -District, -DataSource, -CaseDefinition) %>%
  mutate(Cases=as.integer(Cases), WeekLabel=gsub(x=Week, pattern='.+\\((.+)\\)', replacement='\\1')) %>%
  mutate(District=case_when(
    .$District=='BO' ~ 'Bo',
    .$District=='BOMBALI' ~ 'Bombali',
    .$District=='BONTHE' ~ 'Bonthe',
    .$District=='KAILAHUN' ~ 'Kailahun',
    .$District=='KAMBIA' ~ 'Kambia',
    .$District=='KENEMA' ~ 'Kenema',
    .$District=='KOINADUGU' ~ 'Koinadugu',
    .$District=='KONO' ~ 'Kono',
    .$District=='MOYAMBA' ~ 'Moyamba',
    .$District=='PORT LOKO' ~ 'Port Loko',
    .$District=='PUJEHUN' ~ 'Pujehun',
    .$District=='TONKOLILI' ~ 'Tonkolil',
    .$District=='WESTERN AREA RURAL' ~ 'Western Area Rural',
    .$District=='WESTERN AREA URBAN' ~ 'Western Area Urban'
  )) %>%
  mutate(Year=as.integer(gsub(x=WeekLabel, pattern=WEEK_LABEL_PATTERN, replacement='\\1')),
         Week=as.integer(gsub(x=WeekLabel, pattern=WEEK_LABEL_PATTERN, replacement='\\2'))) %>%
  select(District, DataSource, CaseDefinition, WeekLabel, Year, Week, Cases)

use_data(EbolaCasesWHO, overwrite=TRUE)
