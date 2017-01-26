#'@title Lotame Ticket Granting Ticket
#'@description
#'Generate a ticket granting ticket from the Lotame API, valid for 3 hours.
#'  
#'@export 
#'
#'@param  username Lotame username
#'
#'@return ticket granting ticket
lotame_ticket <- function(username,password){
  # Set variables
  body <- list(username = username, 
               password = password)
  # request ticket
  req <- httr::POST(url = "https://crowdcontrol.lotame.com/auth/v1/tickets",
                    body = body,
                    encode = "form")
  # extract location
  location <- req$headers$location
}