## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=TRUE, eval=FALSE---------------------------------------------------
#  install.packages("survAH")

## ---- echo=TRUE, eval=FALSE---------------------------------------------------
#  install.packages("devtools") #-- if the devtools package has not been installed
#  devtools::install_github("uno1lab/survAH")

## ---- echo=TRUE, eval=TRUE, message=FALSE-------------------------------------
library(survAH)

nrow(cm214_pfs)

head(cm214_pfs)

## ---- echo=FALSE, eval=TRUE, fig.height=6, fig.width=6------------------------
library(survival)
plot(survfit(Surv(time, status)~arm, data=cm214_pfs), col=c("blue","red"), lwd=2, mark.time=F, xlab="Time (month)", ylab="Probability")
legend("bottomleft", c("Placebo (arm=0)","Treatment (arm=1)"), col=c("blue","red"), lwd=2)

## ---- echo=TRUE, eval=TRUE----------------------------------------------------
time   = cm214_pfs$time
status = cm214_pfs$status
arm    = cm214_pfs$arm

## ---- echo=TRUE, eval=FALSE---------------------------------------------------
#  ah2(time, status, arm, tau=21)

## ---- echo=TRUE, eval=FALSE---------------------------------------------------
#  ah2(time, status, arm)

## ---- echo=TRUE, eval=TRUE----------------------------------------------------
obj = ah2(time, status, arm, tau=21)
print(obj, digits=3)

