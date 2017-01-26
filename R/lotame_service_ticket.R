#' Lotame Service Ticket
#'
#' This function generates a service ticket for the Lotame API using a path.
lotame_service_ticket <- function(call){
  # set service
  service <- list(service = call)
  # return service
  req <- POST(url = ticket,
              body = service,
              encode = "form")
  service_ticket <- content(req, "text")
}