#Define a function like a variable
add2 <- function (x,y) { 
  x+ y  
  }



above <- function (x,n = 10){
  use <- x > n
  x[use]
}

#Returns subset of #s greater than 10
above10 <- function (x){
  use<- x > 10
  x[use]
}


#Dataframe with average of each column
columnmean <- function (y, removeNA){
  nc <- ncol (y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA )
  }
  means
}
