# check for, and install if needed, R packages
options(repos = c(CRAN = "https://cran.rstudio.com"))

pkgs <-
  c(
    "ggplot2",
    "knitr",
    "odbc",
    "phoenix",
    "reticulate",
    "rmarkdown",
    "RSQLite"
  )

for (p in pkgs) {
  if (require(package = p, character.only = TRUE, quietly = TRUE)) {
    message(sprintf("Loading required pacakge %s", p))
  } else {
    message(sprintf("Installing required package %s", p))
    install.packages(p)
    require(package = p, character.only = TRUE)
  }
}

stopifnot(packageVersion("phoenix") >= "1.1.0")
library(phoenix)


knitr::opts_chunk$set(collapse = TRUE)
library(reticulate)

#virtualenv_remove(envname = "phx_app_note", confirm = FALSE)

message("Checking for and setting up reticulate virtualenv phx_app_note")
if (!virtualenv_exists(envname = "phx_app_note")) {
  virtualenv_create(envname = "phx_app_note")
  virtualenv_install(envname = "phx_app_note", packages = c("numpy", "pandas", "phoenix-sepsis"))
}
use_virtualenv(virtualenv = "phx_app_note")
