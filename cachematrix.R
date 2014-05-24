## Put comments here that give an overall description of what your
## functions do

## Create a matrix with a cache for its inverse
makeCacheMatrix <- function(x = matrix()) {
  # create a matrix cache centered around the given matrix
  #
  # Args:
  #   x: a square, invertable matrix
  # Returns:
  #   A list of environments representing caching functions representing x
  #
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(new_inverse) inverse <<- new_inverse
  getinverse <- function() inverse
  list(set=set, get=get, getinverse=getinverse, setinverse=setinverse)
}


## Produce an inverted version of the provided matrix calculated from scratch or retrieved from cache
cacheSolve <- function(x, ...) {
  # Return a matrix that is the inverse of 'x'
  #
  # Args:
  #   x: A list produced by makeCacheMatrix() augmented with associated functions x$getinverse and x$setinverse
  # Returns:
  #   The calculated matrix-inverse of x
  #
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("retrieving cached data")
    return(m)
  }
  
  data <- x$get()
  inverse <- solve(data)
  x$setinverse(inverse)
  
  inverse
}
