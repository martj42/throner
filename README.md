<!-- README.md is generated from README.Rmd. Please edit that file -->
throner
-------

The goal of throner is to ...

### Installation

``` r
devtools::install_github("martj42/throner")
#> Downloading GitHub repo martj42/throner@master
#> from URL https://api.github.com/repos/martj42/throner/zipball/master
#> Installing throner
#> "C:/PROGRA~1/R/R-34~1.3/bin/x64/R" --no-site-file --no-environ --no-save  \
#>   --no-restore --quiet CMD INSTALL  \
#>   "C:/Users/John/AppData/Local/Temp/RtmpANJ9LW/devtools7806ec17ddc/martj42-throner-9322926"  \
#>   --library="C:/Users/John/Documents/R/win-library/3.4" --install-tests
#> 
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
