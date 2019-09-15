library(MASS)


# ---- 以下 型の説明 ---- #
# Rのオブジェクトはtype,mode,classの3種類の方が存在
# type
#データを保存できる変数のオブジェクトに対する型
# ex) ベクトル型,リスト型
# mode
# オブジェクトに格納されている要素に対する型
# ex) 理論型,実数型,文字型,関数型
# class
# オブジェクトの属性に対する型
# ex) 行列型,因子型,データフレーム型
# clasが定義されていない場合は、mode,typeの方を継承
# ------------ #

# ---- 型調べる ---- #
typeof(iris)
mode(iris)
class(iris)
# dataframeの型を一気に調べるとき
sapply(iris, class)

# ------------ #


# ---- データ型の判定 ---- #
x <- c(1,2,3,4,5)

# 1
if (mode(x) == "numeric"){
  print("numeric!")
} else{
  print("???")
}

# 2
if (is.numeric(x)){
  print("numeric!")
} else{
  print("???")
}
# ------------ #

# ---- is系の関数 ---- #

# 実数
is.numeric()
# 整数
is.integer()
# 文字列
is.character()
# 真偽値(Rでは理論値？)
is.logical()
#...
# ------------ #

# ---- 変換 ---- #
# 書きかけ
#as

# ------------ #

# ---- append ---- #
x <- c(1,2,3)
y <- c(4,5,6)
# 末尾にくっつける
# after でくっつけ位置指定可能
append(x,y)















# 列の定義調べる
str(iris)


iris[1,]