#'@title Lotame Audience Affinity
#'@description
#'This function generates a data frame of the affinities for the requested audience.
#'  
#'@export 
lotame_audience_affinity <- function(audience_id,
                                     with_counts = "false",
                                     min_uniques = 1000,
                                     min_index = 0,
                                     max_index = 10000000,
                                     min_affinity = 0,
                                     max_affinity = 100,
                                     min_client_index = 0,
                                     max_client_index = 10000000,
                                     with_prices = "true",
                                     page_count = 5000, 
                                     page_num = 1, 
                                     sort_attr = "index30",
                                     sort_order = "DESC",
                                     paginate_query = FALSE){
  if (paginate_query != T) {
    path <- paste0("https://api.lotame.com/2/statistics/audiences/",
                   audience_id,
                   "/affinity?with_counts=",
                   with_counts,
                   "&min_uniques=",
                   min_uniques,
                   "&min_affinity=",
                   min_affinity,
                   "&max_affinity=",
                   max_affinity,
                   "&min_index=",
                   min_index,
                   "&max_index=",
                   max_index,
                   "&min_client_index=",
                   min_client_index,
                   "&max_client_index=",
                   max_client_index,
                   "&with_prices=",
                   with_prices,
                   "&page_count=",
                   page_count,
                   "&page_num=",
                   page_num,
                   "&sort_attr=",
                   sort_attr,
                   "&sort_order=",
                   sort_order)
    service_ticket <- lotame_service_ticket(path)
    req <- fromJSON(paste0(path,"&ticket=",service_ticket))
    affinities <- req$audienceAffinities
    affinities$audienceId <- req$audienceId
    affinities$audienceName <- req$audienceName
    return(affinities)
  } else if (paginate_query == T) {
    d <- NULL
    path <- paste0("https://api.lotame.com/2/statistics/audiences/",
                   audience_id,
                   "/affinity?with_counts=",
                   with_counts,
                   "&min_uniques=",
                   min_uniques,
                   "&min_affinity=",
                   min_affinity,
                   "&max_affinity=",
                   max_affinity,
                   "&min_index=",
                   min_index,
                   "&max_index=",
                   max_index,
                   "&min_client_index=",
                   min_client_index,
                   "&max_client_index=",
                   max_client_index,
                   "&with_prices=",
                   with_prices,
                   "&page_count=",
                   page_count,
                   "&page_num=",
                   page_num,
                   "&sort_attr=",
                   sort_attr,
                   "&sort_order=",
                   sort_order)
    service_ticket <- lotame_service_ticket(path)
    req <- fromJSON(paste0(path,"&ticket=",service_ticket))
    affinities <- req$audienceAffinities
    affinities$audienceId <- req$audienceId
    affinities$audienceName <- req$audienceName
    d <- rbind(d,affinities)
    x <- as.numeric(nrow(d))
    y <- as.numeric(req$totalCount)
    while(x < y){
      if(y == 0) next
      page_num <- page_num + 1
      path <- paste0("https://api.lotame.com/2/statistics/audiences/",
                     audience_id,
                     "/affinity?with_counts=",
                     with_counts,
                     "&min_uniques=",
                     min_uniques,
                     "&min_affinity=",
                     min_affinity,
                     "&max_affinity=",
                     max_affinity,
                     "&min_index=",
                     min_index,
                     "&max_index=",
                     max_index,
                     "&min_client_index=",
                     min_client_index,
                     "&max_client_index=",
                     max_client_index,
                     "&with_prices=",
                     with_prices,
                     "&page_count=",
                     page_count,
                     "&page_num=",
                     page_num,
                     "&sort_attr=",
                     sort_attr,
                     "&sort_order=",
                     sort_order)
      service_ticket <- lotame_service_ticket(path)
      req <- fromJSON(paste0(path,"&ticket=",service_ticket))
      affinities <- req$audienceAffinities
      affinities$audienceId <- req$audienceId
      affinities$audienceName <- req$audienceName
      d <- rbind(d,affinities)
      x <- nrow(d)
      Sys.sleep(1)
    }
    return(d)
  }  
}