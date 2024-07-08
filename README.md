# phoenix: An R package and Python module for calculating the Phoenix Pediatric Sepsis Score and Criteria

The source code needed to build the manuscript.

Cite the article:

Peter E DeWitt, Seth Russell, Margaret N Rebull, L Nelson Sanchez-Pinto, Tellen
D Bennett, phoenix: an R package and Python module for calculating the Phoenix
pediatric sepsis score and criteria, JAMIA Open, Volume 7, Issue 3, October
2024, ooae066, https://doi.org/10.1093/jamiaopen/ooae066

The files, and history, provided in this repository is limited to what is needed
for the published version only.

## How to build the documents

* System dependencies:
  * [quarto](https://quarto.org/)
  * [R](https://cran.r-project.org/)
  * [GNU make](https://www.gnu.org/software/make/)
  * [latexmk](https://ctan.org/pkg/latexmk)
  * [latexdiff](https://ctan.org/pkg/latexdiff?lang=en)

The application note and supplemental file can be built by calling

    make

This will check for needed R packages (see `setup.R`) and build the appliation
note and supplemental file.
