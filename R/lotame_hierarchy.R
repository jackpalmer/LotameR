#'@title Lotame Hierachies
#'@description
#'This function returns a data frame of hierarchies for the requested client.
#'  
#'@export 
lotame_hierarchy <- function(hierarchy_id,
                             client_id,
                             depth = 0,
                             inc_stats = "true",
                             universe_id = 1){
  options(scipen=999)
  path <- paste0("https://api.lotame.com/2/hierarchies/",
                 hierarchy_id,
                 "?client_id=",
                 client_id,
                 "&depth=",
                 depth,
                 "&inc_stats=",
                 inc_stats,
                 "&universe_id=",
                 universe_id)
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket))
}