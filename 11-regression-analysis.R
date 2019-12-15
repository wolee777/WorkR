#
# 모델링( Modeling ) : 우리가 살고 있는 현실 세계에서 일어나는 현상을 수학식으로 표현하는 행위
#                      모델링을 통해 모델을 알아내고 나면, 모델을 이용하여 새로운 사실을 예측할 수
#                      있게 된다.
#
#       주어진 조건으로부터 변수를 뽑고 변수 사이의 관계를 나타내는 식을 구하는 과정을 모델링으로 
#       볼 수 있다.
#       모델을 가지고 있으면 예측이 가능하다.
#
#       데이터 과학의 세계에서는 문장으로 기술된 조건이 주어지는 대신, 데이터가 주어진다.
#       이 데이터로부터 모델을 알아내야 하는데, 주어진 데이터를 훈련 집합( training set )라 한다.
#
#       데이터 과학에서 독립 변수 x를 설명 변수( explanatory variable ), 특징( feature )
#       종속 변수 y를 반응 변수( response variable ), 레이블( label )
#       x가 입력되면 y를 맞추어야 하는 문제로 볼 수 있으므로 y를 그라운드 트루스( ground truth, 정답 )로 간주
#
#       데이터 과학에서 모델링이란 훈련 집합을 이용하여 최적의 모델을 찾아내는 과정이다.
#
#       y = Wx + b
#
#       1. 선형 방정식 선택: 모델 선택( model selection )
#          W(기울기), b(bias) 를 계수( coefficient )라 부르고 데이터 과학에서는 매개변수( parameter )
#          모델 선택 직후에는 최적의 매개변수가 정해지지 않은 모델을 가지고 있다.
#
#       2. 훈련 집합을 적용하여 매개변수를 결정
#          훈련 집합을 가장 잘 설명하는 최적의 매개변수 값을 알아내는 과정을 모델 적합( model fitting )
#          모델 적합을 학습( learning ) 또는 훈련( training )
#          모델 적합을 마치면 매개변수 값이 정해져 고정된다. 
#          매개변수가 정해진 모델을 가지게 되었으므로 예측이 가능하다.
#
#       3. 예측은 훈련 집합에 없는 새로운 샘플이 주어지면 모델을 가지고 레이블을 추정하는 과정이다.
#          주어지는 정보는 특징( feature ) x 이고 추정해야 할 것은 레이블( label ) y 다. 
#
#       4. 모델을 완성한 후에는 모델의 품질을 평가해야 하는데, 모델 품질은 주로 모델이 범하는 오류로 
#          측정한다.
#
# 훈련 집합을 가지고 모델을 구하는 일을 '회귀 문제( regression problem )를 푼다'고 표현하거나
# '회귀 분석을 한다'고 표현하기도 한다. 회귀는 통계학에서 유래된 용어인데, 독립 변수가 변할 때
# 종속 변수가 어떻게 변하는지를 수식으로 표현하는 작업이다.
#
# 현실 세계는 불확실성과 측정 오차가 가득하다.
#
# 회귀분석( Regression Analysis )
#       관찰된 연속형 변수들에 대해 두 변수 사이의 모형을 구한뒤 적합도를 측정해 내는 분석 방법
#       
#       회귀분석은 시간에 따라 변화하는 데이터나 어떤 영향, 가설적 실험, 인과 관계의 모델링등의 
#       통계적 예측에 이용될 수 있다. 
#
#       그러나 많은 경우 가정이 맞는지 아닌지 적절하게 밝혀지지 않은 채로 이용되어 그 결과가 
#       오용되는 경우도 있다. 
#       특히 통계 소프트웨어의 발달로 분석이 용이해져서 결과를 쉽게 얻을 수 있지만 
#       적절한 분석 방법의 선택이였는지 또한 정확한 정보 분석인지 판단하는 것은 연구자에 달려 있다.
#
# 단순선형 회귀분석( simple linear regression analysis )
#   독립변수와 종속변수와의 관계가 선형으로 표현
#   하나의 독립변수를 다룬다.
#
#   주식 시세에 영향을 미치는 요인들, 즉 기업 매출액, 원유가격, 국제정세, 정부정책발표등을
#   독립변수( independent variable, 설명변수 explanatory variable )
#
#   독립변수의 영향에 따라 값이 결정되는 주식 시세를 
#   종속변수( dependent variable, 반응변수 response variable )
#
#   독립변수에 해당하는 자료와 종속변수에 해당하는 자료를 모아 관계를 분석하고 이를 예측에
#   사용할 수 있는 통계적 방법으로 정리한 것을 예측모델( prediction model ) 또는 예측모형
#
#   데이터 분석의 중요 분야 중 하나가 예측모델을 만드는 것
#
#   회귀분석( regression analysis )이란 회귀 이론을 기초로 독립변수(설명변수)가
#   종속변수(반응변수)에 미치는 영향을 파악하여 예측모델을 도출하는 통계적 방법
#
#   예측모델을 도출할 때 회귀 이론에 기초하기 때문에 회귀모델이라한다.
#
#   회귀모델에서는 독립변수(들)와 종속변수 사이의 관계가 수학식의 형태로 표현되기 때문에
#   이 관계식을 회귀식( regression equation )이라 한다.
#
#   회귀식에서는 일반적으로 독립변수는 x로, 종속변수는 y로 표현된다.
#   회귀모델을 구하는 이유는 회귀모델을 통해서 종속변수를 예측할 수 있기 때문이다.
#
#   회귀분석 종류
#
#   단순회귀( simple regression ) : 독립변수의 수가 하나인 경우
#   다중회귀( multiple regression ) : 독립변수의 수가 두 개 이상인 경우
#
#   단순선형 회귀분석( simple linear regression analysis ) 
#     : 독립변수( x )와 종속변수( y ) 사이의 선형관계를 파악하고 이를 예측에 활용하는 통계적 방법
#
#   단순선형 회귀모델 또는 단순선형 회귀식은 1차식 형태
#       y = Wx + b( W, b는 상수 )
#         상수인 W, b를 찾는 것이 단순선형 회귀의 1차적인 목표가 된다.
#
#         W(기울기), b(bias)는 어떻게 찾을 수 있을까? 이 문제를 해결하려면 x, y로 구성된 데이터가 있어야 한다.
#         즉 수집된 데이터를 관찰하여 관계식을 만들어야 하는 것이다.
#         현재 수집된 데이터의 추세를 가장 잘 반영할 수 있는 W와 b를 찾는 것이 단순선형 회귀의 목표
#
# 주행거리와 제동거리 사이의 회귀모델
str( cars )
head( cars )

