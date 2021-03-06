% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estimator_plans.R
\name{grid_rf}
\alias{grid_rf}
\alias{is_grid_rf}
\title{Create a grid_rf object}
\usage{
grid_rf(num.trees = 500, num.threads = NULL, resid_est = TRUE)

is_grid_rf(x)
}
\arguments{
\item{num.trees}{number of trees in the random forest}

\item{num.threads}{num.threads}

\item{resid_est}{Residualize the Estimation sample (using fit from training)}

\item{x}{an R object}
}
\value{
grid_rf object

Boolean
}
\description{
Residualizes the train sample using cross-fitting
Residualizes the estimation samples using a train fit

Tests wheterh object is a \code{grid_rf}.
}
\section{Functions}{
\itemize{
\item \code{is_grid_rf}: is grid_rf
}}

