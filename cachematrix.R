
## This script takes advantage of the scoping rules of R to calculate the inverse 
## of a matrix. The inverted matrix is cached until a change has been made to it, 
## so that the inversion is not performed repeatedly, thus saving time.  


## makeCacheMatrix creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {   
  
  stored <- NULL          
  
  set <- function (y){    
    x <<- y           
    stored <<- NULL   
  }
  
  get <- function () x    
  setStored <- function (solved) stored <<- solved    
  getStored <- function () stored        
  list (set = set, get = get, setStored = setStored, getStored = getStored) 
}


## cacheSolve computes the inverse of the special matrix returned by 
## makeCacheMatrix, sends the inverse to be cached, and retrieves the 
## cached inverse.

cacheSolve <- function(x, ...) {                                   
  
  
  ## Return a matrix that is the inverse of 'x'
  solved <- x$getStored()                                         
  
  if (!is.null(solved)) {                 
    message ("getting cached data")
    return(solved)                  
  } else {                                
    
    unsolved <- x$get()               
    solved <- solve(unsolved, ...)    
    x$setStored(solved)               
  }
  solved
}


