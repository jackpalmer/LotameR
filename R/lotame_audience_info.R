#' Lotame Audience Info
#'
#' This function calls the Lotame API.
#' 
lotame_audience_info <- function(audience_id){
    path <- paste0("https://api.lotame.com/2/audiences/",
                   audience_id)
    service_ticket <- lotame_service_ticket(path)
    req <- fromJSON(paste0(path,"?ticket=",service_ticket), flatten = T)
    return(req)
}
