clean_dunkin <- function(zip){
  
  data <- NULL
  for (i in 1:length(zip)){
    file <- paste0("data/",zip,".Rda")
    load(file)
    
    l <- lapply(j$searchResults, 
                function(x){
                  data.frame(
                    id = x$fields$recordid,
                    address = x$fields$address,
                    city = x$fields$city,
                    state =x$fields$state,
                    county=x$fields$county,
                    zipcode= x$fields$postal,
                    lat = x$fields$mqap_geography$latLng$lat,
                    long = x$fields$mqap_geography$latLng$lng,
                    wireless=x$fields$wireless, 
                    website=x$fields$website
                  )
                }
    )
    data_dd <- do.call("rbind", l)
    
    
    
  }
    data_dd = unique(data_dd)
    data_dd <- data_dd[which(data_dd$state %in% c("RI", "MA", "CT", "NH", "VT", "ME")),]
    
    save(data_dd, file = "data/Dunkin.Rda")
    
  
  
}

clean_dunkin(zip)