plot( dist~speed, data = cars )     # 산점도를 통한 선형 관계 확인
plot( cars )

model <- lm( dist~speed, cars )     # 회귀모델 구하기, 종속(반응)변수~독립(설명)변수 순서로 지정
model
#Call:
#  lm(formula = dist ~ speed, data = cars)
#
#Coefficients:
#  (Intercept)        speed  
#-17.579        3.932  
#
# Coefficients내용이 중요 (Intercept)하단이 b에 해당, speed 하단이 W에 해당
# 회귀식은 dist = 3.932 x speed - 17.579
#
# 편차(Deviation) : 관측치가 평균으로부터의 떨어져 있는 정도, 즉 평균과의 차이
# 오차(Error) : 예측하기 위하여 추정된 값과 실제값의 차이, 즉 예측값이 정확하지 못한 정도
# 잔차(residual) : 평균이 아니라 회귀식 등으로 추정된 값과의 차이, 즉 추정된 값이 설명할 수 없어서
#                  아직도 남아있는 편차, 잔차는 편차의 일부분
#
abline( model )                     # 회귀선을 산점도에 표시

coef( model )                       # 매개변수( 계수 ) - W, b의 값
cars
fitted( model )                     # 훈련 집합에 있는 샘플에 대한 예측값
residuals( model )                  # 잔차를 알려줌
                    # 모델에 대한 오차 분석시 평균 제곱 오차(MES)법 사용
deviance( model ) / length( speed ) # 잔차 제곱합을 평균 제곱 오차(MES mean squared error)로 변환해서 출력

