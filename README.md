<!-- README.md is generated from README.Rmd. Please edit that file -->
throner
-------

The goal of throner is to ...

### Installation

``` r
devtools::install_github("martj42/throner")
#> Skipping install of 'throner' from a github remote, the SHA1 (8246ca01) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

### Usage

``` r
library(throner)
#> Loading required package: httr
```

The following functions are implemented:

-   `auth` : initialize necessary environment variables
-   `get_results` : receive results for selected competition
-   `get_fixtures` : receive fixtures available for prediction for selected competition
-   `submit_predictions` : submit your predictions for selected competition
-   `get_xp` : get your xp balance
