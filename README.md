<!-- README.md is generated from README.Rmd. Please edit that file -->
throner
-------

[![Travis-CI Build Status](https://travis-ci.org/martj42/throner.svg?branch=master)](https://travis-ci.org/martj42/throner)

Throner is an R API wrapper for Throne.ai sports prediction contests.

### Installation

``` r
devtools::install_github("martj42/throner")
```

### Usage

The following functions are implemented:

-   `auth` : initialize necessary environment variables
-   `get_results` : receive results for selected competition
-   `get_fixtures` : receive fixtures available for prediction for selected competition
-   `submit_predictions` : submit your predictions for selected competition
-   `get_xp` : get your xp balance

``` r
library(throner)

auth("martj42", "f08dfrh2-we21-4520-b000-b49a0f4h4aea")

epl_results <- get_results("English Premier League")

epl_fixtures <- get_fixtures("English Premier League")

epl_predictions <- your_awesome_model(epl_fixtures)

submit_predictions(epl_predictions, "English Premier League")
```

Please note that due to throttling limits you should SAVE your historical and competition data rather than reloading from Throne servers each time you run a script or a notebook.
