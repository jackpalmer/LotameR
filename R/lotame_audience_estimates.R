#' Lotame Audience Reach Estimate
#'
#' This function calls the Lotame API.
#' 
lotame_audience_reachestimate <- function(estimate_id){
    path <- paste0("https://api.lotame.com/2/audiences/reachEstimates/",
                   estimate_id)
    service_ticket <- lotame_service_ticket(path)
    req <- fromJSON(paste0(path,"?ticket=",service_ticket), flatten = T)
    return(req)
}
