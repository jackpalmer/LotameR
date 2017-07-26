#'@title Lotame Client Interactions
#'@description
#'This function returns a data frame of all interactions types for a client.
#'  
#'@export 
lotame_client_interactions <- function(client_id){
  options(scipen=999)
  path <- paste0("https://api.lotame.com/2/campaigns/interactionTypes?client_id=",
                 client_id)
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket))
  return(req)
}