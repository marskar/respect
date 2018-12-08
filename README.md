The steps I followed to create this project/package are detailed in [this gist](https://gist.github.com/marskar/ce0e2277733313afb1cc8ccfccab2bb2) and below.

# Step 1: Create a package/project

### Install `usethis` if not already installed


```r
if (!require(usethis)) install.packages('usethis')
```

```
## Loading required package: usethis
```


### Create a new package called `respect`

```r
usethis::create_package('respect')
```

New project will open, copy this script there

# Step 2: Set up version control and GitHub

### Set up git


```r
usethis::use_git()
```

```
## ✔ Setting active project to '/Users/skarzynskimw/respect'
```


Git pane in RStudio is available after a restart

Pull and Push are unavailable for now

### Set up git user.name and user.email

```r
usethis::use_git_config(user.name = "Martin Skarzynski", user.email = "myemail@example.com")
```


```r
usethis::use_git_config()
```

```
## $user.name
## [1] "Martin Skarzynski"
## 
## $user.email
## [1] "marskar@gmail.com"
```


### Get a GitHub Personal Access Token (PAT)

```r
usethis::browse_github_pat()
```

### Add the PAT to .Renviron,
e.g. GITHUB_PAT=8c70fd8419398999c9ac5bacf3192882193cadf2

```r
usethis::edit_r_environ()
```

### Edit the DESCRIPTION file

### View DESCRIPTION defaults


```r
usethis::use_description_defaults()
```

```
## $usethis.description
## NULL
## 
## $devtools.desc
## NULL
## 
## $usethis
## $usethis$Package
## [1] "valid.package.name.goes.here"
## 
## $usethis$Version
## [1] "0.0.0.9000"
## 
## $usethis$Title
## [1] "What the Package Does (One Line, Title Case)"
## 
## $usethis$Description
## [1] "What the package does (one paragraph)."
## 
## $usethis$`Authors@R`
## [1] "person(\"First\", \"Last\", , \"first.last@example.com\", c(\"aut\", \"cre\"))"
## 
## $usethis$License
## [1] "What license it uses"
## 
## $usethis$Encoding
## [1] "UTF-8"
## 
## $usethis$LazyData
## [1] "true"
```


### Edit DESCRIPTION title, name, and description


```r
usethis::use_description(
  fields = list(Title = "Code and Docs that Respect People",
                `Authors@R` = 'person("Martin", "Skarzynski", email = "marskar@gmail.com", role = c("aut", "cre"))',
                Description = 'This R Package demonstrates examples of best practices. It can save time and make life easier for you, future you, and others.',
                Suggests = 'testthat'
))
```

```
## ✔ Leaving '/Users/skarzynskimw/respect/DESCRIPTION' unchanged
```

### Add a license, e.g. MIT


```r
usethis::use_mit_license(name = 'Martin Skarzynski')
```


### Connect to github


```r
usethis::use_github(protocol = 'https')
```

```
## ✔ GitHub is already initialized
```


Check github to see your DESCRIPTION there

### Add a readme


```r
usethis::use_readme_md()
```


### Use terminal or RStudio git integration to push remaining files to GitHub
- Open up the Review Changes window: Ctrl+Alt+M
- Space or Enter to stage
- Tab twice to start writing commit message
- Windows/Linux: Ctrl+Enter to commit
- Mac: Command+Enter to commit

Optional: setup github pages and add link to description

# Step 3: Write R code or move exist scripts to R folder

### Create an R script in the R/ folder


```r
usethis::use_r('respect')
```

```
## ● Edit R/respect.R
```


### Use RStudio shortcut to add Roxygen skeleton
- Windows/Linux: Ctrl+Shift+Alt+R
- Mac: Cmd+Shift+Alt+R
- [All shortcuts](https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts)
Fill in @param, @return, and add at least one example under @examples

# Step 4: Document functions with roxygen2 or devtools

### Install `devtools` if not already installed


```r
if (!require(devtools)) install.packages('devtools')
```

```
## Loading required package: devtools
```

### Update NAMESPACE and create a `man` directory with an `.Rd` file for each function


```r
devtools::document()
```

```
## Updating respect documentation
```

```
## Writing NAMESPACE
```

```
## Loading respect
```

```
## Writing NAMESPACE
```


# Step 5: Create unit tests to make sure your code works
### Install `testhat` if not already installed


```r
if (!require(testthat)) install.packages('testthat')
```

```
## Loading required package: testthat
```

```
## 
## Attaching package: 'testthat'
```

```
## The following objects are masked from 'package:devtools':
## 
##     setup, test_file
```

### Create `testhat` infrastructure


```r
usethis::use_testthat()
```

### Create a `testhat` unit test


```r
usethis::use_test('respect')
```

### Run the test suite (ok, it's just one test)


```r
devtools::test()
```

```
## Loading respect
```

```
## Testing respect
```

```
## ✔ | OK F W S | Context
## 
⠏ |  0       | test-respect[1] "I respect you"
## 
⠋ |  1       | test-respect
✔ |  1       | test-respect
## 
## ══ Results ═════════════════════════════════════════════════════════════════════════════════
## OK:       1
## Failed:   0
## Warnings: 0
## Skipped:  0
```


# Step 6: Check if package is ready to share


```r
devtools::check()
```

```
## Updating respect documentation
```

```
## Writing NAMESPACE
```

```
## Loading respect
```

```
## Writing NAMESPACE
## ── Building ───────────────────────────────────────────────────────────────────── respect ──
## Setting env vars:
## ● CFLAGS    : -Wall -pedantic
## ● CXXFLAGS  : -Wall -pedantic
## ● CXX11FLAGS: -Wall -pedantic
## ────────────────────────────────────────────────────────────────────────────────────────────
##   
   checking for file ‘/Users/skarzynskimw/respect/DESCRIPTION’ ...
  
✔  checking for file ‘/Users/skarzynskimw/respect/DESCRIPTION’
## 
  
─  preparing ‘respect’:
## 
  
   checking DESCRIPTION meta-information ...
  
✔  checking DESCRIPTION meta-information
## 
  
─  installing the package to build vignettes
## 
  
   creating vignettes ...
  
✔  creating vignettes (1.6s)
## 
  
─  checking for LF line-endings in source and make files and shell scripts
## 
  
─  checking for empty or unneeded directories
## 
  
─  building ‘respect_0.0.0.9000.tar.gz’
## 
  
   Warning: invalid uid value replaced by that for user 'nobody'
##    Warning: invalid gid value replaced by that for user 'nobody'
## 
  
   
## 
── Checking ───────────────────────────────────────────────────────────────────── respect ──
## Setting env vars:
## ● _R_CHECK_CRAN_INCOMING_REMOTE_: FALSE
## ● _R_CHECK_CRAN_INCOMING_       : FALSE
## ● _R_CHECK_FORCE_SUGGESTS_      : FALSE
## ── R CMD check ────────────────────────────────────────────────────────────
##   
─  using log directory ‘/private/var/folders/wl/k3pxrjzj7z772c_67q0m17m9kf8fvq/T/RtmpKNdmIU/respect.Rcheck’
## 
  
─  using R version 3.5.1 (2018-07-02)
## ─  using platform: x86_64-apple-darwin15.6.0 (64-bit)
## ─  using session charset: UTF-8
## 
  
─  using options ‘--no-manual --as-cran’
## 
  
   checking for file ‘respect/DESCRIPTION’ ...
  
✔  checking for file ‘respect/DESCRIPTION’
## ─  this is package ‘respect’ version ‘0.0.0.9000’
## ─  package encoding: UTF-8
## 
  
✔  checking package namespace information
##    checking package dependencies ...
  
✔  checking package dependencies (2.7s)
## 
  
✔  checking if this is a source package
## ✔  checking if there is a namespace
## 
  
   checking for executable files ...
  
✔  checking for executable files
## 
  
✔  checking for hidden files and directories
##    checking for portable file names ...
  
✔  checking for portable file names
## ✔  checking for sufficient/correct file permissions
## 
  
✔  checking serialization versions
##    checking whether package ‘respect’ can be installed ...
  
✔  checking whether package ‘respect’ can be installed (838ms)
## 
  
   checking installed package size ...
  
✔  checking installed package size
## 
  
   checking package directory ...
  
✔  checking package directory
##    checking ‘build’ directory ...
  
✔  checking ‘build’ directory
## 
  
   checking DESCRIPTION meta-information ...
  
✔  checking DESCRIPTION meta-information
## 
  
✔  checking top-level files
## ✔  checking for left-over files
##    checking index information ...
  
✔  checking index information
## 
  
   checking package subdirectories ...
  
✔  checking package subdirectories
## 
  
   checking R files for non-ASCII characters ...
  
✔  checking R files for non-ASCII characters
## 
  
   checking R files for syntax errors ...
  
✔  checking R files for syntax errors
## 
  
   checking whether the package can be loaded ...
  
✔  checking whether the package can be loaded
## 
  
   checking whether the package can be loaded with stated dependencies ...
  
✔  checking whether the package can be loaded with stated dependencies
## 
  
   checking whether the package can be unloaded cleanly ...
  
✔  checking whether the package can be unloaded cleanly
## 
  
   checking whether the namespace can be loaded with stated dependencies ...
  
✔  checking whether the namespace can be loaded with stated dependencies
## 
  
   checking whether the namespace can be unloaded cleanly ...
  
✔  checking whether the namespace can be unloaded cleanly
## 
  
   checking loading without being on the library search path ...
  
✔  checking loading without being on the library search path
## 
  
   checking dependencies in R code ...
  
✔  checking dependencies in R code
## 
  
   checking S3 generic/method consistency ...
  
✔  checking S3 generic/method consistency (470ms)
## 
  
   checking replacement functions ...
  
✔  checking replacement functions
## 
  
   checking foreign function calls ...
  
✔  checking foreign function calls
## 
  
   checking R code for possible problems ...
  
✔  checking R code for possible problems (2.1s)
## 
  
   checking Rd files ...
  
✔  checking Rd files
## 
  
   checking Rd metadata ...
  
✔  checking Rd metadata
## 
  
   checking Rd line widths ...
  
✔  checking Rd line widths
## 
  
   checking Rd cross-references ...
  
✔  checking Rd cross-references
## 
  
   checking for missing documentation entries ...
  
✔  checking for missing documentation entries
## 
  
   checking for code/documentation mismatches ...
  
✔  checking for code/documentation mismatches (467ms)
## 
  
   checking Rd \usage sections ...
  
✔  checking Rd \usage sections (592ms)
## 
  
   checking Rd contents ...
  
✔  checking Rd contents
## 
  
   checking for unstated dependencies in examples ...
  
✔  checking for unstated dependencies in examples
## 
  
   checking installed files from ‘inst/doc’ ...
  
✔  checking installed files from ‘inst/doc’
## 
  
   checking files in ‘vignettes’ ...
  
N  checking files in ‘vignettes’
##    Files named as vignettes but with no recognized vignette engine:
##       ‘vignettes/setup.spin.Rmd’
## (Is a VignetteBuilder field missing?)
  
   (Is a VignetteBuilder field missing?)
##    checking examples ...
  
✔  checking examples (528ms)
## 
  
   checking for unstated dependencies in ‘tests’ ...
  
✔  checking for unstated dependencies in ‘tests’
## 
  
   checking tests ...
  
─  checking tests ...
## 
  
   Running ‘testthat.R’
  

  
✔  Running ‘testthat.R’
## 
  
   checking for unstated dependencies in vignettes ...
  
N  checking for unstated dependencies in vignettes
##    '::' or ':::' imports not declared from:
##      ‘devtools’ ‘usethis’
##    'library' or 'require' calls not declared from:
##      ‘devtools’ ‘usethis’
## 
  
   checking package vignettes in ‘inst/doc’ ...
  
✔  checking package vignettes in ‘inst/doc’
## 
  
   checking re-building of vignette outputs ...
  
✔  checking re-building of vignette outputs (1s)
## 
  
   
##    See
##      ‘/private/var/folders/wl/k3pxrjzj7z772c_67q0m17m9kf8fvq/T/RtmpKNdmIU/respect.Rcheck/00check.log’
##    for details.
##    
##    
## 
  

```

```
## ── R CMD check results ──────────────────────────── respect 0.0.0.9000 ────
## Duration: 13.6s
## 
## ❯ checking files in ‘vignettes’ ... NOTE
##   Files named as vignettes but with no recognized vignette engine:
##      ‘vignettes/setup.spin.Rmd’
##   (Is a VignetteBuilder field missing?)
## 
## ❯ checking for unstated dependencies in vignettes ... NOTE
##   '::' or ':::' imports not declared from:
##     ‘devtools’ ‘usethis’
##   'library' or 'require' calls not declared from:
##     ‘devtools’ ‘usethis’
## 
## 0 errors ✔ | 0 warnings ✔ | 2 notes ✖
```


---
title: "setup.R"
author: "skarzynskimw"
date: "Fri Dec  7 21:49:48 2018"
---
