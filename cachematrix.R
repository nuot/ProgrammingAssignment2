## Put comments here that give an overall description of what your
## functions do

##Below are two functions that are used to create a special object that 
##stores a numeric matrix and cache's its inverse.

##Set the value of the matrix
makeMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
## get the value of the matrix
        get <- function() x
##set the inverse of the matrix
        setinv <- function(inverse) inv <<- inverse
##get the inverse of the matrix
        getinv <- function() inv
        list(set = set, get = get, 
                setinv = setinv,
                getinv = getinv)
}


##The following function calculates the inverse of the special matrix
##created with the above function. 
cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
                message('getting cached data')
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}

#testing
setwd("/Users/tiannuo/Desktop/R_Coursera/ProgrammingAssignment2")
source("cachematrix.R")
m1 <- makeMatrix(matrix(1:4, 2, 2))
cacheSolve(m1)

