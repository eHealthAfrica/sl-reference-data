#' 2015 Census Tabulations by Chiefdom
#'
#' This data frame contains the Sierra Leone 2015 Census results for selected variables, by Chiefdom
#'
#' @format A data frame with 165 rows and 12 variables:
#' \describe{
#'  \item{District}{Name of District}
#'  \item{CensusChiefdomName}{Name of Chiefdom in Census Tabulation}
#'  \item{OCHAChiefdomName}{Name of Chiefdom as used by United Nations Office for the Coordination of Humanitarian Affairs}
#'  \item{TotalPopulation}{Total Population}
#'  \item{MalePopulation}{Male Population}
#'  \item{FemalePopulation}{Female Population}
#'  \item{RuralPopulation}{Rural Population}
#'  \item{RuralMalePopulation}{Rural Male Population}
#'  \item{RuralFemalePopulation}{Rural Female Population}
#'  \item{UrbanPopulation}{Urban Population}
#'  \item{UrbanMalePopulation}{Urban Male Population}
#'  \item{UrbanFemalePopulation}{Urban Female Population}
#' }
#' @source \url{https://www.statistics.sl/wp-content/uploads/2017/01/final-results_-2015_population_and_housing_census.pdf}
"Census2015ByChiefdom"

#' 2015 Census Tabulations by District
#'
#' This data frame contains the Sierra Leone 2015 Census results for selected variables, by District
#'
#' @format A data frame with 13 rows and 97 variables:
#' \describe{
#'  \item{District}{Name of District}
#'  \item{PopTotal}{Total Population}
#'  \item{PopMale}{Male Population}
#'  \item{PopFemale}{Female Population}
#'  \item{PopRural}{Rural Population}
#'  \item{PopUrban}{Urban Population}
#'  \item{PopF0_4}{Female Population aged 0-4}
#'  \item{PopF10_14}{Female Population aged 10-14}
#'  \item{PopF15_19}{Female Population aged 15-19}
#'  \item{PopF20_24}{Female Population aged 20-24}
#'  \item{PopF25_29}{Female Population aged 25-29}
#'  \item{PopF30_34}{Female Population aged 30-34}
#'  \item{PopF35_39}{Female Population aged 35-39}
#'  \item{PopF40_44}{Female Population aged 40-44}
#'  \item{PopF45_49}{Female Population aged 45-49}
#'  \item{PopF5_9}{Female Population aged 5-9}
#'  \item{PopF50_54}{Female Population aged 50-54}
#'  \item{PopF55_59}{Female Population aged 55-59}
#'  \item{PopF60_64}{Female Population aged 60-64}
#'  \item{PopF65_69}{Female Population aged 65-69}
#'  \item{PopF70_74}{Female Population aged 70-74}
#'  \item{PopF75_79}{Female Population aged 75-79}
#'  \item{PopF80_84}{Female Population aged 80-84}
#'  \item{PopF85_89}{Female Population aged 85-89}
#'  \item{PopF90_94}{Female Population aged 90-94}
#'  \item{PopF95}{Female Population aged 95+}
#'  \item{PopM0_4}{Male Population aged 0-4}
#'  \item{PopM10_14}{Male Population aged 10-14}
#'  \item{PopM15_19}{Male Population aged 15-19}
#'  \item{PopM20_24}{Male Population aged 20-24}
#'  \item{PopM25_29}{Male Population aged 25-29}
#'  \item{PopM30_34}{Male Population aged 30-34}
#'  \item{PopM35_39}{Male Population aged 35-39}
#'  \item{PopM40_44}{Male Population aged 40-44}
#'  \item{PopM45_49}{Male Population aged 45-49}
#'  \item{PopM5_9}{Male Population aged 5-9}
#'  \item{PopM50_54}{Male Population aged 50-54}
#'  \item{PopM55_59}{Male Population aged 55-59}
#'  \item{PopM60_64}{Male Population aged 60-64}
#'  \item{PopM65_69}{Male Population aged 65-69}
#'  \item{PopM70_74}{Male Population aged 70-74}
#'  \item{PopM75_79}{Male Population aged 75-79}
#'  \item{PopM80_84}{Male Population aged 80-84}
#'  \item{PopM85_89}{Male Population aged 85-89}
#'  \item{PopM90_94}{Male Population aged 90-94}
#'  \item{PopM95}{Male Population aged 95+}
#'  \item{PopNeverMarried}{Population Never Married}
#'  \item{PopEngaged}{Population Engaged}
#'  \item{PopMarriedMonogamous}{Population Married and Monogamous}
#'  \item{PopMarriedPolygamous}{Population Married and Polygamous}
#'  \item{PopCohabLT5}{Population Cohabitation <5 years}
#'  \item{PopCohabGE5}{Population Cohabitation >=5 years}
#'  \item{PopSeparated}{Population Separated}
#'  \item{PopDivorced}{Population Divorced}
#'  \item{PopWidowed}{Population Widowed}
#'  \item{PopMaritalDontKnow}{Population Marital Status Don't Know}
#'  \item{PopLiterate10_14}{Population Literate aged 10-14}
#'  \item{PopLiterate15_19}{Population Literate aged 15-19}
#'  \item{PopLiterate20_24}{Population Literate aged 20-24}
#'  \item{PopLiterate25_29}{Population Literate aged 25-29}
#'  \item{PopLiterate30_34}{Population Literate aged 30-34}
#'  \item{PopLiterate35_39}{Population Literate aged 35-39}
#'  \item{PopLiterate40_44}{Population Literate aged 40-44}
#'  \item{PopLiterate45_49}{Population Literate aged 45-49}
#'  \item{PopLiterate50_54}{Population Literate aged 50-54}
#'  \item{PopLiterate55_59}{Population Literate aged 55-59}
#'  \item{PopLiterate60_64}{Population Literate aged 60-64}
#'  \item{PopLiterate65_69}{Population Literate aged 65-69}
#'  \item{PopLiterate70_74}{Population Literate aged 70-74}
#'  \item{PopLiterate75}{Population Literate aged 75+}
#'  \item{PopBirthRegYes}{Population Birth Registration Yes}
#'  \item{PopBirthRegNo}{Population Birth Registration No}
#'  \item{PopBirthRegDontKnow}{Population Birth Registration Don't Know}
#'  \item{PopBirthRegUnstated}{Population Birth Registration Unstated}
#'  \item{PopImmunNever}{Population Immunized Never}
#'  \item{PopImmunPartial}{Population Immunized Partial}
#'  \item{PopImmunFull}{Population Immunized Full}
#'  \item{PopImmunDontKnow}{Population Immunized Don't Know}
#'  \item{PopTobaccoOnly}{Population Tobacco Only}
#'  \item{PopAlcoholOnly}{Population Alcohol Only}
#'  \item{PopTobaccoAlcohol}{Population Tobacco and Alcohol}
#'  \item{PopSubstanceDontKnow}{Population Substance Don't Know}
#'  \item{Households}{Households}
#'  \item{HouseholdsInternetHome}{Households with Internet Home}
#'  \item{HouseholdsInternetOffice}{Households with Internet Office}
#'  \item{HouseholdsInternetCafe}{Households with Internet Cafe}
#'  \item{HouseholdsInternetOther}{Households with Internet Other}
#'  \item{HouseholdsInternetNone}{Households with Internet None}
#'  \item{HouseholdsNearestMedCompound}{Households Nearest Health Facility in Compound}
#'  \item{HouseholdsNearestMedHalfMile}{Households Nearest Health Facility < Half Mile}
#'  \item{HouseholdsNearestMedOneMile}{Households Nearest Health Facility < One Mile}
#'  \item{HouseholdsNearestMedFiveMiles}{Households Nearest Health Facility < Five Miles}
#'  \item{HouseholdsNearestMedFiveMilesPlus}{Households Nearest Health Facility 5+ Miles}
#'  \item{HouseholdsNearestMedDontKnow}{Households Nearest Health Facility Don't Know}
#'  \item{HouseholdsMobilePhoneDontKnow}{Households Mobile Phone Don't Know}
#'  \item{HouseholdsMobilePhoneNo}{Households Mobile Phone No}
#'  \item{HouseholdsMobilePhoneYes}{Households Mobile Phone Yes}
#' }
#' @source \url{https://www.statistics.sl/wp-content/uploads/2017/01/final-results_-2015_population_and_housing_census.pdf}
"Census2015ByDistrict"

