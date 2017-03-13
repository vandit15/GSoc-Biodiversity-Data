require(data.table)
require(dplyr)
require(uuid)
require(digest)
require(httr)
require(xml2)


getDwCTerms = function() {
  dwctermsPage = httr::GET("http://rs.tdwg.org/dwc/terms/index.htm")
    DwCTerms<-xml2::xml_text(xml2::xml_find_all(x=xml2::read_html(dwctermsPage), xpath='//p//a'))

}
