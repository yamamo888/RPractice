# @import
library(plotly)
library(magrittr)
library(psych)

source("readData.R")
# ------------------------------------------
# @ param
# score vs ...
PLOTLIST <- c("score","max_g_speed","cor_all_angle_d_yz")


# ------------------------------------------
# Scatter 
plotScatter <- function(){
  dev.new()
  pltData <- del_nonquant_data[,PLOTLIST]
  pairs.panels(pltDATA)
  
}

# rate of importance
varImpPlot(model)


