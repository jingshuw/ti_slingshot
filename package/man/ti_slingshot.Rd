% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ti_slingshot.R
\name{ti_slingshot}
\alias{ti_slingshot}
\title{Infer a trajectory using slingshot}
\usage{
ti_slingshot(shrink = 1L, reweight = TRUE, reassign = TRUE,
  thresh = 0.001, maxit = 10L, stretch = 2L,
  smoother = "smooth.spline", shrink.method = "cosine")
}
\arguments{
\item{shrink}{Logical or numeric between 0 and 1, determines whether and how much to shrink branching lineages toward their average prior to the split. Domain: e^U(-Inf, 0.00). Default: 1. Format: numeric.}

\item{reweight}{Logical, whether to allow cells shared between lineages to be reweighted during curve-fitting. If `TRUE`, cells shared between  lineages will be weighted by: distance to nearest curve / distance to curve. Default: TRUE. Format: logical.}

\item{reassign}{Logical, whether to reassign cells to lineages at each iteration. If TRUE, cells will be added to a lineage when their projection distance to the curve is less than the median distance for all cells currently assigned to the lineage. Additionally, shared cells will be removed from a lineage if their projection distance to the curve is above the 90th percentile and their weight along the curve is less than 0.1. Default: TRUE. Format: logical.}

\item{thresh}{Numeric, determines the convergence criterion. Percent change in the total distance from cells to their projections along curves must be less than thresh. Default is 0.001, similar to principal.curve. Domain: e^U(-11.51, 11.51). Default: 0.001. Format: numeric.}

\item{maxit}{Numeric, maximum number of iterations, see principal.curve. Domain: U(0, 50). Default: 10. Format: integer.}

\item{stretch}{Numeric factor by which curves can be extrapolated beyond endpoints. Default is 2, see principal.curve. Domain: e^U(-Inf, 1.61). Default: 2. Format: numeric.}

\item{smoother}{Choice of scatter plot smoother. Same as principal.curve, but "lowess" option is replaced with "loess" for additional flexibility. Domain: {smooth.spline, loess, periodic.lowess}. Default: smooth.spline. Format: character.}

\item{shrink.method}{Character denoting how to determine the appropriate amount of shrinkage for a branching lineage. Accepted values are the same as for `kernel` in `density()` (default is `"cosine"`), as well as `"tricube"` and `"density"`. See 'Details' for more. Domain: {cosine, tricube, density}. Default: cosine. Format: character.}
}
\description{
Infer a trajectory using slingshot
}
\examples{
dataset <- data <- dyntoy::generate_dataset(
  num_cells = 99,
  num_features = 101,
  model = "tree",
  normalise = FALSE
)
model <- dynwrap::infer_trajectory(dataset, ti_slingshot())

}
