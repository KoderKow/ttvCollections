
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ttvCollections

<!-- badges: start -->

<!-- badges: end -->

The goal of ttvCollections is to download our highlights\! This may turn
into a separate package focusing on being a R wrapper for the Twitch
API.

## Installation

  - Make sure [youtube-dl](http://ytdl-org.github.io/youtube-dl/) is
    installed
  - Download from here with
    `remotes::install_github("koderkow/ttvCollections")`

## Envirnment Variables

There are three environment variables that are default values to
function parameters. Set in .Renviron with `usethis::edit_r_environ()`.

  - TWITCH\_CLIENT\_ID
  - TWITCH\_SECRET
  - TWITCH\_USER\_ID

## Sample code

### Auth

``` r
library(ttvCollections)

twitch_auth()
```

### Extract Highlights

``` r
d <- get_hightlights()

d
#> # A tibble: 382 x 14
#>    id    user_id user_name title description created_at published_at url  
#>    <chr> <chr>   <chr>     <chr> <chr>       <chr>      <chr>        <chr>
#>  1 8110~ 276992~ KoderKow  High~ Kyle gets ~ 2020-11-2~ 2020-11-21T~ http~
#>  2 8110~ 276992~ KoderKow  High~ Debby goes~ 2020-11-2~ 2020-11-21T~ http~
#>  3 8110~ 276992~ KoderKow  High~ Kyle dips ~ 2020-11-2~ 2020-11-21T~ http~
#>  4 8110~ 276992~ KoderKow  High~ We really ~ 2020-11-2~ 2020-11-21T~ http~
#>  5 8110~ 276992~ KoderKow  High~ Kyle gets ~ 2020-11-2~ 2020-11-21T~ http~
#>  6 8110~ 276992~ KoderKow  High~ You alread~ 2020-11-2~ 2020-11-21T~ http~
#>  7 8110~ 276992~ KoderKow  High~ We actuall~ 2020-11-2~ 2020-11-21T~ http~
#>  8 8110~ 276992~ KoderKow  High~ Kyle leave~ 2020-11-2~ 2020-11-21T~ http~
#>  9 8110~ 276992~ KoderKow  High~ Kyle conso~ 2020-11-2~ 2020-11-21T~ http~
#> 10 8110~ 276992~ KoderKow  High~ We see the~ 2020-11-2~ 2020-11-21T~ http~
#> # ... with 372 more rows, and 6 more variables: thumbnail_url <chr>,
#> #   viewable <chr>, view_count <int>, language <chr>, type <chr>,
#> #   duration <chr>
```

### Download a Hightlight

``` r
urls <- d$url

download_video(urls[5], "sample-prefix")
#> i Downloading https://www.twitch.tv/videos/811005896...
#> √ Done!
```
