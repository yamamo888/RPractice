# @import 
library(dplyr)
library(randomForest)
library(e1071)

source("readData.R")

# @ path
impPath <- "importanceRate.csv"

# ------------------------------------------
# @param
# 相関係数のtop2(1番正に高い & 1番負に高い)
DELEXPNAMES <- c(names(del_nonquant_data)[54],names(del_nonquant_data)[20],"score")
# 寄与度(=重要度)を反映したモデル
# 1. /.csv(重要度計算したcsv)を読み取る(double型), 1:category, 2.rate of importance
impData <- read.csv(impPath, header=T)
DELEXPNAMES_BYIMP <- c(as.character(impData[[1]]))
# ------------------------------------------

# train & test data-set
trdata <- as.data.frame(trtedata[1]) 
tedata <- as.data.frame(trtedata[2]) 

# ------------------------------------------
# target & explanatory part of all data
#trainX <- select(trdata, one_of(DELEXPNAMES))

#testX <- select(tedata, one_of(DELEXPNAMES))
#testY <- tedata$score
# ------------------------------------------
trainX <- select(trdata, one_of(DELEXPNAMES_BYIMP[1:5],"score"))

testX <- select(tedata, one_of(DELEXPNAMES_BYIMP[1:5]),"score")
testY <- tedata$score
# ------------------------------------------

# Train Random Forest
# @ return
# predicted Y
modelRF <- function(trxy,texy,tey){
  
  # Train 
  # [Args] 1: names of target, 2: all train data 
  model <- randomForest(score ~., data=trxy)
  
  # Predict
  pred <- predict(model,texy)
  
  # importance rate of explanatory
  print(importance(model))
  
  return(pred)
}
# ------------------------------------------
# grid search for Random Forest
gridRF <- function(x,y){
  # mtreeTry: number of tree (width)
  # mtryStart: depth of tree (height)
  for (i in seq(10,500,10)){
    # Save png
    treepath = paste("depth","00",i,".png",sep="")
    png(treepath)
    # grid search
    print(system.time(tuneRF(testX,testY,mtryStart=i,doBest=TRUE)))
    dev.off()
  }
  
}
# ------------------------------------------

modelSVM <- function(trxy,texy,tey){
  # training
  model <- svm(score ~., data=trxy)
  # prediction
  pred <- predict(tey, texy)
  
  return(model)
}
# ------------------------------------------

results <- function(pred,gt){
  res <- table(pred,gt)
  # accuracy
  accuracy <- sum(diag(res) / sum(res))
  
  cat("test result table", res, "\n")
  cat("test accuray", accuracy, "\n")

}


# ------------------------------------------
# Call
# training & prediction for Random Forest
# predRF <- randomForestModel(trdata,tedata,testY)
# predRF <- modelRF(trainX,testX,testY)
# grid search hyper parameters
#gsRF <- gridRF(testX,testY)
# training & prediction for Support Vector Machine 
predSVM <- modelSVM(trainX,testX,testY)
# ------------------------------------------

# ------------------------------------------
# results for Random Forest
#resultRF <- results(predRF,testY)

# results for Support Vector Machine
resultSVM <- results(predSVM,testY)

# ------------------------------------------


