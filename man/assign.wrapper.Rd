% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assign.wrapper.R
\name{assign.wrapper}
\alias{assign.wrapper}
\title{ASSIGN All-in-one function}
\usage{
assign.wrapper(trainingData = NULL, testData, trainingLabel,
  testLabel = NULL, geneList = NULL, anchorGenes = NULL,
  excludeGenes = NULL, n_sigGene = NA, adaptive_B = TRUE,
  adaptive_S = FALSE, mixture_beta = TRUE, outputDir, p_beta = 0.01,
  theta0 = 0.05, theta1 = 0.9, iter = 2000, burn_in = 1000,
  sigma_sZero = 0.01, sigma_sNonZero = 1, S_zeroPrior = FALSE,
  pctUp = 0.5, geneselect_iter = 500, geneselect_burn_in = 100)
}
\arguments{
\item{trainingData}{The genomic measure matrix of training samples (i.g.,
gene expression matrix). The dimension of this matrix is probe number x
sample number. The default is NULL.}

\item{testData}{The genomic measure matrix of test samples (i.g., gene
expression matrix). The dimension of this matrix is probe number x sample
number.}

\item{trainingLabel}{The list linking the index of each training sample to a
specific group it belongs to. See examples for more information.}

\item{testLabel}{The vector of the phenotypes/labels of the test samples.
The default is NULL.}

\item{geneList}{The list that collects the signature genes of one/multiple
pathways. Every component of this list contains the signature genes
associated with one pathway. The default is NULL.}

\item{anchorGenes}{A list of genes that will be included in the signature
even if they are not chosen during gene selection.}

\item{excludeGenes}{A list of genes that will be excluded from the signature
even if they are chosen during gene selection.}

\item{n_sigGene}{The vector of the signature genes to be identified for one
pathway. n_sigGene needs to be specified when geneList is set NULL. The
default is NA. See examples for more information.}

\item{adaptive_B}{Logicals. If TRUE, the model adapts the
baseline/background (B) of genomic measures for the test samples. The
default is TRUE.}

\item{adaptive_S}{Logicals. If TRUE, the model adapts the signatures (S) of
genomic measures for the test samples. The default is FALSE.}

\item{mixture_beta}{Logicals. If TRUE, elements of the pathway activation
matrix are modeled by a spike-and-slab mixuture distribution. The default is
TRUE.}

\item{outputDir}{The path to the directory to save the output files. The
path needs to be quoted in double quotation marks.}

\item{p_beta}{p_beta is the prior probability of a pathway being activated
in individual test samples. The default is 0.01.}

\item{theta0}{The prior probability for a gene to be significant, given that
the gene is NOT defined as "significant" in the signature gene lists
provided by the user. The default is 0.05.}

\item{theta1}{The prior probability for a gene to be significant, given that
the gene is defined as "significant" in the signature gene lists provided by
the user. The default is 0.9.}

\item{iter}{The number of iterations in the MCMC. The default is 2000.}

\item{burn_in}{The number of burn-in iterations. These iterations are
discarded when computing the posterior means of the model parameters. The
default is 1000.}

\item{sigma_sZero}{Each element of the signature matrix (S) is modeled by a
spike-and-slab mixuture distribution. Sigma_sZero is the variance of the
spike normal distribution. The default is 0.01.}

\item{sigma_sNonZero}{Each element of the signature matrix (S) is modeled by
a spike-and-slab mixuture distribution. Sigma_sNonZero is the variance of
the slab normal distribution. The default is 1.}

\item{S_zeroPrior}{Logicals. If TRUE, the prior distritribution of signature
follows a normal distribution with mean zero. The default is TRUE.}

\item{pctUp}{By default, ASSIGN bayesian gene selection chooses the
signature genes with an equal fraction of genes that increase with pathway
activity and genes that decrease with pathway activity. Use the pctUp
parameter to modify this fraction. Set pctUP to NULL to select the most
significant genes, regardless of direction. The default is 0.5}

\item{geneselect_iter}{The number of iterations for bayesian gene selection. The
default is 500.}

\item{geneselect_burn_in}{The number of burn-in iterations for bayesian gene selection.
The default is 100}
}
\value{
The assign.wrapper returns one/multiple pathway activity for each
individual training sample and test sample, scatter plots of pathway
activity for each individual pathway in the training and test data,
heatmap plots for gene expression signatures for each individual pathway,
heatmap plots for the gene expression of the prior and posterior
signtures (if adaptive_S equals TRUE) of each individual pathway in the test
data
}
\description{
The assign.wrapper function integrates the assign.preprocess, assign.mcmc,
assign.summary, assign.output, assign.cv.output functions into one wrapper
function.
}
\details{
The assign.wrapper function is an all-in-one function which outputs the
necessary results for basic users. For users who need more
intermediate results for model diagnosis, it is better to run the
assign.preprocess, assign.mcmc, assign.convergence, assign.summary functions
separately and extract the output values from the returned list objects of
those functions.
}
\examples{

\dontshow{
setwd(tempdir())
tempdir <- tempdir()
}
data(trainingData1)
data(testData1)
data(geneList1)

trainingLabel1 <- list(control = list(bcat=1:10, e2f3=1:10, myc=1:10, ras=1:10,
src=1:10), bcat = 11:19, e2f3 = 20:28, myc= 29:38, ras = 39:48, src = 49:55)
testLabel1 <- rep(c("subtypeA","subtypeB"),c(53,58))

assign.wrapper(trainingData=trainingData1, testData=testData1,
trainingLabel=trainingLabel1, testLabel=testLabel1, geneList=geneList1,
adaptive_B=TRUE, adaptive_S=FALSE, mixture_beta=TRUE,
outputDir=tempdir, p_beta=0.01, theta0=0.05, theta1=0.9,
iter=20, burn_in=10)

}
\author{
Ying Shen and W. Evan Johnson
}

