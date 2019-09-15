# iris data
library(MASS)

# 5列目がlabelデータ
dataIris <- iris[,c(1,2,3,4)]

# ---- function ---- #
# global変数
x <- 10

# 永続代入(= global変数を変える) <<-
myfunc <- funfunction(){
  x <- 1
  x <<- 2 
  print(x)
}

myfunc() # myfuncの返り値
# > 1
x # global変数の値が変わる
# > 2


# ---- print ---- #
# cat (改行コード入れる)
# 2dim 
x <- matrix(1:12, ncol=6, nrow=2)

cat(x,"\n")
# ※ listをサポートしない
cat(y)

# ---- K-means ---- #
k_means <- kmeans(dataIris,3) # 3つのグループに分ける
plot(dataIris,col=k_means$cluster)

# ---- 集計関数 ---- #

# 相関係数
#cor(dataIris)
v <- c(4,5,2,3)
max(v)
which.min(v)


# ---- Data Frame ---- #

# 定義
data <- data.frame(
  "A" = c("a","aa","aaa"),
  "B" = c("b","bbb","bb")
)

# データの先頭
head(data)
# データの末尾
tail(data)


# ---- ベクトル集 ---- #
# : 連続した整数 1:3 -> 1,2,3
# rep(a,b) aをb個並べる
x <- c(1,2,3,4)
y <- c(1:5,3:1) # 1 2 3 4 5 3 2 1
z <- c(rep(3,4),rep(c(1,5,10),c(2,3,4))) # 3  3  3  3  1  1  5  5  5 10 10 10 10
a <- c("A","B","C")


# ---- 行列 ---- #
# nrow:行, ncol:列, byrow:TRUEで要素順を変更
m1 <- matrix(c(1:10),nrow = 2,ncol=5)
m2 <- matrix(c(1:10),2,byrow = TRUE)
m3 <- matrix(c(1,3,2,5,3,4),3,3,byrow = TRUE)

# 行列同士の掛け算
m3%*%m3
#solve(m3) できない


# ---- Plot ---- # 
# 変数の前に~が必要
# type:グラフの種類 bar:棒グラフ,box:箱ひげ図,scatter:散布図,pie:円グラフ,

library(plotly)
library(magrittr)
plot_ly(iris, x = ~Sepal.Length, y = ~Sepal.Width, color = ~Species, type = "scatter") %>%
  layout(title="Sample")

# 複数
#p1 <- plot_ly(...)
#p2 <- plot_ly(...)
#subplot(p1,p2,nrow=2)
# ---- 羽鳥 ---- #
library(ggmap)
library(magrittr)
hadley %>% ggimage



# ---- 3種の神器？？ ---- #
install.packages("devtools")
install.packages("roxygen2")
install.packages("testthat")



# @param : 引数の説明
# @return : 返り値の説明
# @export : 外から呼び出せるようにするパッケージ

# ---- 関数 ---- #

funcName <- function(str){
  cat("Hello",str,"\n")
  return(5*3)
}

funcName("Epson")


# ---- コマンド ---- #
CallCommand <- function(str){
  cat(str,"\n")
}

# 引数格納
arg1 <- commandArgs(trailigOnly = TRUE)[1]

CallCommand(arg1)


# ---- return ---- #
# 複数 (pythonみたいに一気にできない)
return(list(x,y))


# ---- Error ---- #
# Error in plot.new() : figure margins too large
# -> plot領域を増やす



# default引数は最後
# Console が + になったとき、Escキーで消せる



