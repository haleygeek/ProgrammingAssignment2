
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
        cleanfile <- na.omit(infile)
        
        return (cleanfile)
}

# Determine the working set
getworkingset <- function(fullset, pollutant){
        if (pollutant == "sulfate"){
                workingset <- as.numeric(fullset$sulfate)
        }else if (pollutant == "nitrate"){
                workingset <- as.numeric(fullset$nitrate)
        }
        #
        
        return(workingset)
}

pollutantmean <- function (directory, pollutant, id=1:332){ 
        
        #directory = location of csv files
        #id = list of id numbers to be meaned
        
        #Do not round the result, so initallizing as numeric
        #Alternatively, I could use as.numeric(runsum)
        runsum <- 0.0 # vector containing the running sum of id pollutant data
        runlen <- 0.0 # vector containing the running number of measurements

        
        
        for (i in id){
                fullset <- getfile(directory, i)
                # pollutant = can be either "sulfate" or "nitrate"
                workingset <- getworkingset (fullset, pollutant)
                # calculate the running sum of sulfate readings
                runsum <- runsum + sum(workingset)
                #  calculate the length of the running sum
                runlen <- runlen + length(workingset)
        }
        
        # calulates  mean of pollutant across the ids in the list provided
        pollutemean <- runsum/runlen
        
        # returns the mean to the calling function
        return (pollutemean)
}

#complete <- function (directory, id = 1:332){
###        #Reads through the files
  #      for (i in id){
  #              #From each file # of completely observed cases
  ##              fullset <- getfile(directory, i)
  ##              nobs <- length(na.omit(fullset))
  #              print(nobs)
   #     }
        
        #Return data as
        #  id    nobs (# complete cases)
        #  1    117
        #  2    1041
        
        
#}