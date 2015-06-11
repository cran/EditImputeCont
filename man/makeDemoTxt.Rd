\name{makeDemoTxt}
\alias{makeDemoTxt}
\title{Make Demo Text Files}
\description{
This function generates demo text-files from \code{\link{NestedEx}} \R dataset, which show appropriate formats of Y.original and edit rules to be read by \code{\link{readData}}.
}
\usage{
makeDemoTxt(NestedEx)
}
\arguments{
	\item{NestedEx}{example dataset in \code{\link{NestedEx}}.}
}
\details{
It generates the following demo text files:

\bold{Demo_D_obs.txt}: The first row is the variable name used to specify ratio edits, followed by (\eqn{n}, \eqn{p}) matrix where \eqn{n} is the number of records and \eqn{p} is the number of variables. For example,
\tabular{ccccc}{
  "X1" \tab "X2" \tab "X3" \tab "X4" \tab "X5" \cr
  120 \tab 2101 \tab 1300 \tab 820 \tab 700 \cr
  111 \tab 1812 \tab 1003 \tab 123 \tab 254
}

\bold{Demo_Ratio_edit.txt}: First column: Var A, Second column: Var B, Third column: upper limit of (Var A/Var B). For example,
\tabular{ccccc}{
  "X1" \tab "X2" \tab 0.8 \cr
	"X2" \tab "X1" \tab 1.2 \cr
	"X4" \tab "X5" \tab 0.7
}

\bold{Demo_Balance_edit.txt}: \eqn{p} columns consisting of coefficient of equations. For example, `X1-X2-X4-X5=0' and `X3-X4-X5=0' are written as
\tabular{ccccc}{
  1 \tab -1 \tab 0 \tab -1 \tab -1 \cr
  0 \tab 0 \tab 1 \tab -1 \tab -1
}

\bold{Demo_Range_edit.txt}: First column: Var A, second column: lower limit of Var A, third column: upper limit of Var B. For example,
\tabular{ccccc}{
"X1" \tab 2 \tab Inf \cr
"X2" \tab -Inf \tab 130000 \cr
"X4" \tab 0.002 \tab 12000
}
}
\seealso{\code{\link{readData}}, \code{\link{NestedEx}}} 
\examples{
data(NestedEx)
makeDemoTxt(NestedEx)
 
D_obs1 = read.table("Demo_D_obs.txt", header = TRUE)  
  # The original data file has a header with variable names 
  # to be used in ratio edit description.
Ratio1 = read.table("Demo_Ratio_edit.txt", header = FALSE) 
Range1 = read.table("Demo_Range_edit.txt", header = FALSE) 
Balance1 = read.table("Demo_Balance_edit.txt", header = FALSE) 

data1 = readData(D_obs1, Ratio1, Range1, Balance1)
}