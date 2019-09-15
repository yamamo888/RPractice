# @ import 
source("readData.R")
source("training.R")


# ------------------------------------------

# rate of importance 
RateImp <- function(){
  
  # only number of importance 
  numImp <- impData[[2]]
  
  for (i in 1:ncol(impData)){
    rate <- c(numImp[i] / numImpsum(numImp))
    rate <- append(rate,c)
  }
  
  
}


RecallPrecisionF1 <- function(){
  
  # recall
  for(i in 1:ncol(res)){
    recall <- (res[i,i] / sum(res[i,]))
    cat("recall", "\n", "No.", i, "\n", recall, "\n")
  }
  # ------------------------
  # precision
  for (k in 1:ncol(res)){
    precision <- res[k,k] / sum(res[,k])
    cat("precision", "\n", "No.", k, "\n", precision, "\n")
  }
  # ------------------------
  # F1
  for (j in 1:ncol(res)){
    c1 <- 2 * (recall[j] * precision[j])
    c2 <- recall[j] + precision[j]
    f1 <- c1 / c2
    cat("F1", "\n", "No.", j, "\n", f1, "\n")
  }
  
}


