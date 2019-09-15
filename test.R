CreateQuantitative <- function(data){
  
  for (dInd in length(data)){
    # 1. not integer & numeric (= delete "id")
    if (mode(data[,1]) != strNumeric || strInteger ){
      tmpnames <- names(data[dInd])
      # + not integer
      NONQUANT <- append(tmpnames)
    # 2. not all 0 or 1 rows (= delete "flag" & "recode")
    } else (all(data[names(data)[dInd]]) == 0 || 1){
      tmpnames <- names(data[dInd])
      # + not all 0 or 1
      NONQUANT <- append(tmpnames)
    }
  }

  # delete not quantitative rows
  del_quant_data <- select(data, -one_of(NONQUANT))
  
  return(del_quant_data) 
}