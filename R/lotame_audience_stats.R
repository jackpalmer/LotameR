#' Lotame Audience Affinity
#'
#' This function calls the Lotame API.
#' 
audience_id = "208718"

lotame_audience_stats <- function(audience_id){
    path <- paste0("https://api.lotame.com/2/statistics/audiences/",
                   audience_id,
                   "?client_as_group=true&date_range=LAST_30_DAYS&generate_stats=now&device_graph=false&page_count=100&page_num=1&sort_attr=data_date&sort_order=ASC")
    service_ticket <- lotame_service_ticket(path)
    req <- fromJSON(paste0(path,"&ticket=",service_ticket))
    req <- req$audienceStatsReports
    return(req)
}

lotame_audience_stats_ranges <- function(audience_id){
  path <- paste0("https://api.lotame.com/2/statistics/audiences/",
                 audience_id,
                 "/ranges?universe_id=1&date_range=LAST_30_DAYS")
  service_ticket <- lotame_service_ticket(path)
  req <- fromJSON(paste0(path,"&ticket=",service_ticket))
  req <- req$audienceStatsForIntervals
  return(req)
}