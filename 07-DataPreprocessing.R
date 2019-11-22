#
# 데이터 전처리(Data Preprocessing)
#
# 결측값(missing value)
#
# 벡터의 결측값 처리
# 결측값의 특성과 존재 여부 확인
z <- c( 1, 2, 3, NA, 5, NA, 8 )
sum( z )                    # 정상 계산 안 됨 
is.na( z )                  # NA 여부 확인
sum( is.na( z ) )           # NA 개수 확인
sum( z, na.rm = TRUE )      # NA를 제외하고 합계 계산

# 결측값 대체 및 제거
z1 <- c( 1, 2, 3, NA, 5, NA, 8 )
z2 <- c( 5, 8, 1, NA, 3, NA, 7 )
z1[ is.na( z1 ) ] <- 0              # NA를 0으로 치환
z1
z3 <- as.vector( na.omit( z2 ) )    # NA를 제거하고 새로운 벡터 생성
z3

# 매트릭스와 데이터프레임의 결측값 처리
x <- iris
x[ 1, 2 ] <- NA
x[ 1, 3 ] <- NA
x[ 2, 3 ] <- NA
x[ 3, 4 ] <- NA
head( x )

# 데이터프레임의 열별 결측값 확인
# for문 이용
for ( i in 1:ncol( x ) ) {
  this.na <- is.na( x[ , i ] )
  cat( colnames( x )[ i ], "\t", sum( this.na ), "\n" )
}

# apply 이용
col_na <- function( y ) {
  return( sum( is.na( y ) ) )
}

na_count <- apply( x, 2, FUN = col_na )
na_count

# 데이터프레임의 행별 결측값 확인
rowSums( is.na( x ) )
sum( rowSums( is.na( x ) ) > 0 )

sum( is.na( x ) )

# 결측값을 제외하고 새로운 데이터셋 만들기
head( x )
x[ !complete.cases( x ), ]          # NA가 포함된 행들 출력
y <- x[ complete.cases( x ), ]      # NA가 포함된 행들 제거
head( y )

# 특이값(outlier), 이상치
#
# 상자그림을 통한 특이값 확인
st <- data.frame( state.x77 )
boxplot( st$Income )
boxplot.stats( st$Income )$out

# 특이값을 포함한 행 제거
out.val <- boxplot.stats( st$Income )$out       # 특이값 추출
st$Income[ st$Income %in% out.val ] <- NA       # 특이값을 NA로 대체
head( st )
newdata <- st[complete.cases( st ), ]           # NA가 포함된 행 제거
head( newdata )

#
# 데이터 정렬
#
# 벡터 정렬
v1 <- c( 1, 7, 6, 8, 4, 2, 3 )
order( v1 )
v1 <- sort( v1 )                                # 오름차순
v1
v2 <- sort( v1, decreasing = T )                # 내림차순
v2

# 매트릭스와 데이터프레임 정렬
head( iris )
order( iris$Sepal.Length )
iris[ order( iris$Sepal.Length ), ]                   # 오름차순 정렬
iris[ order( iris$Sepal.Length, decreasing = T ), ]   # 내림차순 정렬
iris.new <- iris[ order( iris$Sepal.Length ), ]       # 정렬된 데이터 저장
head( iris.new )
iris[ order( iris$Species, decreasing = T, iris$Petal.Length ), ]   # 정렬 기준이 2개

#
# 데이터 분리와 선택
#
# 데이터 분리
sp <- split( iris, iris$Species )
sp
summary( sp )
sp$setosa

# 데이터 선택
subset( iris, Species == "setosa" )
subset( iris, Sepal.Length > 7.5 )
subset( iris, Sepal.Length > 5.1 & Sepal.Width > 3.9 )
subset( iris, Sepal.Length > 7.6, select = c( Petal.Length, Petal.Width ) )

#
# 데이터 샘플링과 조합
#
# 데이터 샘플링
#
# 숫자를 임의로 추출하기
x <- 1:100
y <- sample( x, size = 10, replace = FALSE )      # 비복원추출
y

# 행을 임의로 추출
idx <- sample( 1:nrow( iris ), size = 50, replace = FALSE )
iris.50 <- iris[ idx, ]
dim( iris.50 )
head( iris.50 )

# set.seed() 함수 이해
sample( 1:20, size = 5 )                          # 함수 실행시마다 다른 결과
sample( 1:20, size = 5 )
sample( 1:20, size = 5 )

set.seed( 100 )                                   # 동일한 결과를 sample() 결과 출력 설정
sample( 1:20, size = 5 )
set.seed( 100 )
sample( 1:20, size = 5 )
set.seed( 100 )
sample( 1:20, size = 5 )

# 데이터 조합
combn( 1:5, 3 )                                   # 1~5에서 3개를 뽑는 조합

x = c( "red", "green", "blue", "black", "white" )
com <- combn( x, 2 )
com

for ( i in 1:ncol( com ) ) {
  cat( com[ ,i ], "\n" )
}

#
# 데이터 집계와 병합
#
# 데이터 집계
#
# iris 데이터셋에서 각 변수의 품종별 평균 출력
agg <- aggregate( iris[ , -5 ], by = list( iris$Species ), FUN = mean )
agg

# iris 데이터셋에서 각 변수의 품종별 표준편차 출력
agg <- aggregate( iris[ , -5 ], by = list( 표준편차 = iris$Species ), FUN = sd )
agg

# mtcars 데이터셋에서 각 변수의 최댓값 출력
head( mtcars )
agg <- aggregate( mtcars, by = list( cyl = mtcars$cyl, vs = mtcars$vs ), FUN = max )
agg

# 데이터 병합
x <- data.frame( name = c( "a", "b", "c" ), math = c( 90, 80, 40 ) )
y <- data.frame( name = c( "a", "b", "d" ), korean = c( 75, 60, 90 ) )
x
y

z <- merge( x, y, by = c( "name" ) )
z

merge( x, y )

merge( x, y, all.x = T )
merge( x, y, all.y = T )
merge( x, y, all = T )

x <- data.frame( name = c( "a", "b", "c" ), math = c( 90, 80, 40 ) )
y <- data.frame( sname = c( "a", "b", "d" ), korean = c( 75, 60, 90 ) )
x
y
merge( x, y, by.x = c( "name" ), by.y = c( "sname" ) )
