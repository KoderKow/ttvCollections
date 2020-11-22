#' Get Auth Token
#'
#' Thanks to https://github.com/Freguglia/rTwitchAPI/blob/master/R/Utilities.R for getting me started!
#'
#' @param client_id A character. Twitch App ID.
#' @param client_secret A character. Twitch App Secret.
#'
#' @return Invisible authorization data.
#' @export
twitch_auth <- function(
  client_id = Sys.getenv("TWITCH_CLIENT_ID"),
  client_secret = Sys.getenv("TWITCH_SECRET")
) {

  if (assertthat::are_equal(client_id, "") | assertthat::are_equal(client_secret, "") | assertthat::are_equal(client_id, NULL) | assertthat::are_equal(client_secret, NULL)) {
    usethis::ui_stop("{usethis::ui_value('client_id')} and {usethis::ui_value('client_secret')} need to set.")
  }

  query_list <- list(
    client_id = client_id,
    client_secret = client_secret,
    grant_type = "client_credentials"
  )

  pc <-
    httr::POST(
      url = "https://id.twitch.tv/oauth2/token",
      query = query_list
    ) %>%
    httr::content()

  httr::add_headers(
    'Client-ID' = client_id,
    Authorization = paste0("Bearer ", pc$access_token)
  ) %>%
    httr::set_config()

  result <- list(
    client_id = client_id,
    authorization = pc$access_token,
    authorization_formatted = paste0("Bearer ", pc$access_token),
    expires_in = pc$expires_in
  )

  return(invisible(result))
}
