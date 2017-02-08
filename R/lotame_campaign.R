#'@title Lotame Audiences
#'@description
#'This function returns a data frame of audiences for the requested client.
#'  
#'@export 
lotame_campaign <- function(campaign_id,
                            lookback_days = 0){
  options(scipen=999)
  path <- paste0("https://api.lotame.com/2/statistics/campaigns/",
                 campaign_id,
                 "&lookback_days=",
                 lookbook_days)
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket))
  return(req)
}