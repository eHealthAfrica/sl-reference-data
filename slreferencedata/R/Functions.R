#' This function recodes Chiefdom names as reported by the Sierra Leone census to those used by UN OCHA
#' @param df Data frame with columns for chiefdom name and district name
#' @param CensusChiefdomNameVariable The name of the column containing the census chiefdom name
#' @param DistrictVariable The name of the column containing the census district name
#' @return The data frame, with a new column (OCHAChiefdomName) added
#' @import tidyverse
#' @export
recodeCensusChiefdomToOCHA <- function(df, CensusChiefdomNameVariable, DistrictVariable, OCHAChiefdomVariable) {

  # a bit of a hack, but will work...
  if (any(c('temp___c', 'temp___d', 'temp___o') %in% colnames(df))) {
    stop('recodeCensusChiefdomToOCHA cannot accept a data frame arg with columns temp___c, temp___d, or temp___o')
  }

  mutate_(df, 'temp___c'=CensusChiefdomNameVariable, 'temp___d'=DistrictVariable) %>%
  mutate(temp___o=case_when(
    .$temp___c=='Kandu Lekpeama' ~ 'Kandu Leppiama',
    .$temp___c=='Kenema City' ~ 'Kenema Town',
    .$temp___c=='Koidu/New' ~ 'Koidu Town',
    .$temp___c=='Gbanti-Kamaranka' ~ 'Gbanti Kamarank',
    .$temp___c=='Gbendembu Ngowahun' ~ 'Gbendembu Ngowa',
    .$temp___c=='Magbaimba Ndorhahun' ~ 'Magbaimba Ndorh',
    .$temp___c=='Sanda Tendaren' ~ 'Sanda Tendaran',
    .$temp___c=='Tambakka' ~ 'Tambakha',
    .$temp___c=='Makeni City' ~ 'Makeni Town',
    .$temp___c=='Gbinle-Dixing' ~ 'Gbinle Dixing',
    .$temp___c=='Dembelia Sinkunia' ~ 'Dembelia - Sink',
    .$temp___c=='Follosaba Dembelia' ~ 'Folosaba Dembel',
    .$temp___c=='Wara Wara Bafodia' ~ 'Wara Wara Bafod',
    .$temp___c=='Wara Wara Yagala' ~ 'Wara Wara Yagal',
    .$temp___c=='BKM' ~ 'Bureh Kasseh Ma',
    .$temp___c=='Sanda Magbolontor' ~ 'Sanda Magbolont',
    .$temp___c=='Kafe Simira' ~ 'Kafe Simiria',
    .$temp___c=='Kolifa Rowalla' ~ 'Kholifa Rowala',
    .$temp___c=='Kunike Sanda' ~ 'Kunike',
    .$temp___c=='Bagbwe' ~ 'Bagbwe(Bagbe)',
    .$temp___c=='Baoma' ~ 'Boama',
    .$temp___c=='Bumpe Ngawo' ~ 'Bumpe Ngao',
    .$temp___c=='Jaiama-Bongor' ~ 'Jaiama Bongor',
    .$temp___c=='Wunde' ~ 'Wonde',
    .$temp___c=='Bo City' ~ 'Bo Town',
    .$temp___c=='Bendu Cha' ~ 'Bendu-Cha',
    .$temp___c=='Imperi' ~ 'Imperri',
    .$temp___c=='Kpanga Kemo' ~ 'Kpanda Kemo',
    .$temp___c=='Sogbini' ~ 'Sogbeni',
    .$temp___c=='Gallinas Peri' ~ 'Galliness Perri',
    .$temp___c=='Kpanga-Kabonde' ~ 'Panga Kabonde',
    .$temp___c=='Mano Sakrim' ~ 'Mono Sakrim',
    .$temp___c=='Panga Krim' ~ 'Panga krim',
    .$temp___c=='Pejeh' ~ 'Pejeh(Futa peje',
    .$temp___c=='Mountain' ~ 'Mountain Rural',
    .$temp___c=='Waterloo' ~ 'Waterloo Rural',
    .$temp___c=='Central 1' ~ 'Central I',
    .$temp___c=='Central 2' ~ 'Central II',
    .$temp___c=='East 1' ~ 'East I',
    .$temp___c=='East 2' ~ 'East II',
    .$temp___c=='East 3' ~ 'East III',
    .$temp___c=='West 1' ~ 'West I',
    .$temp___c=='West 2' ~ 'West II',
    .$temp___c=='West 3' ~ 'West III',
    .$temp___d=='Western Area Rural' & .$temp___c=='Koya' ~ 'Koya Rural',
    is.na(.$temp___c) ~ as.character(NA),
    TRUE ~ .$temp___c
  )) %>%
    rename_(.dots=setNames('temp___o', OCHAChiefdomVariable)) %>%
    select(-temp___c, -temp___d)

}
