## Calculate & cache the inverse of a specific matrix.

## This function creates a list which contains the given matrix
## and its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function(){
    return(x)
  }
  setinverse <- function(inverse){
    m <<- inverse
  }
  getinverse <- function(){
    return(m)
  }
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## This function calculates or retrieves the inverse of the given matrix.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)){
    message("Retrieving the cached data.")
    return(m)
  }else{
    matrix <- x$get()
    ## Return a matrix that is the inverse of 'x'
    m <- solve(matrix, ...)
    x$setinverse(m)
    return(m)
  }
}