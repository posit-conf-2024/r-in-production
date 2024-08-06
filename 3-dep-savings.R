# Figure out which packages that would no longer be needed for each
# of the dependencies in your package

# Need dev pak for this 
# pak::pak("r-lib/pak")

deps <- renv::dependencies()
pkgs <- unique(deps$Package)

needed <- function(pkgs) {
  pkgs <- pak::pkg_deps(pkgs)
  pkgs$ref[is.na(pkgs$priority)]
}

all_pkgs <- needed(pkgs)

pkgs |> 
  purrr::set_names() |>
  purrr::map(\(this_pkg) setdiff(all_pkgs, needed(setdiff(pkgs, this_pkg))))