summary( model )                    # 모델의 상세내용
#
#Call:
#  lm(formula = dist ~ speed, data = cars)
#
#Residuals:   -> 잔차
#  Min      1Q  Median      3Q     Max 
#-29.069  -9.525  -2.272   9.215  43.201 
#
#Coefficients:                                          lm()이 사용하는 귀무가설 독립변수x와 종속변수y
#                                                       가 아무 관련이 없다, 두 변수는 관련이 있다는
#                                                       대립가설이 받아들여진다.
#         Estimate Std.  Error   t value Pr(>|t|)    -> 모델의 계수, 유의수준을 0.05로 설정하였을 겨우
#(Intercept) -17.5791     6.7584  -2.601   0.0123 *           -> W   p-값을 통해 대립/귀무 가설에 대한
#  speed         3.9324     0.4155   9.464 1.49e-12 ***       -> b   판단
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 15.38 on 48 degrees of freedom
#Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
#F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
#
#
# t-검정과 분산 분석
#
# 평균은 클수록, 분산은 작을수록, 데이터의 크기가 클수록 믿음은 커진다.
# 위의 세 가지 값을 하나로 묶은 값을 t-통계량(t-statistics) 또는 t-값(t-value)
# t-값인 크면(평균이 커지고, 분산이 작아지고, 데이터가 많아질수록) 대립 가설에 대한 믿음이 강해지고
#       귀무 가설에 대한 믿음이 약해진다.
# t-값이 작으면 대립 가설에 대한 믿음은 약해지고 귀무 가설에 대한 믿음은 강해진다.
# 믿음이 강해진다는 통계학에서 '통계학적으로 유의미하다(statistically significant)'라고 표현
#
# 데이터를 통해 '대립가설이 통계학적으로 유의미하다'라는 것을 증명하는 확인하는 작업을 t-검정(t-test)이라 함
#
# '귀무가설이 참이라고 가정했을 때, 표본으로 부터 얻어지는 통계치(예:표본통계)가 나타날(관측될) 확률'을
# 계산한다. 이때 계산된 확률값을 p값이라고 한다.
# p값이 매우 낮으면, 이러한 표본 통계값은 우연히 나타나기 어려운 케이스이기 때문에, 우리는 귀무가설을
# 채택하지 않고(기각하고), 대안적인 가설, 즉 대립가설을 채택하게 된다.
# 
# 가설( Hypothesis ) : 진실이라고 학증할 수는 없지만 '아마도 그럴 것이다'라는 잠정적인 주장
#        연구하고자 하는 대상이 나타내는 현상을 관찰한 후에, 그 현상을 설명하는 가설을 설정
#        가설을 통계적인 방식으로 검정하는 것을 통계적 가설검정( Hypothesis testing )
#
# 통계에서 쓰이는 가설은 우리가 알고싶어하는 '어떤 모집단의 모수(예: 평균, 분산등)에 대한 잠정적인 주장'
#
# 귀무가설( Null hypothesis: H0 ) : 모집단의 특성에 대해 옳다고 제안하는 잠정적인 주장
#             '~와 차이가 없다, ~의 효과는 없다, ~와 같다'라는 형식
#
# 대립가설( Alternative hypothesis : H1 ) : 귀무가설이 거짓이라면 대안적으로 참이 되는 가설
#             '~와 차이가 있다, ~와 효과는 있다, ~와 다르다'라는 형식
#
#

coef( model )[ 1 ]                  # b값 출력
coef( model )[ 2 ]                  # W값 출력

# 주행속도에 따른 제동거리 구하기
b <- coef( model )[ 1 ]
W <- coef( model )[ 2 ]

#
# 모델에 대한 예측, 예측은 predict()사용
#
speed <- 21.5                       # 주행속도
dist <- W * speed + b
dist                                # 제동거리

df <- data.frame( speed = c( 21.5 ) )
predict( model, df )


speed <- 30                         # 주행속도
dist <- W * speed + b
dist                                # 제동거리

df <- data.frame( speed = c( 30 ) )
predict( model, df )

speed <- 35                         # 주행속도
dist <- W * speed + b
dist                                # 제동거리

speed <- 40                         # 주행속도
dist <- W * speed + b
dist                                # 제동거리

df <- data.frame( speed = c( 21.5, 25.0, 25.5, 26.0, 26.5, 27.0, 27.5, 28.0 ) )
predict( model, df )
plot( df$speed, predict( model, df ), col = 'red', cex = 2, pch = 20 )
abline( model )


