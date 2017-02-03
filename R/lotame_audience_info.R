#'@title Lotame Audience Information
#'@description
#'This function returns a list containing the information for the requested audience.
#'  
#'@export 
lotame_audience_info <- function(audience_id){
    path <- paste0("https://api.lotame.com/2/audiences/",
                   audience_id)
    service_ticket <- lotame_service_ticket(path)
    req <- jsonlite::fromJSON(paste0(path,"?ticket=",service_ticket), flatten = T)
    return(req)
}
