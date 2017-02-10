#'@title Lotame Hierachies
#'@description
#'This function returns a data frame of hierarchies for the requested client.
#'  
#'@export 
lotame_hierarchies <- function(client_id){
  options(scipen=999)
  path <- paste0("https://api.lotame.com/2/hierarchies?client_id=",
                 client_id)
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket))
  hierarchies <- req$hierarchies
}