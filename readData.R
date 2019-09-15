# @import
library(dplyr)

# ------------------------------------------

# @param
# defalut del value
DEFAULTNUM <- 100 
# min class
MINCLASS <- 70

# del row list (not str)
DELNAMES <- c("r_ad_li_a", "r_imp_li_a")
# not quantitative row liFst
NONQUANTNAMES <- c("o_v","id","flag","d_model","dummy","int64_field_0")
# class width
#CLASSWIDTH <- commandArgs(trailingOnly = TRUE)[1]
CLASSWIDTH <- 20
# rate of train data
TRAINRATIO <- 0.7

# ------------------------------------------
# @path
# correlation coefficient
ccPath <- "ccData.csv"
score_ccPath <- "score_ccData.csv"
modelPath <- "model.csv"

# ------------------------------------------

# Load data 列名がある場合->T
golf.data <- read.csv("golf.csv", header = T)

# --- データ特性 --- #
# 行数
#nrow(golf.data)
# 列数
#ncol(golf.data)
# 行列の大きさ
#dim(golf.data)
# NAの状況把握(元)
#summary(golf.data)

# ------------------------------------------
# @ return
# デフォルト値(100)とNAが多いrowを消した元データの"golf.data"のdataframe
DeleteNaN <- function(raw_data,DELNAMES,DEFAULTNUM=100){
  
  # Select out data
  nonna <- subset(raw_data, golf.data$flag == 0)
  # Deleat default = 100 
  del_nan_data <- subset(nonna, nonna$score != DEFAULTNUM)
  # Deleat NA rows
  del_nan_data <- select(del_nan_data, -one_of(DELNAMES))
  
  return(del_nan_data)
}


# ------------------------------------------
# @ return
# csv files
MakeCSV <- function(data,path){
  write.csv(data,path)
}

# ------------------------------------------
# @ return
# カテゴリ変数を含むデータセット
score2factor <- function(data,CLASSWIDTH){
  # only score data
  scores <- data$score 
  # class
  CLASSNUM <- seq(MINCLASS, max(scores), CLASSWIDTH)
  # score cls
  data$score <- as.factor(cut(scores, CLASSNUM, include.lowest = TRUE))  
  
  return(data)
}

# ------------------------------------------
# @ return
# train & test data, list
splitTrainTest <- function(data){
  # 毎回同じデータを選択するため
  set.seed(0)
  # number of data
  nData <- nrow(data)
  # number of train data
  nTrain <- sample(nData,floor(nData * TRAINRATIO))
  # split data
  train <- data[nTrain,]
  test <- data[-nTrain,]
  
  return(list(train,test))
}


# ------------------------------------------
# Call data
non_na_data <- DeleteNaN(golf.data, DELNAMES=DELNAMES, DEFAULTNUM=DEFAULTNUM)
# Call only quantitative data
del_nonquant_data <- select(non_na_data, -one_of(NONQUANTNAMES))

# category of not?
# sapply(del_nonquant_data,class)

# ------------------------------------------

# ---- deta analics ---- #
# correlation coefficient all data vs, dataframe
cor_all <- as.data.frame(cor(del_nonquant_data))
# correlation coefficient score vs ..., dataframe
cor_score <- as.data.frame(cor(del_nonquant_data$score,del_nonquant_data))
# sort decreace (1=score)
sort_cor_score <- order(cor_score, decreasing = T)

# 上位
scoreplusInd <- sort_cor_score[2:4]
# 下位
scoreminusInd <- sort_cor_score[70:71]

# ------------------------------------------

# with category train & test data-set
xydata <- score2factor(del_nonquant_data,CLASSWIDTH)

# 1: train data-set, 2:test data-set
trtedata <- splitTrainTest(xydata)


# ---- Save ---- #
# Save csv score vs ...
#MakeCSV(cor_score, score_ccPath)
# Save csv all data vs ...
#MakeCSV(cor_all, ccPath)
# train & test data-set 
#MakeCSV(xydata,modelPath)


# NAの状況把握(NA取り除き後)
#summary(data)
