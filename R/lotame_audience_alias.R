#' Lotame Behavior Alias
#'
#' This function calls the Lotame API.
#' 
lotame_behavior_alias <- function(audience_id){
    options(scipen=999)
    path <- paste0("https://api.lotame.com/2/behaviors/",
                   audience_id,
                   "/aliases")
    service_ticket <- lotame_service_ticket(path)
    req <- jsonlite::fromJSON(paste0(path,"?ticket=",service_ticket), flatten = T)
    return(req)
}
