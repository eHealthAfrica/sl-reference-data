# R script to curl down, create, and munge (a bit) OCHA shapefiles for Sierra Leone district and chiefdom boundaries

library(rgdal)
library(utils)
library(devtools)

downloadShapefile <- function(url=NULL, dir=NULL, layerName) {
  unzipDir <- dir
  if (!is.null(url)) {
    unzipDir <- tempdir()
    shpFile <- paste0(tempfile(), '.zip')
    writeLines(shpFile)
    shpFileConn <- CFILE(shpFile, mode="wb")
    curlPerform(url=url, writedata = shpFileConn@ref)
    close(shpFileConn)
    unzip(shpFile, exdir=unzipDir)
  }
  readOGR(unzipDir, layerName)
}

DistrictPolygons <- downloadShapefile(
#  dir='/opt/data/Shapefiles/sle_admbnda_adm2_1m_gov_ocha/',
  url='https://data.humdata.org/dataset/a4816317-a913-4619-b1e9-d89e21c056b4/resource/b3963917-8550-478d-9363-736492bf209a/download/sle_admbnda_adm2_1m_gov_ocha.zip',
  layerName='sle_admbnda_adm2_1m_gov_ocha'
)

ChiefdomPolygons <- downloadShapefile(
#  dir='/opt/data/Shapefiles/sle_admbnda_adm3_1m_gov_ocha/',
  url='https://data.humdata.org/dataset/a4816317-a913-4619-b1e9-d89e21c056b4/resource/e2aa661d-af2f-42d8-bdea-c7e16a00bdb2/download/sle_admbnda_adm3_1m_gov_ocha.zip',
  layerName='sle_admbnda_adm3_1m_gov_ocha'
)

DistrictPolygons@data$id <- rownames(DistrictPolygons@data)
DistrictPolygons@data <- DistrictPolygons@data %>%
  mutate_if(is.factor, as.character)

ChiefdomPolygons@data$id <- rownames(ChiefdomPolygons@data)
ChiefdomPolygons@data <- ChiefdomPolygons@data %>%
  mutate(OCHAChiefdomName=as.character(admin3Name), District=as.character(admin2Name)) %>%
  mutate(District=case_when(.$OCHAChiefdomName=='Tasso Island' ~ 'Western Area Urban', TRUE ~ .$District),
         OCHAChiefdomName=case_when(.$OCHAChiefdomName=='Tasso Island' ~ 'East III', TRUE ~ .$OCHAChiefdomName)
  ) %>%
  mutate_if(is.factor, as.character)

use_data(DistrictPolygons, ChiefdomPolygons, overwrite=TRUE)