# 여기서 구한 단순선형 회귀모델을 예측에 활용할 때 기억할 사항은
# 예측한 값이 실제값과 오차가 있을 수 있다는 것이다.
#
# 단순선형 회귀모델은 1차식의 형태이므로 우리가 예측한 값은 모두 선 위에 위치하게 되지만
# 실제값은 선에서 떨어져 있다. 이 차이가 예측값과 실제값 사이의 오차이다.
#
# 단순선형 회귀식은 예측값과 실제값 사이의 오차를 최소화하는 식이지만 오차가 없을 수는 없다.
# 따라서 회귀식을 통해 구한 값은 실제와 어느 정도 오차가 있을수 있는 '예측값'이라는 사실을 기억하고
# 실제 업무에 활용해야 한다.
#
# 예상 제동거리, 실제 제동거리, 오차 구하기
speed <- cars[ , 1 ]
pred <- W * speed + b
pred

compare <- data.frame( pred, cars[ , 2 ], pred-cars[ ,2 ] )
compare

colnames( compare ) <- c( '예상', '실제', '오차' )
head( compare )

# 
# 고차 다항식 적용과 분산 분석( ANOVA ANalysis Of Variance )
# 
# lm()은 기본적으로 1차 방정식, 즉 직선을 사용하지만 poly라는 옵션을 사용하면 고차 방정식 적용
# lm()의 수식을 dist~poly( speed, i )로 설정하여 speed을 항으로 갖는 i차 방정식을 사용
# 

plot( cars, xlab = '속도', ylab = '거리' )
x = seq( 0, 25, length.out = 200 )          # 예측할 지점
for ( i in 1:4 ) {
  m = lm( dist~poly( speed, i ), data = cars )
  assign( paste( 'm', i, sep = '.' ), m )   # i차 모델 m을 m.i라 부름
  lines( x, predict( m, data.frame( speed = x ) ), col = i ) # m으로 예측한 결과를 겹쳐 그림
}

# 분산 분석
# anova()는 모델이 하나만 주어질 경우 t-검정처럼 독립 변수와 종속 변수의 관련성에 대해 통계적
# 유의성을 확인해준다.
# 분산 분석 결과에서 Pr(>F), 즉 p-값은 모두 0.05보다 커서 통계적으로 차이가 없다고 판정할 수 있다.
# 따라서 이 데이터에서는 가장 단순한 1차 모델, 즉 m.1을 사용하는 것이 현명한다.
anova( m.1, m.2, m.3, m.4 )



#
# 모델의 통계량 해석
#
# cars 데이터셋을 모델링한 결과 speed 계수의 p-값이 1.49e-12로 0.05보다 매우 작은 값이다.
# 통계적으로 유의미한 모델링이 되었음을 확인할 수 있다.
# 다만 (Intercept)라고 표시된 절편의 p-값이 0.0123으로 높은편이다. 이 현상은 점들이 상하로
#      퍼져 있어 절편에 대한 오차가 크기 때문에 나타난다.
str( cars )
head( cars )
car_model = lm( dist~speed, data = cars )
coef( car_model )
plot( cars )
abline( car_model, col = 'red' )
summary( car_model )

# women 데이터셋을 모델링한 결과 height 계수의 p-값이 1.49e-12로 0.05보다 매우 작은 값이다.
# 통계적으로 유의미한 모델링이 되었음을 확인할 수 있다.
# (Intercept)라고 표시된 절편의 p-값이 1.71e-09로 매우 작다.
# women 데이터 모델은 cars 데이터 모델보다 더 정확하게 예측할 성이라고 이해하면 된다.
str( women )
head( women )
women_model = lm( weight~height, data = women )
coef( women_model )
plot( women )
abline( women_model, col = 'red' )
summary( women_model )


#
# 다중선형 회귀분석( multiple linear regression analysis )
#
# 다중선행 회귀모델 : 여러 개의 독립변수를 다루는 회귀보델
#
#     어떤 결과에 영향을 미치는 요인이 하나이기 보다는 여러 개인 경우가 대부분
#
#   y = B0 + B1X1 + B2X2 + B3X3 + ... + BnXn
#
#   독립변수가 n개인 다중선형 회귀에서는 주어진 자료를 이용행 B0, B1, B2, B3, ... , Bn의 값을
#   알아내는 것이 과제이다.
#
library( tidyverse )
library( car )

