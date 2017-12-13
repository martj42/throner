auth <- function(username, token) {
    key <<- c(`X-USERNAME` = username, `Authorization` = token)
    resp <- GET("http://throne.ai/api/auth", add_headers(.headers = key))
    jsonlite::fromJSON(rawToChar(resp$content))$result
}

get_xp <- function() {
    resp <- GET("http://throne.ai/api/user/xp", add_headers(.headers = key))
    jsonlite::fromJSON(rawToChar(resp$content))$result$xp
}

get_results <- function(competition) {
    comp <- c(`X-COMPETITION-NAME` = competition)
    tmp <- tempfile()
    GET("http://throne.ai/api/competition/data/historical/", add_headers(.headers = c(key,
        comp)), write_disk(tmp), progress())
    file_name <- as.character(unzip(tmp, list = TRUE)$Name)
    data <- read.table(unz(tmp, file_name), header = T, sep = ",", stringsAsFactors = F)
    unlink(tmp)
    return(data)
}

get_fixtures <- function(competition) {
    comp <- c(`X-COMPETITION-NAME` = competition)
    tmp <- tempfile()
    GET("http://throne.ai/api/competition/data/upcoming/", add_headers(.headers = c(key,
        comp)), write_disk(tmp))
    file_name <- as.character(unzip(tmp, list = TRUE)$Name)
    data <- read.table(unz(tmp, file_name), header = T, sep = ",", stringsAsFactors = F)
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
  response <- GET("http://throne.ai/api/competition/submit/", add_headers(.headers = c(key, comp, pred)))
  jsonlite::fromJSON(rawToChar(response$content))$result$success
}
