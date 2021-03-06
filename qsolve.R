# qsolve.R 
# Version: 1.0
# Author: Ty Cobb 2019
# License: GPL 2.0
#
# The function qsolve(a, b, c)
# solves the quadratic equation
#     a x^2 + b x + c = 0
# for real solutions x1 and x2
# input:
#     a, b and c are finite numeric real numbers
#     a != 0
#     there are real solutions (not two complex ones)
# return:
#     c(x1, x2) where x1 and x2 are finite 
#               numeric real numbers
#               x1 <= x2
#     NA       if the input is not as expected or 
#              the return values can not be computed 
#              as expected. 
# Note the next version of qsolve() will
# 1) address several cases that now return NA because
#    of internal overflows and 
# 2) will provide more precision in some cases.
#
# qsolve <- function(a, b, c) {
#   disc <- b^2 - 4*a*c
#   if( disc < 0) {
#     return(NULL)
#   }
#   x1 <- (-b - sqrt(disc))/(2*a)
#   x2 <- (-b + sqrt(disc))/(2*a)
#   return(c(x1, x2))
# }

qsolve <- function(a, b, c) {
	#Test input values:
    if(is.finite(a)!=TRUE || is.finite(b)!=TRUE || is.finite(c)!=TRUE){
        # print("a, b, and c must be finite real numbers.")
        return(NA)
    }
    if(a==0){
        # print("a cannot equal zero")
        return(NA)
    }
    if((b^2) == Inf){
        # print("b^2 must be smaller than Inf")
        return(NA)
    }

    #Perform quadratic function
    disc <- b^2 - 4*a*c
    if( disc < 0) {
        return(NA)
    }
    x1 <- (-b - sqrt(disc))/(2*a)
    x2 <- (-b + sqrt(disc))/(2*a)

    if(x1>x2){# Not sure if this test is necessary...
    	# print("error...x1 should not be greater than x2...")
    	return(NA)
    }
    return(c(x1, x2))# Return x1 and x2 values
}# End qsolve()
