#
# R 문장
#
5 + 8
3 + ( 4 * 5 )
a <- 10
print( a )

#
# 변수와 산술 연산
#
# 산술 연산자
3 + 5 + 8
9 - 3
7 * 5
8 / 3
8 %% 3
2 ^ 3                 # 2의 세제곱

# 산술 연산 함수
log( 10 ) + 5         # 로그함수
log( 10, base = 2 )
sqrt( 25 )            # 제곱근
max( 5, 3, 2 )        # 가장 큰 값
min( 3, 9, 5 )        # 가장 작은 값
abs( -10 )            # 절대값
factorial( 5 )        # 팩토리얼
sin( pi / 2 )         # 삼각함수

# 변수
a <- 10
b <- 20
c <- a + b
print( c )

# 변수 내용 확인
a <- 125
a
print( a )

# 변수값 변경
a <- 10
b <- 20
a + b
a <- "A"
a + b

# <- 대신 = 사용
a = 10
b = 20
c = a + b
a
b
c

#
# 벡터
#
# 벡터 생성
x <- c( 1, 2, 3 )                   # 숫자형 벡터
y <- c( "a", "b", "c" )             # 문자형 벡터
z <- c( TRUE, TRUE, FALSE, TRUE )   # 논리형 벡터
x
y
z

# 벡터는 동일자료형으로만 구성
w <- c( 1, 2, 3, "a", "b","c" )
w

# 연속적인 숫자로 구성된 벡터 생성
v1 <- 50:90
v1
v2 <- c( 1, 2, 3, 50:90 )
v2

# 일정 간격의 숫자로 이루어진 벡터 생성
v3 <- seq( 1, 101, 3 )
v3
v4 <- seq( 0.1, 1.0, 0.1 )
v4

# 반복된 숫자로 이루어진 벡터 생성
v5 <- rep( 1, times = 5 )
v5
v6 <- rep( 1:5, times = 3 )
v6
v7 <- rep( c( 1, 5, 9 ), times = 3 )
v7

# 벡터 원소값에 이름 지정
score <- c( 90, 85, 70 )
score
names( score )
names( score ) <- c( "Hong", "Kim", "Nam" )
names( score )
score

# 벡터에서 원소값 추출
d <- c( 1, 4, 3, 7, 8 )
d[ 1 ]
d[ 2 ]
d[ 3 ]
d[ 4 ]
d[ 5 ]
d[ 6 ]

# 벡터에서 여러 개의 값을 한번에 추출
d <- c( 1, 4, 3, 7, 8 )
d[ c( 1, 3, 5 ) ]
d[ 1:3 ]
d[ seq( 1, 5, 2 ) ]
d[ -2 ]
d[ -c( 3:5 ) ]

# 벡터에서 이름으로 값을 추출
GNP <- c( 2090, 2450, 960 )
GNP
names( GNP ) <- c( "Korea", "Japan", "Nepal" )
GNP
GNP[ 1 ]
GNP[ "Korea" ]
GNP[ c( "Korea", "Nepal" ) ]

# 벡터에 저장된 원소값 변경
v1 <- c( 1, 5, 7, 8, 9 )
v1
v1[ 2 ] <- 3
v1
v1[ c( 1, 5 ) ] <- c( 10, 20 )
v1

# 벡터 연산
d <- c( 1, 4, 3, 7, 8 )
2 * d
d - 5
3 * d + 4

# 벡터와 벡터간의 연산
x <- c( 1, 2, 3 )
y <- c( 4, 5, 6 )
x + y
x * y
z <- x + y
z

# 벡터에 적용가능한 함수
d <- c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 )
sum( d )                                  # 벡터에 포함된 값들의 합
sum( 2 * d )
length( d )                               # 벡터에 포함된 값들의 개수(길이)
mean( d[ 1:5 ] )                          # 벡터에 포함된 값들의 평균
mean( d )
median( d[ 1:5 ] )                        # 벡터에 포함된 값들의 중앙값
median( d )
max( d )                                  # 벡터에 포함된 값들의 최댓값
min( d )                                  # 벡터에 포함된 값들의 최소값
sort( d )                                 # 벡터에 포함된 값들의 정렬(오름차순이 기본)
sort( d, decreasing = FALSE )             # 오름차순 정렬
sort( d, decreasing = TRUE )              # 내림차순 정렬
range( d )                                # 벡터에 포함된 값들의 범위(최소값~최댓값)
var( d )                                  # 벡터에 포함된 값들의 분산
sd( d )                                   # 벡터에 포함된 값들의 표준편차

v1 <- median( d )
v1
v2 <- sum( d ) / length( d )
v2

# 벡터에 논리연산자 적용
d <- c( 1, 2, 3, 4, 5, 6, 7, 8, 9 )
d >= 5
d[ d > 5 ]
sum( d > 5 )
sum( d[ d > 5 ] )
d == 5

condi <- d > 5 & d < 8
condi
d[ condi ]

# 여러 개의 벡터를 합쳐 새로운 벡터 만들기
x <- c( 1, 2, 3 )
x
y <- c( 4, 5 )
y
c( x, y )

#
# 리스트(list)와 팩터(factor)
#
# 리스트
ds <- c( 90, 85, 70, 84 )
my.info <- list( name = 'Hong', age = 60, status = TRUE, score = ds )
my.info
my.info[[ 1 ]]
my.info$name
my.info[[ 4 ]]

# 팩터(factor)
bt <- c( 'A', 'B', 'B', 'O', 'AB', 'A' )
bt.new <- factor( bt )
bt
bt.new
bt[ 5 ]
bt.new[ 5 ]
levels( bt.new )
as.integer( bt.new )
bt.new[ 7 ] <- 'B'
bt.new[ 8 ] <- 'C'
bt.new
