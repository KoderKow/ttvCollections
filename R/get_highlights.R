#' Extract A User's Highlights
#'
#' @param user_id A numeric. Twitch User ID to pull
#'
#' @return A tibble
#' @export
get_hightlights <- function(user_id = Sys.getenv("TWITCH_USER_ID")) {
  get_url <- glue::glue("https://api.twitch.tv/helix/videos?user_id={user_id}&type=highlight&first=100")

  r <- GET(get_url)

  rc <- content(r)

  d <- list()

  d[[1]] <- rc$data

  while(!is.null(rc$pagination$cursor)) {
    usethis:: ui
    get_url <- glue::glue("https://api.twitch.tv/helix/videos?user_id=27699280&type=highlight&first=100&after={qq_con$pagination$cursor}")
    r <- httr::GET(get_url)
    rc <- httr::content(r)
    d[[length(d) + 1]] <- rc$data
  }

  d <- bind_rows(d)

  return(d)
}
