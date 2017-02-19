#GSoC - Integrating biodiversity data curation functionality
#
#Author -Vandit Jain

#attaching packages
library(rgbif)
library(rgeospatialquality)
library(curl)

#reading data
data <- read.table("0058701-160910150852091.csv",sep="\t",header = TRUE)
data <- data[1:500,]  #slicing to first 500 rows
dataflags <- add_flags(data) #applying GQ API using rgeospatialquality package
