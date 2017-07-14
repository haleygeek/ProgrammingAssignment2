complete <- function (directory, id = 1:332){
        #Reads through the 
        print(id)
       nobs <- list()
       i <-1
       len <- length(id)
        for (i in len){
             
                #From each file # of completely observed cases
                fullset <- getfile(directory, id[[i]])
                truecases <- complete.cases(fullset$sulfate,fullset$nitrate)
                finalcases <- fullset$sulfate[truecases == TRUE]
                nobs[[length(nobs) + 1]] <- length(finalcases)
                #outdata = cbind(id, nobs)
        }
       print (rbind(c("id"=id,"nobs" =nobs)))
        #output <- data.frame(cbind(colnames,rows))
        #print(output)
                #Return data as
        #  id    nobs (# complete cases)
        #  1    117
        #  2    1041
        
        
}

# Function to format csv file name
add0s <- function (i){
        if (i < 10) {
                add0 <- "00"
        } else if (i >= 10 & i <100){
                add0 <- "0"
        } else {
                add0 <- ""
        }
        return(add0)
}

# Function to get cleaned data from each file (i) in the list
getfile <- function (directory, i){                                                         
        #create data frame from file location passed by user
        # 0s will depend on 10s spot
        
        location <-paste(directory,"/", add0s(i), i,".csv", sep="")
        
        # import file for reading
        infile <- read.csv(location)
        
        return (infile)
}
