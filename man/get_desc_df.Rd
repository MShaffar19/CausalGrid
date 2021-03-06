% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{get_desc_df}
\alias{get_desc_df}
\title{Get descriptive data.frame}
\usage{
get_desc_df(
  obj,
  cont_bounds_inf = TRUE,
  do_str = FALSE,
  drop_unsplit = FALSE,
  digits = NULL,
  unsplit_cat_star = TRUE,
  ...
)
}
\arguments{
\item{obj}{partition object}

\item{cont_bounds_inf}{Should "Inf" be used for continuous bounds (otherwise
the bounds from X_range)}

\item{do_str}{If True, use a string like "(a, b]", otherwise have two
separate columns with a and b}

\item{drop_unsplit}{If True, drop columns for variables overwhich the
partition did not split}

\item{digits}{digits Option (default is NULL)}

\item{unsplit_cat_star}{Should unsplit categorical variables be listed as
"*", otherwise all factor labels will be used.}

\item{...}{Additional arguments.}
}
\value{
data.frame with columns: partitioning columns
}
\description{
Get information for each cell
}
