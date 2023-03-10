% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ah2.R
\name{ah2}
\alias{ah2}
\title{Two-Sample Comparison of Average Hazard}
\usage{
ah2(time, status, arm, tau=NULL, conf.int=0.95)
}
\arguments{
\item{time}{The follow-up time for right censored data.}

\item{status}{The event indicator, 1=event, and 0=right censored.}

\item{arm}{The group indicator for comparison. The elements of this vector take either 1 or 0. Normally, 0=control group, 1=active treatment group.}

\item{tau}{A scalar value to specify a time point for calculating the average hazard. When \code{tau=NULL}, the default value (i.e., the maximum time point where the size of risk set for both groups remains at least 10) is used.}

\item{conf.int}{A confidence coefficient for calculating confidence intervals. The default is \code{conf.int=0.95}.}
}
\value{
an object of class ah2.

\item{note}{the truncation time point used in the analysis}

\item{n.obs}{the number of observations (total number, number of events by tau, number of censoring by tau, and size of risk set at tau)}

\item{ah}{the estimated average hazard by arm}

\item{rah}{the ratio of average hazards (RAH; treatment over control)}

\item{dah}{the difference of average hazard (DAH; treatment minus control)}
}
\description{
The \code{ah2} function performs two-sample comparisons using the average hazard (AH) as a summary measure of the survival time distribution.
Two kinds of between-group contrast metrics, the ratio of AH (RAH) and the difference in AH (DAH), are calculated.
}
\details{
The function provides the AH for each of the two groups, the absolute difference and the absolute ratio of AH (DAH and RAH) between the two groups, and the corresponding confidence intervals.
It also calculates p-values for the two-sided tests based on the RAH and DAH.
}
\examples{
#====================================================================
# cm214_pfs: The sample reconstructed data of the CheckMate214 study.
# The code below reproduces the results reported by
# Uno and Horiguchi (StatMed; 2023) in Table 6.
#====================================================================
D      = cm214_pfs
time   = D$time
status = D$status
arm    = D$arm
tau    = 21

a = ah2(time=time, status=status, arm=arm, tau=tau, conf.int=0.95)
print(a, digits=3)
}
\references{
Horiguchi M and Uno H. Ratio and difference of average hazard with survival weight: new measures to quantify survival benefit of new therapy. Statistics in Medicine. 2023;1-17. <doi:10.1002/sim.9651>
}
\author{
Hajime Uno, Miki Horiguchi
}
