#'@title Lotame Campaigns
#'@description
#'This function returns a data frame of campaigns for the requested client.
#'  
#'@export 
lotame_campaigns <- function(client_id){
  options(scipen=999)
  path <- paste0("https://api.lotame.com/2/campaigns?client_id=",
                 client_id,
                 "&campaignType=CAMPAIGNS_WITH_STATS&timeFilter=PRESENT&page_count=50&page_num=1&sort_order=ASC&sort_attr=id")
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket))
  return(req)
}