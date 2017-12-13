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

``` r
library(throner)
```

The following functions are implemented:

-   `auth` : initialize necessary environment variables
-   `get_results` : receive results for selected competition
-   `get_fixtures` : receive fixtures available for prediction for selected competition
-   `submit_predictions` : submit your predictions for selected competition
-   `get_xp` : get your xp balance

Please note that due to throttling limits you should SAVE your historical and competition data rather than reloading from Throne servers each time you run a script or a notebook.