#' Ebola virus cases by week by district
#'
#' This data frame contains the number of Ebola virus cases reported by the World Health Organization
#'
#' @format A data frame with 6,888 rows and 7 variables:
#' \describe{
#'  \item{District}{Name of District}
#'  \item{DataSource}{Source of the data:  Situation Report, or Patient Database}
#'  \item{CaseDefinition}{Type of case:  Confirmed or Probable}
#'  \item{WeekLabel}{Label for the week of observation, in WHO format (yyyy-Www, e.g., 2014-W45)}
#'  \item{Year}{Integer value of the year (2014-2016)}
#'  \item{Week}{Integer value of the week (1-53)}
#'  \item{Cases}{Number of Cases}
#' }
#' @source \url{http://apps.who.int/gho/data/node.ebola-sitrep.ebola-country-SLE-20160511?lang=en}
"EbolaCasesWHO"

#' Spatial polygons for District boundaries
#'
#' A SpatialPolygonsDataFrame containing the District boundaries in Sierra Leone.
#' Note that ROWCA=OCHA Regional Office for West and Central Africa.
#'
#' @format The embedded data frame contains 14 rows (one per District) and the following columns:
#' \describe{
#'  \item{OBJECTID_1}{}
#'  \item{OBJECTID}{}
#'  \item{admin2Name}{District Name}
#'  \item{admin2Pcod}{District Code/Identifier}
#'  \item{admin2RefN}{District Reference Name}
#'  \item{admin2AltN}{}
#'  \item{admin2Al_1}{}
#'  \item{admin1Name}{Province Name}
#'  \item{admin1Pcod}{Province Code}
#'  \item{admin0Name}{Nation name (Sierra Leone)}
#'  \item{admin0Pcod}{Nation FIPS code}
#'  \item{date}{Update date}
#'  \item{validOn}{Validity date}
#'  \item{ValidTo}{}
#'  \item{Shape_Leng}{}
#'  \item{Rowcacode0}{ROWCA Nation code = SLE}
#'  \item{Rowcacode1}{ROWCA Province code}
#'  \item{Rowcacode2}{ROWCA District code}
#'  \item{Shape_Le_1}{}
#'  \item{Shape_Area}{}
#'  \item{id}{Sequential ID to facilitate merging with fortified data frame}
#' }
#' @source \url{https://data.humdata.org/dataset/sierra-leone-all-ad-min-level-boundaries}
#' @usage
#' library(ggplot2)
#' library(dplyr)
#'
#' districtPolyDf <- fortify(slreferencedata::DistrictPolygons)
#' districtPolyDf <- left_join(districtPolyDf, slreferencedata::DistrictPolygons@data) %>%
#'   left_join(slreferencedata::Census2015ByDistrict %>% select(District, PopTotal), by=c('admin2Name'='District'))
#'
#' ggplot(data=districtPolyDf, aes(x=long, y=lat, group=group)) +
#'   geom_path(color="grey") +
#'   scale_fill_gradient(low = "#ffffcc", high = "#ff4444", space = "Lab", na.value = "grey50", guide = "colourbar", name="Population") +
#'   geom_polygon(aes(fill=PopTotal)) +
#'   coord_map(projection="mercator")
"DistrictPolygons"

