# R script to curl down and munge Sierra Leone 2015 census data

library(tidyverse)
library(tabulizer)
library(RCurl)
library(devtools)
library(slreferencedata)

cleanIntegerValues <- function(val) {
  as.integer(gsub(x=val, pattern=' |-', replacement=''))
}

pdfFile <- paste0(tempfile(), '.pdf')
pdfFileConn <- CFILE(pdfFile, mode="wb")
curlPerform(url = 'https://www.statistics.sl/wp-content/uploads/2017/01/final-results_-2015_population_and_housing_census.pdf',
            writedata = pdfFileConn@ref)
close(pdfFileConn)

pop <- extract_tables(pdfFile, pages=16, method='data.frame') %>%
  .[[1]] %>%
  filter(row_number() %in% 17:30)

colnames(pop) <- c('District', 'PopTotal', 'PopMale', 'PopFemale', 'PopRural', 'PopUrban', 'X1', 'X2', 'X3')

pop <- pop %>%
  select(-starts_with('X')) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop1 <- extract_tables(pdfFile, pages=26, method='data.frame',
                       area=list(c(546,33,720,1140))) %>% .[[1]]
colnames(pop1) <- paste0('X', 1:ncol(pop1))

pop2 <- extract_tables(pdfFile, pages=27, method='data.frame',
                       area=list(c(100,45,350,1141))) %>% .[[1]]
colnames(pop2) <- paste0('X', 1:ncol(pop2))

popMale <- bind_rows(pop1, pop2) %>% mutate(Sex='M')
rm(pop1, pop2)

pop1 <- extract_tables(pdfFile, pages=27, method='data.frame',
                       area=list(c(555,47,743,1138))) %>% .[[1]]
colnames(pop1) <- paste0('X', 1:ncol(pop1))

pop2 <- extract_tables(pdfFile, pages=28, method='data.frame',
                       area=list(c(90,43,319,1151))) %>% .[[1]]
colnames(pop2) <- paste0('X', 1:ncol(pop2))

popFemale <- bind_rows(pop1, pop2) %>% mutate(Sex='F')
rm(pop1, pop2)

popBySex <- bind_rows(popMale, popFemale) %>%
  mutate(X1=ifelse(X1=='95+', '95', X1)) %>%
  mutate(Variable=paste0('Pop', Sex, gsub(x=X1, pattern=' - ', replacement='_'))) %>%
  select(-X1, -Sex) %>%
  rename(Total=X2, Kailahun=X3, Kenema=X4, Kono=X5, Bombali=X6, Kambia=X7, Koinadugu=X8, `Port Loko`=X9, Tonkolili=X10, Bo=X11, Bonthe=X12,
         Moyamba=X13, Pujehun=X14, `Western Area Rural`=X15, `Western Area Urban`=X16) %>%
  select(-Total) %>%
  gather(District, Value, -Variable) %>%
  spread(Variable, Value) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popBySex, by='District')
rm(popMale, popFemale, popBySex)

popByMarital <- extract_tables(pdfFile, pages=36, method='data.frame',
                               area=list(c(505,40,803,1152))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(13,15))) %>%
  mutate(District=case_when(.$X=='Rural' ~ 'Western Area Rural',
                            .$X=='Urban' ~ 'Western Area Urban',
                            TRUE ~ .$X)) %>%
  select(-X, -X.1) %>%
  rename(PopNeverMarried=X.2, PopEngaged=X.3, PopMarriedMonogamous=X.4, PopMarriedPolygamous=X.5, PopCohabLT5=X.6, PopCohabGE5=X.7,
         PopSeparated=X.8, PopDivorced=X.9, PopWidowed=X.10, PopMaritalDontKnow=X.11) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popByMarital, by='District')
rm(popByMarital)

popLiterate <- extract_tables(pdfFile, pages=44, method='data.frame',
                              area=list(c(425,49,720,1190))) %>% .[[1]]
colnames(popLiterate) <- paste0('X', 1:ncol(popLiterate))

popLiterate <- popLiterate %>%
  mutate(X16=ifelse(X1=='75 +', '4474', X16)) %>%
  mutate(X1=ifelse(X1=='75 +', '75', X1)) %>%
  mutate(Variable=paste0('PopLiterate', gsub(x=X1, pattern=' - ', replacement='_'))) %>%
  select(-X1) %>%
  rename(Total=X2, Kailahun=X3, Kenema=X4, Kono=X5, Bombali=X6, Kambia=X7, Koinadugu=X8, `Port Loko`=X9, Tonkolili=X10, Bo=X11, Bonthe=X12,
         Moyamba=X13, Pujehun=X14, `Western Area Rural`=X15, `Western Area Urban`=X16) %>%
  select(-Total) %>%
  gather(District, Value, -Variable) %>%
  spread(Variable, Value) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popLiterate, by='District')
