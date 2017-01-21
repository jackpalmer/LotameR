#' Lotame Ticket
#'
#' This function generates a ticket generating ticket from the Lotame API.

lotame_ticket <- function(username,password){
  # Set variables
  body <- list(username = username, 
               password = password)
  # request ticket
  req <- POST(url = "https://crowdcontrol.lotame.com/auth/v1/tickets",
              body = body,
              encode = "form")
  # extract location
  location <- req$headers$location
}