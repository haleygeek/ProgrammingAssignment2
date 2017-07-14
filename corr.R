

corr <- function (directory, threshold = 0){
        cleanr2 <- vector(mode = "numeric", length = 0)
        r2 <- vector(mode = "numeric", length = 0)
        # directory is the folder with the csvs
        # threshold is numeric vector, # complete observations needed to do work
        # work = compute correlation between nitrate and silfate
        # return a numeric vector of correlations
        # no rounding
        
        # open the correct folder, if source(complete.R) is in workspace, can just call fn
        allobs <- complete(directory)
        
        
        
        # sift through all of the files 
        id <- 0
        
        while (id < 332){
                id <- id+1 
                # need to be able to pick out the nobs values singly
                nobs <- allobs$nobs[[id]]
                
                 
                # pick out the ones with nobs => threshold
                if (threshold <= nobs){
                        
                        # get column data from matching file (id)
                        fullset <- getfile(directory, id)
                        
                        # which ones are NA?
                        truecases <- complete.cases(fullset$sulfate,fullset$nitrate)
                        
                        # remove NA
                        sulfcases <- fullset$sulfate[truecases == TRUE]
                        nitcases <- fullset$nitrate[truecases == TRUE]
                        
                        # compute correlations in all files matching threshold
                        # add to a numeric vector  
                        
                        r2 [id] <- cor(sulfcases, nitcases)
                        cleanr2 <- r2[!is.na(r2)]
                        # keep count of repetitions
                } 
        }
        
       return (cleanr2)
}

corr2 <- function (directory, threshold = 0){
        print(threshold)
        }