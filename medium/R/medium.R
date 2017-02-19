#' function to retrieve occurence data of terrestial animals in Australia and apply GQ API
#'
#' @name occAM
#'
#' @title occurence data from GBIF datasets.
#'
#' @description function to retrieve occurence data of terrestial
#' animals in Australia and apply GQ API
#'
#' @param country (character) ISO 3166-1-alpha-2 code of a particular country to
#' get occurences of that country.Default:"AU"
#' @param classKey (integer) Key of a particular class(eg. animalia) according to
#' GBIF. Default:359
#' @param minimal (logical) False to get full set of fields for each record.
#' Default:FALSE
#'
#' @return a data frame with occurence data
#'
#' @author Vandit Jain
#' @export
occAM <- function(country = "AU",classKey=359,minimal=FALSE){
  #attaching the required packages
  library(rgeospatialquality)
  library(rgbif)
  library(plyr)

  # retrieving data using the rgbif package
  for(i in 0:9)
  {
    if(i==0){

        output<-occ_data(
          country=country,
          classKey=classKey,
          minimal=minimal,
          start=i,
          limit=500
      )
      dataset<-output$data
    }
    else{
      d<-occ_data(
        country=country,
        classKey=classKey,
        minimal=minimal,
        start=i,
        limit=500
      )
      dataset <- rbind.fill(dataset,d$data)
    }
  }

  #after filtering out occurences other than terrestrial animals
  dataset <- format_gq(dataset,source="rgbif")
  return(dataset)
}