#' Spatial polygons for Chiefdom boundaries
#'
#' A SpatialPolygonsDataFrame containing the Chiefdom boundaries in Sierra Leone
#' Note that ROWCA=OCHA Regional Office for West and Central Africa.
#' Also note that the embedded data frame has been slightly modified to add two new fields.  The OCHAChiefdomName associates
#' Tasso Island with the Western Area Urban district and the East III chiefdom, to enable merging with Census and other sources.
#' The shapefile originally had Tasso Island associated with the Port Loko district, and its own separate chiefdom.
#'
#' @format The embedded data frame contains 167 rows (one per Chiefdom) and the following columns:
#' \describe{
#'  \item{OBJECTID_1}{}
#'  \item{OBJECTID}{}
#'  \item{admin3Name}{Chiefdom Name}
#'  \item{admin3Pcod}{Chiefdom Code/Identifier}
#'  \item{admin3RefN}{Chiefdom Reference Name}
#'  \item{admin2Name}{District Name}
#'  \item{admin2Pcod}{District Code/Identifier}
#'  \item{admin2RefN}{District Reference Name}
#'  \item{admin2AltN}{}
#'  \item{admin2Al_1}{}
#'  \item{admin1Name}{Province Name}
#'  \item{admin1Pcod}{Province Code}
#'  \item{admin0Name}{Nation name (Sierra Leone)}
#'  \item{admin0Pcod}{Nation FIPS code}
#'  \item{date}{Update date}
#'  \item{validOn}{Validity date}
#'  \item{ValidTo}{}
#'  \item{Shape_Leng}{}
#'  \item{Rowcacode0}{ROWCA Nation code = SLE}
#'  \item{Rowcacode1}{ROWCA Province code}
#'  \item{Rowcacode2}{ROWCA District code}
#'  \item{Shape_Le_1}{}
#'  \item{Shape_Area}{}
#'  \item{OCHAChiefdomName}{Recoded Chiefdom name used for merging with other data frames in the slreferencedata package}
#'  \item{District}{Recoded District name used for merging with other data frames in the slreferencedata package}
#'  \item{id}{Sequential ID to facilitate merging with fortified data frame}
#' }
#' @source \url{https://data.humdata.org/dataset/sierra-leone-all-ad-min-level-boundaries}
#' @usage
#' library(ggplot2)
#' library(dplyr)
#'
#' chiefdomPolyDf <- fortify(slreferencedata::ChiefdomPolygons)
#' chiefdomPolyDf <- left_join(chiefdomPolyDf, slreferencedata::ChiefdomPolygons@data) %>%
#'   left_join(slreferencedata::Census2015ByChiefdom %>% select(District, OCHAChiefdomName, TotalPopulation))
#'
#' ggplot(data=chiefdomPolyDf, aes(x=long, y=lat, group=group)) +
#'   geom_path(color="grey") +
#'   scale_fill_gradient(low = "#ffffcc", high = "#ff4444", space = "Lab", na.value = "grey50", guide = "colourbar", name="Population") +
#'   geom_polygon(aes(fill=TotalPopulation)) +
#'   coord_map(projection="mercator")
"ChiefdomPolygons"
