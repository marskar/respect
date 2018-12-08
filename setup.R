#' ---
#' title: "How to set up a project"
#' author: "Martin Skarzynki"
#' date: "`r Sys.Date()`"
#' ---
#'

#' # Step 1: Create a package/project

#' ### Install `usethis` if not already installed
if (!require(usethis)) install.packages('usethis')

#' ### Create a new package called `respect`
#'
#' `usethis::create_package('respect')`
#'
#' New project will open, copy this script there
#'
#' # Step 2: Set up version control and GitHub
#'
#' ### Set up git
use_git()

#' Git pane in RStudio is available after a restart
#'
#' Pull and Push are unavailable for now
#'
#' ### Set up git user.name and user.email
#'
#' `use_git_config(user.name = "Jane Doe", user.email = "jane@example.com")`
use_git_config()

#' ### Get a GitHub Personal Access Token (PAT)
#'
#' `browse_github_pat()`
#'
#' ### Add the PAT to .Renviron,
#' e.g. GITHUB_PAT=8c70fd8419398999c9ac5bacf3192882193cadf2
#'
#' `edit_r_environ()`
#'
#' ### Edit the DESCRIPTION file
#'
#' ### View DESCRIPTION defaults
use_description_defaults()

#' ### Edit DESCRIPTION title, name, and description
use_description(
  fields = list(Title = "Code and Docs that Respect People",
                `Authors@R` = 'person("Martin", "Skarzynski", email = "marskar@gmail.com", role = c("aut", "cre"))',
                Description = 'This R Package demonstrates examples of best practices that can save time and make life easier for you, future you, and others.'
))

#' ### Add a license, e.g. MIT
use_mit_license(name = 'Martin Skarzynski')

#' ### Connect to github
usethis::use_github(protocol = 'https')

#' Check github to see your DESCRIPTION there
#'
#' ### Add a readme
use_readme_md()

#' ### Use terminal or RStudio git integration to push remaining files to GitHub
#' - Open up the Review Changes window: Ctrl+Alt+M
#' - Space or Enter to stage
#' - Tab twice to start writing commit message
#' - Windows/Linux: Ctrl+Enter to commit
#' - Mac: Command+Enter to commit
#'
#' Optional: setup github pages and add link to description
#'
#' # Step 3: Write R code or move exist scripts to R folder
#'
#' ### Create an R script in the R/ folder
use_r('respect')

#' ### Use RStudio shortcut to add Roxygen skeleton
#' - Windows/Linux: Ctrl+Shift+Alt+R
#' - Mac: Cmd+Shift+Alt+R
#' - [All shortcuts](https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts)
#' Fill in @param, @return, and add at least one example under @examples

#' # Step 4: Document functions with roxygen2 or devtools
if (!require(devtools)) install.packages('devtools')
