
## This script takes advantage of the scoping rules of R to calculate the inverse of a matrix. The 
## inverted matrix is cached until a change has been made to it, so that the inversion is not performed 
## repeatedly, thus saving time.  

## MakeCacheMatrix creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {   # x is the unsolved matrix
  
  stored <- NULL          # stored is the cached value
  
  # y = orignal data
  set <- function (y){    # x and stored are outside of the function's env
    x <<- y           # Sets the value of the unsolved matrix
    stored <<- NULL   # THis is a new matrix so the stored inverted matrix is null
  }
  
  get <- function () x    # Retrieves the original matrix
  
  # Sets the stored value with the solved (inverted) matrix
  setStored <- function (solved) stored <<- solved   # Stored is outside the scope 
  getStored <- function () stored   # function that returns the value of the inverted matrix      
  
  # Calls to the makeCacheMatrix are through this list, x$listItem
  list (set = set, get = get, setStored = setStored, getStored = getStored) 
}


## cacheSolve computes the inverse of the special matrix returned by makeCacheMatrix, caches the inverse, 
## and retrieves the cached inverse.

cacheSolve <- function(x, ...) {                # This function takes the original matrix X                   
  
  
  ## Return a matrix that is the inverse of 'x'
  solved <- x$getStored()                 # Retrieves stored value                        
  
  if (!is.null(solved)) {                 # Has a value been stored? Null = no, anything else = yes
    message ("getting cached data")
    return(solved)                  # Return stored solved value, if there is one
  } else {                                # If the stored value is null
    
    unsolved <- x$get()               # get the unsolved matrix
    solved <- solve(unsolved, ...)    # invert the unsolved matrix
    x$setStored(solved)               # set the stored value to the inverted (solved) matrix
  }
  solved
}



newMatrix <- matrix(c(1,2,3,4), nrow=2, ncol=2)
print(newMatrix)
cachedMatrix <- makeCacheMatrix (newMatrix)
finalSolved <- cacheSolve(cachedMatrix)
print(finalSolved)

secondCall <- cacheSolve (cachedMatrix)
print(secondCall)

newNewMatrix <- matrix(c(4,5,6,7), nrow=2,ncol=2)
newCachedMatrix <- makeCacheMatrix (newNewMatrix)
thirdCall<- cacheSolve(newCachedMatrix)
print(thirdCall)

fourthcall <- cacheSolve(newCachedMatrix)
print(fourthcall)

