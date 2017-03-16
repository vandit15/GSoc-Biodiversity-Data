format_gq.data.frame <- function(indf, source=NULL, config=NULL, verbose=FALSE, ...) {

  # Parse input object type
  gq_check_df(indf)

  # Mapping via 'source'
    if (!(verbose)) message("Mapping via individual parameters")
    new_fields = gq_parse_args(list(...))

  # Apply the transformation
  if (!(is.null(new_fields$decimalLatitude)) && new_fields$decimalLatitude != "decimalLatitude") {
    if (new_fields$decimalLatitude %in% names(indf)) {
      if ("decimalLatitude" %in% names(indf)) {
        names(indf)[names(indf)=="decimalLatitude"] <- "decimalLatitude::original"
        if (!(verbose)) message("Changed \"decimalLatitude\" to \"decimalLatitude::original\"")
      }
      names(indf)[names(indf)==new_fields$decimalLatitude] <- "decimalLatitude"
      if (!(verbose)) message(c("Changed \"",new_fields$decimalLatitude,"\" to \"decimalLatitude\""))
    }
  }
  if (!(is.null(new_fields$decimalLongitude)) && new_fields$decimalLongitude != "decimalLongitude") {
    if (new_fields$decimalLongitude %in% names(indf)) {
      if ("decimalLongitude" %in% names(indf)) {
        names(indf)[names(indf)=="decimalLongitude"] <- "decimalLongitude::original"
        if (!(verbose)) message("Changed \"decimalLongitude\" to \"decimalLongitude::original\"")
      }
      names(indf)[names(indf)==new_fields$decimalLongitude] <- "decimalLongitude"
      if (!(verbose)) message(c("Changed \"",new_fields$decimalLongitude,"\" to \"decimalLongitude\""))
    }
  }
  if (!(is.null(new_fields$countryCode)) && new_fields$countryCode != "countryCode") {
    if (new_fields$countryCode %in% names(indf)) {
      if ("countryCode" %in% names(indf)) {
        names(indf)[names(indf)=="countryCode"] <- "countryCode::original"
        if (!(verbose)) message("Changed \"countryCode\" to \"countryCode::original\"")
      }
      names(indf)[names(indf)==new_fields$countryCode] <- "countryCode"
      if (!(verbose)) message(c("Changed \"",new_fields$countryCode,"\" to \"countryCode\""))
    }
  }
  if (!(is.null(new_fields$scientificName)) && new_fields$scientificName != "scientificName") {
    if (new_fields$scientificName %in% names(indf)) {
      if ("scientificName" %in% names(indf)) {
        names(indf)[names(indf)=="scientificName"] <- "scientificName::original"
        if (!(verbose)) message("Changed \"scientificName\" to \"scientificName::original\"")
      }
      names(indf)[names(indf)==new_fields$scientificName] <- "scientificName"
      if (!(verbose)) message(c("Changed \"",new_fields$scientificName,"\" to \"scientificName\""))
    }
  }
  if (!(is.null(new_fields$year)) && new_fields$year != "year") {
    if (new_fields$year %in% names(indf)) {
      if ("year" %in% names(indf)) {
        names(indf)[names(indf)=="year"] <- "year::original"
        if (!(verbose)) message("Changed \"year\" to \"year::original\"")
      }
      names(indf)[names(indf)==new_fields$year] <- "year"
      if (!(verbose)) message(c("Changed \"",new_fields$year,"\" to \"year\""))
    }
  }
    if (!(is.null(new_fields$day)) && new_fields$day != "day") {
      if (new_fields$day %in% names(indf)) {
        if ("day" %in% names(indf)) {
          names(indf)[names(indf)=="day"] <- "day::original"
          if (!(verbose)) message("Changed \"day\" to \"day::original\"")
        }
        names(indf)[names(indf)==new_fields$day] <- "day"
        if (!(verbose)) message(c("Changed \"",new_fields$day,"\" to \"day\""))
      }
    }
    if (!(is.null(new_fields$month)) && new_fields$month != "month") {
      if (new_fields$month %in% names(indf)) {
        if ("month" %in% names(indf)) {
          names(indf)[names(indf)=="month"] <- "month::original"
          if (!(verbose)) message("Changed \"month\" to \"month::original\"")
        }
        names(indf)[names(indf)==new_fields$month] <- "month"
        if (!(verbose)) message(c("Changed \"",new_fields$month,"\" to \"month\""))
      }
    }

  return(indf)
}


gq_parse_args <- function(args) {
  gq_args = list()
  if ("decimalLatitude" %in% names(args)) {
    gq_args$decimalLatitude=args$decimalLatitude
  } else {
    gq_args$decimalLatitude=NULL
  }
  if ("decimalLongitude" %in% names(args)) {
    gq_args$decimalLongitude=args$decimalLongitude
  } else {
    gq_args$decimalLongitude=NULL
  }
  if ("countryCode" %in% names(args)) {
    gq_args$countryCode=args$countryCode
  } else {
    gq_args$countryCode=NULL
  }
  if ("scientificName" %in% names(args)) {
    gq_args$scientificName=args$scientificName
  } else {
    gq_args$scientificName=NULL
  }
  if ("year" %in% names(args)){

  } else {
    gq_args$year=NULL
  }
  if ("month" %in% names(args)){

  } else {
    gq_args$month=NULL
  }
  if ("day" %in% names(args)){

  } else {
    gq_args$day=NULL
  }
  return(gq_args)
}
