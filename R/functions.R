auth <- function(username, token) {
  key <<- c(`X-USERNAME` = username, `Authorization` = token)
  resp <- httr::GET("http://throne.ai/api/auth", httr::add_headers(.headers = key))
  jsonlite::fromJSON(rawToChar(resp$content))$result
}

get_xp <- function() {
  resp <- httr::GET("http://throne.ai/api/user/xp", httr::add_headers(.headers = key))
  jsonlite::fromJSON(rawToChar(resp$content))$result$xp
}

get_competitions <- function() {
  resp <- httr::GET("http://throne.ai/api/competition/data/names", httr::add_headers(.headers = key))
  jsonlite::fromJSON(rawToChar(resp$content))$result
}

get_results <- function(competition) {
  comp <- c(`X-COMPETITION-NAME` = competition)
  tmp <- tempfile()
  httr::GET("http://throne.ai/api/competition/data/historical/",
            httr::add_headers(.headers = c(key, comp)),
            httr::write_disk(tmp),
            httr::progress())
  file_name <- as.character(unzip(tmp, list = TRUE)$Name)
  data <- read.csv(unz(tmp, file_name), stringsAsFactors = F)
  unlink(tmp)
  return(data)
}

get_stats <- function(competition) {
  comp <- c(`X-COMPETITION-NAME` = competition)
  tmp <- tempfile()
  httr::GET("http://throne.ai/api/competition/data/gamestatistics/",
            httr::add_headers(.headers = c(key, comp)),
            httr::write_disk(tmp),
            httr::progress())
  file_name <- as.character(unzip(tmp, list = TRUE)$Name)
  data <- read.csv(unz(tmp, file_name), stringsAsFactors = F)
  unlink(tmp)
  return(data)
}

get_lineups <- function(competition) {
  comp <- c(`X-COMPETITION-NAME` = competition)
  tmp <- tempfile()
  httr::GET("http://throne.ai/api/competition/data/lineups/",
            httr::add_headers(.headers = c(key, comp)),
            httr::write_disk(tmp),
            httr::progress())
  file_name <- as.character(unzip(tmp, list = TRUE)$Name)
  data <- read.csv(unz(tmp, file_name), stringsAsFactors = F)
  unlink(tmp)
  return(data)
}

get_players <- function(competition) {
  comp <- c(`X-COMPETITION-NAME` = competition)
  resp <- httr::GET("http://throne.ai/api/competition/data/players/",
                    httr::add_headers(.headers = c(key, comp)))
  data <- jsonlite::fromJSON(rawToChar(resp$content))$result
}

get_fixtures <- function(competition) {
  comp <- c(`X-COMPETITION-NAME` = competition)
  tmp <- tempfile()
  httr::GET("http://throne.ai/api/competition/data/upcoming/",
            httr::add_headers(.headers = c(key, comp)),
            httr::write_disk(tmp))
  file_name <- as.character(unzip(tmp, list = TRUE)$Name)
  data <- read.csv(unz(tmp, file_name), stringsAsFactors = F)
  unlink(tmp)
  return(data)
}

submit_predictions <- function(predictions, competition){
  comp <- c(`X-COMPETITION-NAME` = competition)
  if ("team_tie_prob" %in% colnames(predictions)){
    cols <- c("id", "team_1_prob", "team_2_prob", "team_tie_prob", "confidence")
  } else {
    cols <- c("id", "team_1_prob", "team_2_prob", "confidence")
  }
  pred <- c(`X-PROB-SUBMISSION` = jsonlite::toJSON(predictions[,cols]))
  response <- httr::GET("http://throne.ai/api/competition/submit/",
                        httr::add_headers(.headers = c(key, comp, pred)))
  jsonlite::fromJSON(rawToChar(response$content))$result$success
}


