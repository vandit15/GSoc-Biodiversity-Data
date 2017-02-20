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
          limit=500,
          hasCoordinate = TRUE
      )
      dataset<-output$data
    }
    else{
      d<-occ_data(
        country=country,
        classKey=classKey,
        minimal=minimal,
        start=i,
        limit=500,
        hasCoordinate = TRUE
      )
      dataset <- rbind.fill(dataset,d$data)
    }
  }
  #applying GQ API to add flags (taking 1000 at a time beacuse
  #of the constraint of the function)
  dataset <- format_gq(dataset,source="rgbif")
  for(i in 0:4){
    if(i==0){
      print(dim(dataset))
      datasetflags <- add_flags(dataset[(i*1000+1):(i*1000+1000),])
      print(dim(datasetflags))
      flags <- datasetflags$flags
      d <- datasetflags[,1:ncol(datasetflags)-1]
    }
    else{
      tempdatasetflags <- add_flags(dataset[(i*1000+1):(i*1000+1000),])
      print(dim(tempdatasetflags))
      tempflags <- tempdatasetflags$flags
      tempdataset <- tempdatasetflags[,1:ncol(tempdatasetflags)-1]
      flags <- rbind.fill(flags,tempflags)
      d <- rbind.fill(d,tempdataset)
    }
  }
  d$flags <- as.data.frame(flags)
  return(d)
}
