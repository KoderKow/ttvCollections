#' Download Video Using youtube-dl
#'
#' Make sure youtube-dl is installed and set in the path variables!
#'
#' @param video_url A character. URL for the video to download.
#' @param prefix A character. Text to prefix the video title.
#'
#' @export
download_video <- function(video_url, prefix = NULL) {
  usethis::ui_info("Downloading {video_url}...")

  title <- "\"$title\""

  if (!is.null(prefix)) {
    title <- glue::glue("{prefix}-{title}")
  }

  shell_command <- glue::glue("youtube-dl -o \"$(echo {title}).%(ext)s\" -f best {dd$url[1]}")

  shell_response <- shell(shell_command)

  return(invisible(shell_response))
}