rm(popLiterate)

popBirthReg <- extract_tables(pdfFile, pages=54, method='data.frame',
                              area=list(c(465,36,768,482))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(13,15))) %>%
  mutate(District=case_when(.$X=='Rural' ~ 'Western Area Rural',
                            .$X=='Urban' ~ 'Western Area Urban',
                            TRUE ~ .$X)) %>%
  select(-X, -X.1) %>%
  transmute(PopBirthRegYes=X.2, PopBirthRegNo=X.3, PopBirthRegDontKnow=X.4, PopBirthRegUnstated=X.5, District) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popBirthReg, by='District')
rm(popBirthReg)

popImmunization <- extract_tables(pdfFile, pages=56, method='data.frame',
                                  area=list(c(495,24,796,527))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(13,15))) %>%
  mutate(District=case_when(.$X=='Rural' ~ 'Western Area Rural',
                            .$X=='Urban' ~ 'Western Area Urban',
                            TRUE ~ .$X)) %>%
  select(-X, -X.1) %>%
  rename(PopImmunNever=X.2, PopImmunPartial=X.3, PopImmunFull=X.4, PopImmunDontKnow=X.5) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popImmunization, by='District')
rm(popImmunization)

popSubstanceUse <- extract_tables(pdfFile, pages=57, method='data.frame',
                                  area=list(c(495,43,800,580))) %>% .[[1]]  %>%
  filter(!(row_number() %in% c(13,15))) %>%
  mutate(District=case_when(.$X=='Rural' ~ 'Western Area Rural',
                            .$X=='Urban' ~ 'Western Area Urban',
                            TRUE ~ .$X)) %>%
  select(-X, -X.1, -X.2) %>%
  mutate(X.6=ifelse(District=='Western Area Urban', '12665', X.6))  %>%
  rename(PopTobaccoOnly=X.3, PopAlcoholOnly=X.4, PopTobaccoAlcohol=X.5, PopSubstanceDontKnow=X.6) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popSubstanceUse, by='District')
rm(popSubstanceUse)

popInternetUse <- extract_tables(pdfFile, pages=59, method='data.frame',
                                 area=list(c(495,630,806,1169))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(13,15))) %>%
  mutate(District=case_when(.$X=='Rural' ~ 'Western Area Rural',
                            .$X=='Urban' ~ 'Western Area Urban',
                            TRUE ~ .$X)) %>%
  select(-X) %>%
  rename(Households=X.1, HouseholdsInternetHome=X.2, HouseholdsInternetOffice=X.3, HouseholdsInternetCafe=X.4,
         HouseholdsInternetOther=X.5, HouseholdsInternetNone=X.6) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popInternetUse, by='District')
rm(popInternetUse)

popNearestMedical <- extract_tables(pdfFile, pages=75, method='data.frame',
                                    area=list(c(430,630,740,1165))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(13,15))) %>%
  mutate(District=case_when(.$X=='Rural' ~ 'Western Area Rural',
                            .$X=='Urban' ~ 'Western Area Urban',
                            TRUE ~ .$X)) %>%
  select(-X, -X.1) %>%
  mutate(X.7=ifelse(District=='Western Area Urban', '11034', X.7))  %>%
  rename(HouseholdsNearestMedCompound=X.2, HouseholdsNearestMedHalfMile=X.3, HouseholdsNearestMedOneMile=X.4,
         HouseholdsNearestMedFiveMiles=X.5, HouseholdsNearestMedFiveMilesPlus=X.6, HouseholdsNearestMedDontKnow=X.7) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

pop <- inner_join(pop, popNearestMedical, by='District')
rm(popNearestMedical)

popMobilePhone <- extract_tables(pdfFile, pages=79, method='data.frame',
                                 area=list(c(630,40,717,1145))) %>% .[[1]]
colnames(popMobilePhone) <- paste0('X', 1:ncol(popMobilePhone))

popMobilePhone <- popMobilePhone %>%
  filter(X1 != 'Total') %>%
  mutate(Variable=paste0('HouseholdsMobilePhone', ifelse(X1=="Don't know", 'DontKnow', X1))) %>%
  select(-X1) %>%
  rename(Total=X2, Kailahun=X3, Kenema=X4, Kono=X5, Bombali=X6, Kambia=X7, Koinadugu=X8, `Port Loko`=X9, Tonkolili=X10, Bo=X11, Bonthe=X12,
         Moyamba=X13, Pujehun=X14, `Western Area Rural`=X15, `Western Area Urban`=X16) %>%
  select(-Total) %>%
  gather(District, Value, -Variable) %>%
  spread(Variable, Value) %>%
  mutate_at(vars(-District), cleanIntegerValues) %>% as_tibble()

