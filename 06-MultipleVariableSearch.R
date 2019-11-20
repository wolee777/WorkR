#
# 다중변수 자료의 탐색
#
# 두 변수 사이의 산점도
# 산점도(scatter plot) - 2개의 변수로 구성된 자료의 분포를 알아보는 그래프
#                        관측값들의 분포를 통해 2개의 변수 사이의 관계를 파악할 수 있는 기법
#                        산점도는 관측값들의 분포를 보면서 두 변수 사이의 관련성을 확인하는 데 사용
wt <- mtcars$wt         # 중량 자료
mpg <- mtcars$mpg       # 연비 자료
plot( wt, mpg, main = "중량-연비 그래프",
      xlab = "중량", ylab = "연비(MPG)", 
      col = "red", pch = 19 )

# 여러 변수들 간의 산점도
  vars <- c( "mpg", "disp", "drat", "wt" )        # 대상 변수
  target <- mtcars[ , vars ]
  head( target )
  pairs( target, main = "Multi Plots" )

# 그룹 정보가 있는 두 변수의 산점도
#       두 개의 변수에 대한 산점도를 작성할 때 만일 그룹 정보를 알고 있다면
#       산점도 작성 시 각 그룹별 관측값들에 대해 서로 다른 색과 점의 모양으로 표시할 수 있다.
#       이렇게 작성된 산점도는 두 변수 간의 관계뿐만 아니라 그룹 간의 관계도 파악할 수 있어서 편리
iris.2 <- iris[ , 3:4 ]
point <- as.numeric( iris$Species )
point
color <- c( "red", "green", "blue" )
plot( iris.2, main = "Iris plot",
      pch = c( point ), col = color[ point ] )

# 상관분석 - 얼마나 선형성을 보이는지 수치상으로 나타낼 수 있는 방법
#            두 변수 x와 y 사이읭 선형성 정도를 측정하는 방법
#            상관계수는 선형성의 정도를 나타내는 척도(보통 r로 표기, 피어슨 상관계수 Pearson's correlation coefficient)
#            상관계수 성질
#            -1 <= r <= 1
#            r > 0 : 양의 상관계수( x가 증가하면 y도 증가 )
#            r < 0 : 음의 상관계수( x가 증가하면 y는 감소 )
#            r이 1이나 -1에 가까울수록 x, y의 상관성이 높다
#            상관계수값이 1이나 -1에 가까울수록 관측값들의 분포가 직선에 가까워지다는 것을 알 수 있다.
#            상관계수값이 0.5보다 크거나 -0.5보다 작으면 두 변수의 상관성이 높다고 판단할 수 있다.
beers <- c( 5, 2, 9, 8, 3, 7, 3, 5, 3, 5 )
bal <- c( 0.1, 0.03, 0.19, 0.12, 0.04, 0.0095, 0.07, 0.06, 0.02, 0.05 )
tbl <- data.frame( beers, bal )
tbl
plot( bal~beers, data = tbl )             # 산점도
res <- lm( bal~beers, data = tbl )        # 회귀식 도출(y = ax + b형태의 1차식)
abline( res )                             # 회귀선 그리기(회귀선 : 관측값의 추세를 가장 잘 나타낼 수 있는 선)
cor( beers, bal )                         # 상관계수 계산 

cor( iris[ , 1:4 ] )                      # 여러 변수에 대한 상관계수 계산

# 선 그래프
#       다중변수 자료의 변수 중 하나가 연월일과 같이 시간을 나타내는 값을 갖는 경우 X축을 시간출으로 하여
#       선 그래프를 그리면 시간의 변화에 따른 자료의 증감 추이를 쉽게 확인할 수 있다.
#       시간의 변화데 따라 자료를 수집한 경우 이를 시계열 자료(times series data)라 한다.
month <- 1:12
late <- c( 5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4 )
plot( month, late, main = "지각생 통계",
      type = "l", lty = 1, lwd = 1,
      xlab = "Month", ylab = "Late cnt" )

plot( month, late, main = "지각생 통계",
      type = "b", lty = 1, lwd = 1,
      xlab = "Month", ylab = "Late cnt" )

plot( month, late, main = "지각생 통계",
      type = "o", lty = 1, lwd = 1,
      xlab = "Month", ylab = "Late cnt" )

# 복수의 선 그래프
late1 <- c( 5, 8, 7, 9, 4, 6, 12, 13, 8, 6, 6, 4 )
late2 <- c( 4, 6, 5, 8, 7, 8, 10, 11, 6, 5, 7, 3 )
plot( month, late1, main = "Late Students",
      type = "b", lty = 1, col = "red",
      xlab = "Month", ylab = "Late cnt", ylim = c( 1, 15 ) )
lines( month, late2, type = "b", col = "blue" )

#
# 자료 탐색 실습 - 탐색적 데이터 분석
#
# BostonHousing 데이터셋 이용( mlbench package )
#
# 1단계 : 분석 대상 데이터셋 준비
#
library( mlbench )
data( "BostonHousing" )
myds <- BostonHousing[ , c( "crim", "rm", "dis", "tax", "medv" ) ]

#
# 2단계 : grp 변수 추가
#
grp <- c()
for ( i in 1:nrow( myds ) ) {
  if ( myds$medv[ i ] >= 25.0 ) {
    grp[ i ] <- "H"
  } else if ( myds$medv[ i ] <= 17.0 ) {
    grp[ i ] <- "L"
  } else {
    grp[ i ] <- "M"
  }
}
grp <- factor( grp )                                # 문자 벡터를 팩터 타입으로 변환
grp <- factor( grp, levels = c( "H", "M", "L" ) )   # 레벨의 순서를 H, L, M -> H, M, L
myds <- data.frame( myds, grp )                     # myds에 grp 열 추가

#
# 3단계 : 데이터셋의 형태와 기본적인 내용 파악
#
str( myds )
head( myds )
table( myds$grp )                                   # 주택 가격 그룹별 분포

#
# 4단계 : 히스토그램에 의한 관측값의 분포 확인
#
#         관측값들의 분포가 종 모양의 정규분포가 아니면 분포에 대한 해석이 필요
par( mfrow = c( 2, 3 ) )                            # 2 X 3 가상화면 분할
for ( i in 1:5 ) {
  hist( myds[ , i ], main = colnames( myds )[ i ], col = "yellow" )
}
par( mfrow = c( 1, 1 ) )                            # 2 X 3 가상화면 분할 해제

#
# 5단계 : 상자그림에 의한 관측값의 분포 확인
#
par( mfrow = c( 2, 3 ) )                            # 2 X 3 가상화면 분할
for ( i in 1:5 ) {
  boxplot( myds[ , i ], main = colnames( myds )[ i ] )
}
par( mfrow = c( 1, 1 ) )                            # 2 X 3 가상화면 분할 해제

#
# 6단계 : 그룹별 관측값 분포의 확인
#
boxplot( myds$crim~myds$grp, main = "1인당 범죄율" )
boxplot( myds$rm~myds$grp, main = "방의 개수" )

#
# 7단계 : 다중 산점도를 통한 변수 간 상관 관계의 확인
#
pairs( myds[ , -6 ] )

#
# 8단계 : 그룹 정보를 포함한 변수 간 상관 관계의 확인
#
point <- as.integer( myds$grp )
color <- c( "red", "green", "blue" )
pairs( myds[ , -6 ], pch = point, col = color[ point ] )

#
# 9단계 : 변수 간 상관계수의 확인
#
cor( myds[ , -6 ] )
