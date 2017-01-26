#'@title Lotame Service Ticket
#'@description
#'This function calls the Lotame API for the set path.
#'  
#'@export 
lotame_service_ticket <- function(call){
  # set service
  service <- list(service = call)
  # return service
  req <- httr::POST(url = ticket,
              body = service,
              encode = "form")
  service_ticket <- httr::content(req, "text")
}