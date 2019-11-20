#
# 매트릭스와 데이터프레임
#
# 매트릭스 만들기(열 우선)
z <- matrix( 1:20, nrow = 4, ncol = 5 )
z

# 매트릭스에 저장될 값들을 행방향으로 채우기(행 우선)
z2 <- matrix( 1:20, nrow = 4, ncol = 5, byrow = T )
z2

# 기존 매트릭스에 벡터를 추가하여 새로운 매트릭스 만들기
x <- 1:4
x
y <- 5:8
y
z <- matrix( 1:20, nrow = 4, ncol = 5 )
z

m1 <- cbind( x, y )         # x와 y를 열 방향으로 결합하여 매트릭스 생성
m1
m2 <- rbind( x, y )         # x와 y를 행 방향으로 결합하여 매트릭스 생성
m2
m3 <- rbind( m2, x )        # 매트릭스 m2와 벡터 x를 행 방향으로 결합
m3
m4 <- cbind( z, x )         # 매트릭스 z와 벡터 x를 열 방향으로 결합
m4 

# 매트릭스에서의 값 추출
z <- matrix( 1:20, nrow = 4, ncol = 5 )
z

z[ 2, 3 ]
z[ 1, 4 ]
z[ 2, ]
z[ ,4 ]

# 매트릭스에서 여러 개의 값을 동시에 추출
z[ 2, 1:3 ]
z[ 1, c( 1, 2, 4 ) ]
z[ 1:2, ]
z[ , c( 1, 4 ) ]

# 매트릭스의 행과 열에 이름 지정
score <- matrix( c( 90, 85, 69, 78, 
                    85, 96, 49, 95,
                    90, 80, 70, 70 ),
                    nrow = 4, ncol = 3 )
score
rownames( score ) <- c( 'Hong', 'Kim', 'Lee', 'Yoo' )
colnames( score ) <- c( 'English', 'Math', 'Science' )
score

# 행과 열에 지정한 이름을 이용하여 매트릭스값 추출하기
score[ 'Hong', 'Math' ]
score[ 'Kim', c( 'Math', 'Science' ) ]
score[ 'Lee', ]
score[ , 'English' ]
rownames( score )
colnames( score )
colnames( score )[ 2 ]

#
# 데이터 프레임
#
# 데이터 프레임 만들기
city <- c( "Seoul", "Tokyo", "Washington" )
rank <- c( 1, 3, 2 )
city.info <- data.frame( city, rank )
city.info

#
# 내장 dataset 확인
#
data()                                        # 현재 Load된 Package에 따라, 이용할 수 있는 데이터셋 목록
help( iris )                                  # 데이터셋 설명

library( MASS )                               # 데이터셋 Load
library( help = 'datasets' )                  # 'datasets' Package에 있는 데이터셋 목록
data( package = "MASS" )                      # 특정 Package(로드 유무와 상관없음)

#
# iris 데이터셋
#
iris

iris[ , c( 1:2 ) ]                            # 1, 2열의 모든 데이터
iris[ , c( 1, 3, 5 ) ]                        # 1, 3, 5열의 모든 데이터
iris[ , c( "Sepal.Length", "Species" ) ]      # 1, 5열의 모든 데이터
iris[ 1:5, ]                                  # 1 ~ 5행의 모든 데이터
iris[ 1:5, c( 1, 3 ) ]                        # 1 ~ 5행의 데이터 중 1, 3열의 데이터

#
# 매트릭스와 데이터프레임 다루기
#
# 데이터셋 기본 정보 확인
dim( iris )                                   # 행과 열의 개수 출력
nrow( iris )                                  # 행의 개수 출력
ncol( iris )                                  # 열의 개수 출력
colnames( iris )                              # 열 이름 출력, names()와 결과 동일
head( iris )                                  # 데이터셋의 앞부분 일부 출력
tail( iris )                                  # 데이터셋의 뒷부분 일부 출력
str( iris )                                   # 데이터셋 요약 정보 보기

iris[ , 5 ]                                   # 품종 데이터 보기
unique( iris[ , 5 ] )                         # 품종의 종류 보기(중복 제거)
table( iris[ , "Species" ] )                  # 품종의 종류별 행의 개수 세기

# 매트릭스와 데이터프레임에사 사용하는 함수
# 행별, 열별 합계와 평균 계산
colSums( iris[ , -5 ] )                       # 열별 합계
colMeans( iris[ , -5 ] )                      # 열별 평균
rowSums( iris[ , -5 ] )                       # 행별 합계
rowMeans( iris[ , -5 ] )                      # 행별 평균

# 행과 열의 방향 전환
z <- matrix( 1:20, nrow = 4, ncol = 5 )
z
t( z )                                        # 행과 열 방향 전환

# 조건에 맞는 행과 열의 값 추출(subset() : 데이터프레임에서만 가능)
IR.1 <- subset( iris, Species == "setosa" )
IR.1
IR.2 <- subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0 )
IR.2
IR.2[ , c( 2, 4 ) ]

# 매트릭스와 데이터프레임에 대한 산술연산
a <- matrix( 1:20, 4, 5 )
b <- matrix( 21:40, 4, 5 )
a
b

2 * a
b - 5
2 * a + 3 * b

a + b
b - a
b / a
a * b

a <- a * 3
b <- b - 5
a
b

# 매트릭스와 데이터프레임의 자료구조 확인
class( iris )                                 # iris 데이터셋의 자료구조 확인
class( state.x77 )                            # state.x77 데이터셋의 자료구조 확인
is.matrix( iris )                             # 데이터셋이 매트릭스인지 확인하는 함수
is.data.frame( iris )                         # 데이터셋이 데이터프레임인지 확인하는 함수
is.matrix( state.x77 )
is.data.frame( state.x77 )

# 매트릭스와 데이터프레임의 자료구조 변환
st <- data.frame( state.x77 )
str( st )
head( st )
class( st )

iris.m <- as.matrix( iris[ , 1:4 ] )
head( iris.m )
class( iris.m )

# 데이터프레임의 열 추출
iris[ , "Species" ]                           # 결과 : 벡터, 매트릭스와 데이터프레임 모두 가능
iris[ , 5 ]                                   # 결과 : 벡터, 매트릭스와 데이터프레임 모두 가능
iris[ "Species" ]                             # 결과 : 데이터프레임, 데이터프레임만 가능
iris[ 5 ]                                     # 결과 : 데이터프레임, 데이터프레임만 가능
iris$Species                                  # 결과 : 벡터, 데이터프레임만 가능

#
# 파일 데이터 읽기 / 쓰기
#
# 파일 형식 변환
setwd( "H:/Workspace/Workspace-R/WorkR" )
air <- read.csv( "airquality.csv", header = T )
head( air )

setwd( "H:/Workspace/Workspace-R/WorkR" )
my.iris <- subset( iris, Species = 'Setosa' )
write.csv( my.iris, "my_iris.csv", row.names = F )