str( Prestige )
head( Prestige )

# Prestige 데이터셋에서 행의 이름은 직군
#   education : 교육연수( 독립변수 )
#   income : 연봉( 종속변수 )
#   women : 여성의 비율( 독립변수 )
#   prestige : 직군에 대한 평판도( 독립변수 )

newdata <- Prestige[ , c( 1:4 ) ]             # 회귀식 작성을 위한 데이터 준비
newdata

plot( newdata, pch = 16, col = 'blue',        # 산점도를 통해 변수 간 관계 확인 
      main = 'Matrix Scatterplot' )

mod1 <- lm( income~education + prestige + women, data = newdata ) # 회귀식 도출
#   ~앞에 있는 것이 종속변수, ~뒤가 독립변수, 독립변수가 여러 개이면 + 로 연결

summary( mod1 )
# 
# income = ( -253.850 ) + ( 177.199 x education ) + ( 141.435 x prestige ) - ( 50.896 x women )
# 13762.26(평규연봉) = ( -253.850 ) + ( 177.199 x 9.5년 ) + ( 141.435 x 평판도 80 ) - ( 50.896 x 20%여성비율 )
#
# 결과의 coefficients(계수) 파트에서 estimate부분이 중요한 부분이다.
#
#Call:
#  lm(formula = income ~ education + prestige + women, data = newdata)
#
#Residuals:
#  Min      1Q  Median      3Q     Max 
#-7715.3  -929.7  -231.2   689.7 14391.8 
#
#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)             아래 *는 해당변수가 종속변수를 설명하는 데 
#                                                            얼마나 중요한 변수인가 나타낸다.
#(Intercept) -253.850   1086.157  -0.234    0.816             회귀식에서 상수항 B0의 값
#education    177.199    187.632   0.944    0.347             독립변수 education의 계수값
#prestige     141.435     29.910   4.729 7.58e-06 ***         독립변수 prestige의 계수값, 
#  women        -50.896      8.556  -5.948 4.19e-08 ***       독립변수 women의 계수값
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 2575 on 98 degrees of freedom
#Multiple R-squared:  0.6432,	Adjusted R-squared:  0.6323  -> 모델의 설명력을 나타내며 0~1 사이의 값을 갖는다.
#                                                    이 값이 클수록 구한 회귀모델이 현실을 잘 설명할 수 있다는 뜻
#                                                    회귀모델이 현실을 잘 설명할 수 있다는 것은 회귀모델에
#                                                    의한 예측값과 실제 측정값 사이의 오차가 적다는 뜻
#                                                    설명력 0.6323 모델이 현실을 63% 정도 설명할 수 있다는 뜻
#F-statistic: 58.89 on 3 and 98 DF,  p-value: < 2.2e-16
#                                   p-value(유의수준) 값은 구한 회귀모델이 의미있는 모델인지, 혹은
#                                     신뢰할 수 있는 모델인지를 나타내은 것, 
#                                     일반적으로 p-value < 0.05이면 이 모델의 신뢰수준이 95%이상임을 의미
#
# 다중선형 회귀모델에서 변수 선택
#
# 다중선형 회귀모델에서는 종속변수를 설명하는 데 도움이 되는 독립변수가 도수 존재한다.
# 그런데 모든 독립변수가 종속변수를 설명하는 데 동일하게 기여하는 것은 아니다.
# 어떤 변수는 기여도가 높고, 어떤 변수는 기여도가 낮다.
#
# 기여도가 낮거나 거의 없는 변수들은 모델에서 제외 하는 것이 좋다.
# 적은 변수를 이용해 현실을 설명할 수 있는 것이 좋은 모델이기 때문
# R에서는 모델에 기여하는 변수들을 선별할 수 있는 stepAIC()를 제공
#
# Prestige 데이터셋에서 education, women, prestige, census 변수중 income 예측하는 데 도움되는 변수 선별
library( MASS )         # stepAIC()

newdata2 <- Prestige[ , c( 1:5 ) ]
head( newdata2 )

mod2 <- lm( income~education + prestige + women + census, data = newdata2 )
#           income~. 과 같이 간단히 표시할 수 있다. 
#             여기서 .의 의미는 income을 제외한 나머지 모두 독립변수라는 의미
mod2

