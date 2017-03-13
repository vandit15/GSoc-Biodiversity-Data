require(data.table)
require(dplyr)
require(uuid)
require(digest)
require(httr)
require(xml2)


getDwCTerms = function() {
  dwctermsPage = httr::GET("http://rs.tdwg.org/dwc/terms/index.htm")
  DwCTerms<-xml2::xml_text(xml2::xml_find_all(x=xml2::read_html(dwctermsPage), xpath='//p//a'))
  #removing irrelevent terms
  DwCTerms <- DwCTerms[3:197]
  #DwCTerms <<- DwCTerms[-which(DwCTerms == "")]
  naindices <- which(DwCTerms == "")
  print(naindices)
  previ <- 0
  termslist  <- list()
  for(i in naindices){
    termslist <- c(termslist,list(DwCTerms[previ+1:i-1]))
    previ <- i
  }
  termslist <- list(termslist,list(DwCTerms[i+1:length(DwCTerms)]))

  return(termslist)
}
