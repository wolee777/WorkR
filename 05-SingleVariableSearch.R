#
# 단일변수 자료의 탐색
#
# 단일변수 범주형 자료의 탐색
favorite <- c( 'WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
               'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING' )
favorite
table( favorite )
table( favorite ) / length( favorite )

ds <- table( favorite )
ds
barplot( ds, main = 'favorite season' )

ds.new <- ds[ c( 2, 3, 1, 4 ) ]
ds.new
barplot( ds.new, main = 'favorite season' )

pie( ds, main = 'favorite season' )
pie( ds.new, main = 'favorite season' )

favorite.color <- c( 2, 3, 2, 1, 1, 2, 2, 1, 3, 2, 1, 3, 2, 1, 2 )
ds <- table( favorite.color )
ds
barplot( ds, main = 'favorite color' )

colors <- c( 'green', 'red', 'blue' )
names( ds ) <- colors
ds
barplot( ds, main = 'favorite color', col = colors )
pie( ds, main = 'favorite color', col = colors )

# 단일변수 연속형 자료의 탐색
weight <- c( 60, 62, 64, 65, 68, 69 )
weight.heavy <- c( weight, 120 )
weight
weight.heavy

# 평균
mean( weight )
mean( weight.heavy )

# 중앙값
median( weight )
median( weight.heavy )

# 절사평균
mean( weight, trim = 0.2 )
mean( weight.heavy, trim = 0.2 )

# 사분위수
mydata <- c( 60, 62, 64, 65, 68, 69, 120 )
quantile( mydata )
quantile( mydata, ( 0:10 ) / 10 )

# 사분위수를 구할 때 가장 일반적인 함수
summary( mydata )

# 산포
# 분산
var( mydata )

# 표준편차
sd( mydata )

# 값의 범위(최대값과 최소값 출력)
range( mydata )

# 최대값과 최소값의 차이
diff( range( mydata ) )

# histogram - 연속형 자료의 분포를 시각화
#             연속형 자료에서는 구간을 나누고 구간에 속한 값들의 개수를 세는 방법을 사용
dist <- cars[ ,2 ]
hist( dist, main = "Histogram for 제동거리", 
      xlab = "제동거리", ylab = "빈도수",
      border = "blue", col = "green", 
      las = 2, breaks = 5 )

# 상자그림( box plot, 상자 수염 그림 box and whisker plot )
#         사분위수를 시각화하여 그래프 형태로 나타낸 것
#         상자그림은 하나의 그래프로 데이터의 분포 형태를 포함한 다양한 정보를 전달하기
#         때문에 단일변수 수치형 자료를 파악하는데 자주 사용
#         자료의 전반적인 분포를 이행하는데 도움이 되지만 구체적인 최소/최대/중앙값을 알기는 어렵다
dist <- cars[ , 2 ]
boxplot( dist, main = "자동차 제동거리" )

# 최소값, 최대값, 중앙값, 특이값등의 정확한 값을 알고자 할 때 사용
boxplot.stats( dist )
boxplot.stats( dist )$stats     # 정상범위 자료의 4분위수에 해당하는 값들이 표시, 최소값, 1사분위수, 중앙값, 3사분위수, 최대값
boxplot.stats( dist )$n         # 자료에 있는 관측값의 개수
boxplot.stats( dist )$conf      # 중앙값에 관련된 신뢰 구간
boxplot.stats( dist )$out       # 특이값 목록

# 단일변수 자료중 그룹이 있는 자료의 상자그림
boxplot( Petal.Length~Species, data = iris, main = "품종별 꽃잎의 길이" )
boxplot( iris$Petal.Length~iris$Species, main = "품종별 꽃잎의 길이" )

# 한 화면에 그래프 여러 개 출력하기
par( mfrow = c( 1, 3 ) )            # 1 X 3 가상화면 분활
barplot( table( mtcars$carb ), main = "Barplot of Carburetors", 
         xlab = "#of carburetors", ylab = "frequency", 
         col = "blue" )
barplot( table( mtcars$cyl ), main = "Barplot of Cylender", 
         xlab = "#of cylender", ylab = "frequency", 
         col = "red" )
barplot( table( mtcars$gear ), main = "Barplot of Gear", 
         xlab = "#of gears", ylab = "frequency", 
         col = "green" )
par( mfrow = c( 1, 1 ) )            # 가상화면 분할 해제

