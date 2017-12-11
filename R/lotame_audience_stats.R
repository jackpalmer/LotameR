#'@title Lotame Audience Stats
#'@description
#'This function returns a data frame of statistics for the requested audience
#'  
#'@export 
lotame_audience_stats <- function(client_id,
                                  client_as_group = TRUE,
                                  group = "audienceId",
                                  date_range = "LAST_30_DAYS",
                                  generate_stats = "now",
                                  device_graph = FALSE,
                                  page_count = 100,
                                  page_num = 1,
                                  sort_attr = "data_date",
                                  sort_order = "ASC"){
  options(scipen=999)
  path <- paste0("https://api.lotame.com/2/statistics/audiences?client_id=",
                 client_id,
                 "&group_by=",
                 group,
                 "&client_as_group=",
                 client_as_group,
                 "&date_range=",
                 date_range,
                 "&generate_stats=",
                 generate_stats,
                 "&device_graph=",
                 device_graph,
                 "&page_count=",
                 page_count,
                 "&page_num=",
                 page_num,
                 "&sort_attr=",
                 sort_attr,
                 "&sort_order=",
                 sort_order)
  service_ticket <- lotame_service_ticket(path)
  req <- jsonlite::fromJSON(paste0(path,"&ticket=",service_ticket))
  req <- req$audienceStatsReports %>%
    dplyr::mutate(referenceDataDate = lubridate::ymd(referenceDataDate),
                  startDataDate = lubridate::ymd(startDataDate),
                  endDataDate = lubridate::ymd(endDataDate),
                  pageViews = as.numeric(pageViews),
                  uniques = as.numeric(uniques),
                  deviceGraphTotalUniques = as.numeric(deviceGraphTotalUniques),
                  linkedUniques = as.numeric(linkedUniques),
                  unifiedUniques = as.numeric(unifiedUniques),
                  averageMonthlyUniques = as.numeric(averageMonthlyUniques),
                  linkedMonthlyUniques = as.numeric(linkedMonthlyUniques),
                  unifiedMonthlyUniques = as.numeric(unifiedMonthlyUniques),
                  averageDailyUsers = as.numeric(averageDailyUsers),
                  deviceGraphTotalAverageDailyUsers = as.numeric(deviceGraphTotalAverageDailyUsers)) %>%
    dplyr::select(-audienceStats)
  return(req)
}