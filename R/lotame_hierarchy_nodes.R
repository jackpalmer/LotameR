#'@title Lotame Hierachy Search
#'@description
#'This function returns a data frame of hierarchies for the search term.
#'  
#'@export 
lotame_hierarchies_nodes <- function(search_query,
                                     client_id,
                                     hierarchy_category = "STANDARD",
                                     date_range = "LAST_30_DAYS",
                                     universe_id = 1,
                                     page_size = 25000){
  options(scipen=999)
  path <- paste0("https://api.lotame.com/2/hierarchies/nodes?search=",
                 search_query,
                 "&client_id=",
                 client_id,
                 "&hierarchy_category=",
                 hierarchy_category,
                 "&date_range=",
                 date_range,
                 "&universe_id=",
                 universe_id,
                 "&page_size=",
                 page_size)
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket),flatten = T)
  output <- as.data.frame(req$groupings$hierarchies)
  result <- bind_rows(output$nodes)
}