mod3 <- stepAIC( mod2 )     # 모델에 기여하는 변수 선택
# stepAIC()는 mod2에서 불필요한 변수를 제거해 나가는 방식으로 작업
# 
#
#Start:  AIC=1607.93
#income ~ education + prestige + women + census   -> step 진행사 사용한 변수
#
#Df Sum of Sq       RSS    AIC
#- census     1    639658 649654265 1606.0
#- education  1   5558323 654572930 1606.8
#<none>                   649014607 1607.9
#- prestige   1 143207106 792221712 1626.3
#- women      1 212639294 861653901 1634.8
#
#Step:  AIC=1606.03
#income ~ education + prestige + women            -> step 진행사 사용한 변수
#
#Df Sum of Sq       RSS    AIC
#- education  1   5912400 655566665 1605.0
#<none>                   649654265 1606.0
#- prestige   1 148234959 797889223 1625.0
#- women      1 234562232 884216497 1635.5
#
#Step:  AIC=1604.96
#income ~ prestige + women                        -> step 진행사 사용한 변수
#
#Df Sum of Sq        RSS    AIC
#<none>                   655566665 1605.0
#- women     1 234647032  890213697 1634.2
#- prestige  1 811037947 1466604612 1685.1
#
# 위 과정에서 제거된 변수가 education과 census이고 남은 변수가 prestige와 women이다.

mod3          # 결과 확인 
#Call:
#  lm(formula = income ~ prestige + women, data = newdata2)
#
#Coefficients:
#  (Intercept)     prestige        women  
#431.57       165.87       -48.38  

summary( mod3 )       # 회귀모델 상세 내용 확인
#Call:
#  lm(formula = income ~ prestige + women, data = newdata2)  -> prestige와 women만을 이요해서 모델구성
#
#Residuals:
#  Min      1Q  Median      3Q     Max 
#-7620.9 -1008.7  -240.4   873.1 14180.0 
#
#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  431.574    807.630   0.534    0.594         
#prestige     165.875     14.988  11.067  < 2e-16 ***
#  women        -48.385      8.128  -5.953 4.02e-08 ***
#
#     -> 회귀식 income = 431.574 + (165.78 x prestige) - (48.385 x women)
#
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 2573 on 99 degrees of freedom
#Multiple R-squared:   0.64,	Adjusted R-squared:  0.6327 -> 주의깊게 볼값
#
#       변수 2개 사용한 모델 : 0.6327, 변수 3개 사용한 모델 : 0.6323 으로
#       변수 2개 사용한 모델이 설명력이 더 높다.
# 
#F-statistic: 87.98 on 2 and 99 DF,  p-value: < 2.2e-16
#
#
# 로지스틱 회귀분석( Logistic regression )
#           회귀모델에서 종속변수의 값의 형태가 연속형 숫자가 아닌 범주형 값인 경우를 다루는 통계적방법
#
# 일반적인 회귀분석은 종속변수가 연속형 값인 경우데 대한 예측모델 개발을 다룰때 사용
# 어떤 경우는 예측 대상이 되는 값이 범주형 값인 경우도 있다.
#
# 주어진 데이터로부터 어떤 범주를 예측하는 분야를 회귀와 구분하여 분류(classification)라고 한다.
# 분류문제를 회귀의 방법으로 해결하고자 개발된 것이 로지스틱 회귀이다.
#
# 로지스틱 회귀도 기본적으로 회귀 기법이기 때문에 종속변수가 숫자로 표현되어야 한다.
#           예로 YES와 NO는 0과 1로, setosa, versicolor, virginica는 1, 2, 3과 같이 숫자로 바꾼 후에
#                로지스틱 회귀를 적용해야한다.
#
#
# iris를 이용한 로지스틱 회귀
iris.new <- iris
iris.new$Species <- as.integer( iris.new$Species )    # 범주형 자료를 정수로 변환
head( iris.new )