Census2015ByDistrict <- inner_join(pop, popMobilePhone, by='District')
rm(popMobilePhone, pop)

byChiefdom <- list()

byChiefdom[[1]] <- extract_tables(pdfFile, pages=17, method='data.frame',
                                  area=list(c(239,66,700,1128))) %>% .[[1]] %>%
  filter(row_number() != 15) %>%
  mutate(District=case_when(row_number() < 15 ~ 'Kailahun', TRUE ~ 'Kenema'))
colnames(byChiefdom[[1]]) <- paste0('X', 1:ncol(byChiefdom[[1]]))

byChiefdom[[2]] <- extract_tables(pdfFile, pages=18, method='data.frame',
                                  area=list(c(155,77,721,1137))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(10,26,27))) %>%
  mutate(District=case_when(row_number() < 10 ~ 'Kenema', row_number() < 25 ~ 'Kono', TRUE ~ 'Bombali'))
colnames(byChiefdom[[2]]) <- paste0('X', 1:ncol(byChiefdom[[2]]))

byChiefdom[[3]] <- extract_tables(pdfFile, pages=19, method='data.frame',
                                  area=list(c(140,89,705,1135))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(13,21))) %>%
  mutate(District=case_when(row_number() < 13 ~ 'Bombali', row_number() < 20 ~ 'Kambia', TRUE ~ 'Koinadugu'))
colnames(byChiefdom[[3]]) <- paste0('X', 1:ncol(byChiefdom[[3]]))

byChiefdom[[4]] <- extract_tables(pdfFile, pages=20, method='data.frame',
                                  area=list(c(135,87,665,1135))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(4,16))) %>%
  mutate(District=case_when(row_number() < 4 ~ 'Koinadugu', row_number() < 15 ~ 'Port Loko', TRUE ~ 'Tonkolili'))
colnames(byChiefdom[[4]]) <- paste0('X', 1:ncol(byChiefdom[[4]]))

byChiefdom[[5]] <- extract_tables(pdfFile, pages=21, method='data.frame',
                                  area=list(c(180,80,725,1135))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(17))) %>%
  mutate(District=case_when(row_number() < 17 ~ 'Bo',  TRUE ~ 'Bonthe'))
colnames(byChiefdom[[5]]) <- paste0('X', 1:ncol(byChiefdom[[5]]))

byChiefdom[[6]] <- extract_tables(pdfFile, pages=22, method='data.frame',
                                  area=list(c(158,80,666,1131))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(15))) %>%
  mutate(District=case_when(row_number() < 15 ~ 'Moyamba',  TRUE ~ 'Pujehun'))
colnames(byChiefdom[[6]]) <- paste0('X', 1:ncol(byChiefdom[[6]]))

byChiefdom[[7]] <- extract_tables(pdfFile, pages=23, method='data.frame',
                                  area=list(c(180,80,445,1133))) %>% .[[1]] %>%
  filter(!(row_number() %in% c(5))) %>%
  mutate(District=case_when(row_number() < 5 ~ 'Western Area Rural',  TRUE ~ 'Western Area Urban'))
colnames(byChiefdom[[7]]) <- paste0('X', 1:ncol(byChiefdom[[7]]))

byChiefdom[[8]] <- tibble(
  X1='Bonthe Urban',
  X2='10075',
  X3='4925',
  X4='5150',
  X5='0',
  X6='0',
  X7='0',
  X8='10075',
  X9='4925',
  X10='5150',
  X11='Bonthe'
) # hardcoding this...assume Bonthe Urban is the balance of Bonthe district tallies in census

byChiefdom <- bind_rows(byChiefdom) %>%
  rename(TotalPopulation=X2, MalePopulation=X3, FemalePopulation=X4, RuralPopulation=X5, RuralMalePopulation=X6,
         RuralFemalePopulation=X7, UrbanPopulation=X8, UrbanMalePopulation=X9, UrbanFemalePopulation=X10, CensusChiefdomName=X1, District=X11) %>%
  mutate_at(vars(-District, -CensusChiefdomName), cleanIntegerValues) %>% as_tibble() %>%
  recodeCensusChiefdomToOCHA('CensusChiefdomName', 'District')

Census2015ByChiefdom <- byChiefdom %>%
  select(District, CensusChiefdomName, OCHAChiefdomName, ends_with('Population'))
rm(byChiefdom)

use_data(Census2015ByChiefdom, Census2015ByDistrict, overwrite=TRUE)
