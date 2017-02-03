#'@title Lotame Audiences
#'@description
#'This function returns a data frame of audiences for the requested client.
#'  
#'@export 
lotame_audiences <- function(client_id){
  path <- paste0("https://api.lotame.com/2/audiences?client_id=",client_id)
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket))
  audiences <- req$Audience
}