mod.iris <- glm( Species~., data = iris.new )         # 로지스틱 회귀모델 도출
summary( mod.iris )                                   # 회귀모델의 상세 내용 확인 
#Call:
#  glm(formula = Species ~ ., data = iris.new)
#
#Deviance Residuals: 
#  Min        1Q    Median        3Q       Max  
#-0.59215  -0.15368   0.01268   0.11089   0.55077  
#
#Coefficients:    -> 이 항목으로 회귀식을 구할 수 있다. 
#              Species = 1.18650 - ( 0.11191 x Sepal.Length ) - ( 0.04008 x Sepal.Width ) +
#                        ( 0.22865 x Petal.Length ) + ( 0.60925 x Petal.Width )
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)   1.18650    0.20484   5.792 4.15e-08 ***    
#  Sepal.Length -0.11191    0.05765  -1.941   0.0542 .      기여도가 낮음
#Sepal.Width  -0.04008    0.05969  -0.671   0.5030          품종 예측에 있어서 거의 도움이 되지 않는 변수
#Petal.Length  0.22865    0.05685   4.022 9.26e-05 ***      품종 예측에 중요변수
#  Petal.Width   0.60925    0.09446   6.450 1.56e-09 ***    품종 예측에 중요변수
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#(Dispersion parameter for gaussian family taken to be 0.04800419)
#
#Null deviance: 100.0000  on 149  degrees of freedom
#Residual deviance:   6.9606  on 145  degrees of freedom
#AIC: -22.874
#
#Number of Fisher Scoring iterations: 2
#
# 회귀모델을 통해 다음 iris 데이터셋 첫번째 행의 품종을 예측
#
# Sepal.Length  Sepal.Width Petal.Length  Petal.Width
#       5.1         3.5         1.4           0.2
#
# Species = 1.18650 - ( 0.11191 x Sepal.Length ) - ( 0.04008 x Sepal.Width ) +
#          ( 0.22865 x Petal.Length ) + ( 0.60925 x Petal.Width )
#         = 1.18650 - ( 0.11191 x 5.1 ) - ( 0.04008 x 3.5 ) + ( 0.22865 x 1.4 ) + ( 0.60925 x 0.2 )
#         = 0.917439
#
# 품종을 예측한 결과가 1, 2, 3과 같은 정수가 아니 0.917439가 도출되었다.
# 로지스틱 회귀식에 의한 결과는 이와 같이 정수가 아닌 실수가 도축된다.
# 이 결과에 대해 약간의 해석이 필요한데 0.917439와 가장 가까운 수치 1이 우리가 예측하고자 하는 값이다.
# 일반화해서 소수 첫째 자리에서 반올림한 값이 예측값이 된다.
#
#
# 로지스틱 회귀모델을 이용한 예측
#
# 예측 대상 데이터 생성(data frame)
unknown <- data.frame( rbind( c( 5.1, 3.5, 1.4, 0.2 ) ) )
names( unknown ) <- names( iris )[ 1:4 ]
unknown              # 예측 대상 데이터

pred <- predict( mod.iris, unknown )  # 품종 예측
pred                                  # 예측 결과
round( pred, 0 )                      # 예측 결과 출력( 소수 첫째 자리에서 반올림 )

# 실제 품종명 알아보기
pred <- round( pred, 0 )
pred
levels( iris$Species )
levels( iris$Species )[ pred ]

#
# 다수의 데이터에 대한 예측
#
# 예측 대상 데이터가 여러 개인 경우에도 유사한 방법으로 예측할 수가 있다.
# 예측 대상 데이터가 10개라면 예측 결과도 10개가 도출된다.
#
test <- iris[ , 1:4 ]                 # 예측 대상 데이터 준비
#
# 예측모델을 만들 때 사용하는 데이터는 훈련 데이터( training data )
# 예측대상이 되는 데이터를 테스트 데이터( test data )
#
pred <- predict( mod.iris, test )     # 모델을 이용한 예측
pred <- round( pred, 0 )
pred                                  # 예측 결과

answer <- as.integer( iris$Species )  # 실제 품종 정보
pred == answer                        # 예측 품종과 실제 품종이 같은지 비교
acc <- mean( pred == answer )         # 예측 정확도 계산
acc                                   # 예측 정확도, 0.9733333이면, 100개의 품종 예측시 97개는 정확히 예측
#
# 실제 모델 개발시에는 학습용 데이터와 테스트용 데이터는 서로 다른 것을 사용한다.
# 

