---
title: "R Notebook"
output: html_notebook
---

This is an [R Markdown](http://rmarkdown.rstudio.com) Notebook. When you execute code within the notebook, the results appear beneath the code. 

Try executing this chunk by clicking the *Run* button within the chunk or by placing your cursor inside it and pressing *Ctrl+Shift+Enter*. 
```{r}
#output last rows to window
data1 <- read.csv(file="D:\\Dropbox\\Sync Coding Computers\\Data Science Specialization\\R Programming\\Classwork\\hw1_data.csv")
datamatrix <-data.matrix(data1)
datamatrix
dim(datamatrix)
```


```{r}
#getting the length of rows
data1 <- read.csv(file="D:\\Dropbox\\Sync Coding Computers\\Data Science Specialization\\R Programming\\Classwork\\hw1_data.csv")
newdata1 <- data.matrix(data1)
data1[47,"Ozone"]
missing <- is.na(data1[ ,"Ozone"])
ans <- missing[missing == TRUE] 
len <- length(ans)
len
```
```{r}
# Getting the mean of "Ozone" column
data1 <- read.csv(file="D:\\Dropbox\\Sync Coding Computers\\Data Science Specialization\\R Programming\\Classwork\\hw1_data.csv")
notna <- !is.na(data1[ ,"Ozone"])
data2 <- data1[notna == TRUE, "Ozone"]
mean(data2)
```



```{r}
# Getting the number of missing values in the dataset in the ozone column
data1 <- read.csv(file="D:\\Dropbox\\Sync Coding Computers\\Data Science Specialization\\R Programming\\Classwork\\hw1_data.csv")
isna <- is.na(data1[ ,"Ozone"])
data2 <- data1[isna == TRUE, "Ozone"]
length(data2)
```

```{r}
# Extract the subset of rows of the dataframe where Ozone values are above 31 and temp values >90
data1 <- read.csv(file="D:\\Dropbox\\Sync Coding Computers\\Data Science Specialization\\R Programming\\Classwork\\hw1_data.csv")

ozrows <- data1[data1$Temp>90, 1:5, drop = FALSE] 
oztemprows <- ozrows[ozrows$Ozone>31, 1:5]
solar <- oztemprows[ , "Solar.R"]
cleaned <- solar[!is.na(solar)]
solarmean <- mean(cleaned)
solarmean


``{r}

```

```{r}
#What is the mean of Temp when the Month == 6

data1 <- read.csv(file="D:\\Dropbox\\Sync Coding Computers\\Data Science Specialization\\R Programming\\Classwork\\hw1_data.csv")
data2 <- data1[data1$Month == 6, 1:5]
temps <- data2[ , "Temp"]
av <- mean(temps)
av
```
```{r}
# What is the maximum ozone value in the month of May

data1 <- read.csv(file="D:\\Dropbox\\Sync Coding Computers\\Data Science Specialization\\R Programming\\Classwork\\hw1_data.csv")
data2 <- data1[data1$Month == 5, 1:5]
ozone <- data2[ , "Ozone"]
cleaned <- ozone[!is.na(ozone)]
avg = max(cleaned)
avg

```


When you save the notebook, an HTML file containing the code and output will be saved alongside it (click the *Preview* button or press *Ctrl+Shift+K* to preview the HTML file).