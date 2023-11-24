# ____ Install R packages ____ #

# Find R packages list
install_script_path <- list.files(
  "/~/docker-dev", 
  "R_packages.csv", 
  recursive = TRUE, 
  include.dirs = TRUE, 
  full.names = TRUE
)

# Read in list of R packages to install
pkg_list <- read.csv(install_script_path)
pkgs <- pkg_list$Package

# Install all packages in `R_packages.csv`
install.packages(pkgs)