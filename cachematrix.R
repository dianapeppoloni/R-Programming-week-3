## The following function calculates the inverse of a matrix and saves it 
## to the cache so that when the user will try to calculate the 
## matrix inverse again, the previously saved value will be returned instead of 
## repeating each time this calculation. 


## This function creates a special "matrix" object, which is really a list  
## containing a function to 
## 1. set the value of the matrix 
## 2. get the value of the matrix 
## 3. set the value of the inverse 
## 4. get the value of the inverse 


makeCacheMatrix <- function(x = matrix()) {
  ## create a matrix object x and some associated sub-functions/methods 
  ## define the cache inv 
  inv <- NULL 
  set <- function(y) { 
    x <<- y ## assign the input matrix y to the variable x in the 
    ## parent environment 
    inv <<- NULL ## re-initialize inv in the parent environment to null 
  } 
  get <- function() x ## return the matrix x 
  setinverse <- function(inverse) inv <<- inverse ## set the cache inv equal 
  ## to the inverse of the matrix x 
  getinverse <- function() inv ## return the cached inverse of x 
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) 

}


## This second function calculates the inverse of the special "matrix" created 
## with the first one. First of all it verifies if the inverse of the makeCacheMatrix object has been already calculated.
## In case this value already exists, it gets the inverse from the cache 
## and skips the computation. If not, it calculates the matrix inverse
## and sets the resulting value in the cache through the 'setinverse' function. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  inv <- x$getinverse() 
  if(!is.null(inv)) { 
    message("No cached data found. Recomputing.") 
    return(inv) 
  } 
  
  ## otherwise, it calculates the inverse 
  
  data <- x$get()
  inv <- solve(data, ...)
  
  ## it sets the value of the inverse in the cache via the setinverse function.
  
  x$setinverse(inv)
  
  return(inv)

}
