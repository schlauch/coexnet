% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/difExprs.R
\name{difExprs}
\alias{difExprs}
\title{Differential expression analysis using two different methods.}
\usage{
difExprs(expData, treatment, fdr, DifferentialMethod, plotting = FALSE)
}
\arguments{
\item{expData}{A matrix with the expression matrix, it may be stored in a SummarizedExperiment object.}

\item{treatment}{A vector with the ientifiers of the classes, 0 to control
and 1 to case.}

\item{fdr}{The expected FDR value.}

\item{DifferentialMethod}{The method to calculate the differential expressed
genes, can be "sam" or "acde"}

\item{plotting}{The option to show the result in a plot. By default FALSE.}
}
\value{
A data.frame with the expression matrix to the expressed diferential 
genes only.
}
\description{
Using the expression matrix calculate the differential expressed
genes to two class analysis and fixing an expected FDR value. The methods
are SAM and ACDE.
}
\examples{

## Creating the expression matrix

# The matrix have 200 genes and 20 samples

n <- 200
m <- 20

# The vector with treatment samples and control samples

treat <- c(rep(0,10),rep(1,10))

# Calculating the expression values normalized

mat <- as.matrix(rexp(n, rate = 1))
norm <- t(apply(mat, 1, function(nm) rnorm(m, mean=nm, sd=1)))

## Running the function using the two approaches

sam <- difExprs(expData = norm,treatment = treat,fdr = 0.2,DifferentialMethod = "sam")
acde <- difExprs(expData = norm,treatment = treat,fdr = 0.2,DifferentialMethod = "acde")
}
\references{
Tusher, V. G., Tibshirani, R., & Chu, G. (2001). Significance analysis of 
microarrays applied to the ionizing radiation response. Proceedings of the National Academy of Sciences, 98(9), 5116-5121.

Acosta J and Lopez-Kleine L (2015). acde: Artificial Components Detection of Differentially Expressed Genes. R package version 1.4.0.
}
\seealso{
\code{\link{exprMat}} to obtain the expression matrix.
}
\author{
Juan David Henao <judhenaosa@unal.edu.co>
}
