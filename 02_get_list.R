library(jsonlite)
create_list <- function(zip){
  
  #Create directory, if it already exists then dont show warnings.
  # This eliminates the need for setwd
  # you can run my code and it will create these files whereever you store this data in
  dir.create("data/", showWarnings = FALSE)
  
  
  #Take the same zip codes used before
  # read the json file in.
  # export out into rda format
  for (i in 1:length(zip)){
    file = paste0("json/",zip[i],".json")
    file
    dd <- readLines(file)
    
    
    j = fromJSON(dd, simplifyDataFrame=FALSE)
    
    outfile <- paste0("data/",zip[i],".rda")
    save(j, file=outfile)
    
  }
}

create_list(zip)