Overview
--------

This package exposes some data frames (datasets) and shapefile objects useful for providing context to analyses of Sierra Leone.  These objects are:

* _Census2015ByDistrict:_ Data frame with one row per district, and columns containing selected variables from Sierra Leone's 2015 Census
* _Census2015ByChiefdom:_ Data frame with one row per chiefdom, and columns containing selected variables from Sierra Leone's 2015 Census
* _EbolaCasesWHO:_ Data frame with data concerning the 2014-2016 Ebola outbreak from situation reports and patient database, compiled by the World Health Organization
* _DistrictPolygons:_ A SpatialPolygonsDataFrame with Sierra Leone district boundaries
* _ChiefdomPolygons:_ A SpatialPolygonsDataFrame with Sierra Leone chiefdom boundaries

Installation
------------

The package is not available on CRAN, so you need to install it directly from GitHub.

``` r
# install.packages("devtools")
devtools::install_github("eHealthAfrica/sl-reference-data/slreferencedata")
```

Usage
-----

See roxygen package documentation included with the package for detailed usage information, variable definitions, and sourcing.
