#' function to retrieve occurence data of terrestial animals in Australia and apply GQ API
#' 
#' @name occTAA
#' 
#' @title occurence data from GBIF datasets 
#' 
#' @description function to retrieve occurence data of terrestial 
#' animals in Australia and apply GQ API
#' 
#' @param country (character)ISO 3166-1-alpha-2 code of a particular country to get occurences of that country
#' @param classKey (numeric)Key of a particular class(eg. animalia) according to GBIF
#' @param minimal (logical)False to get full set of fileds for each record.   
#' 
#' @return a data frame with occurence along with list type element called flags
#' 
#' @author Vandit Jain
#' 
#' @example
#' dataflags <- occTMA()
occTAA <- function(country = "AU",classKey=359,minimal=FALSE){
  #attaching the required packages
  library(rgeospatialquality)
  library(rgbif)
  
  # retrieving data using the rgbif package
  d <- occ_data(
    country=country,
    classKey=classKey,
    minimal=minimal
  )
  
  #after filtering out occurences other than terrestrial animals
  dataflags <- add_flags(d$data)  # applying the GQ API using the rgeospatiality package
}
