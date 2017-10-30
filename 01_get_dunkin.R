
## This function takes the packages that our program needs. 
## It makes sure you have them on your computer before proceeding.

source("check_packages.R")
check_packages(c("httr","XML","stringr","jsonlite", "maps"))

get_dunkin <- function(zip, matches=4000, radius=3000){
  
  url_part1 <- "https://www.mapquestapi.com/search/v2/radius?&key=Gmjtd%7Clu6t2luan5%252C72%253Do5-larsq&origin="
  url_part2 <- "&units=m&maxMatches="
  url_part3 <- "&ambiguities=ignore&radius="
  url_part4 <- "&hostedData=mqap.33454_DunkinDonuts&_=1479846828271"
  
  
  #Create directory, if it already exists then dont show warnings.
  # This eliminates the need for setwd
  # you can run my code and it will create these files whereever you store this data in
  dir.create("json/", showWarnings = FALSE)
  
  
  #Get the data
  #Write the data into a JSON file
  
  for (i in 1:length(zip)){
    url <- paste0(url_part1, zip[i], url_part2, matches[i], url_part3[i], radius[i], url_part4)
    
    d=GET(url)
    file = paste0("json/",zip[i],".json")
    write(content(d, as="text"), file=file)
    
  }
}


get_dunkin(zip)