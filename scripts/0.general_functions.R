# 0.general_functions.R

#' loads library and installs it if required
#' @param pkg_to_load `character` designating the name of the package to be loaded
#' @returns nothing of relevance. side effect is loading the package into R env
install_or_load_library <- function(pkg_to_load, only_install = FALSE) 
{
  if (!require(pkg_to_load, character.only=T, quietly=T)) {
    
    # install package
    install.packages(pkg_to_load)
    
    # load library after installation
    if(!only_install) library(pkg_to_load, character.only=T)
  }
}