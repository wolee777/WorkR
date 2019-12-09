#
# 데이터 시각화
#
# 트리맵(tree map)
library( treemap )
data( GNI2014 )
head( GNI2014 )
treemap( GNI2014, 
         index = c( "continent", "iso3" ),       # 계층구조 설정(대륙-국가)
         vSize = "population",                   # 타일의 크기
         vColor = "GNI",                         # 타일의 컬러
         type = "value",                         # 타일 컬러링 방법
         bg.labels = "yellow",                   # 레이블의 배경색
         title = "World's GNI" )                 # 트리맵 제목 

st <- data.frame( state.x77 )
st <- data.frame( st, stname = rownames( st ) )
treemap( st,
         index = c( "stname" ),
         vSize = "Area",
         vColor = "Income",
         type = "value",
         title = "USA states area and income" )

# 버블차트(bubble chart)
st <- data.frame( state.x77 )
symbols( st$Illiteracy, st$Murder,               # 원의 x, y 좌표와 열
         circles = st$Population,                # 원의 반지름 열
         inches = 0.3,                           # 원의 크기 조절값
         fg = "white",                           # 원의 테두리 색
         bg = "lightgray",                       # 원의 바탕색
         lwd = 1.5,                              # 원의 테두리선 두께
         xlab = "rate of Illiteracy",
         ylab = "crime(murder) rate",
         main = "Illiteracy and Crime" )
text( st$Illiteracy, st$Murder,                  # 텍스트가 출력될 x, y 좌표
      rownames( st ),                            # 출력할 텍스트
      cex = 0.6,                                 # 폰트 크기
      col = "brown" )                            # 폰트 컬러

# 모자이크 플롯(mosic plot)
# 다중변수 범주형 데이터에 대해 각 변수의 그룹별 비율을 면적으로 표시하여 정보를 전달
head( mtcars )
mosaicplot( ~gear + vs, # mosic plot을 그릴 대상 변수
            data = mtcars, # 데이터셋
            color = TRUE, # y축 변수의 그룹별 음영을 달리하여 표시
            main = "Gear and Vs" )  # 제목

mosaicplot( ~gear + vs, data = mtcars, color = c( "green", "blue" ), main = "Gear and Vs" )

# 교차표 형태
tbl <- table( mtcars$gear, mtcars$vs )
tbl

mosaicplot( tbl, color = T, main = "Gear and Vs" )

# ggplot

# 차원 축소( dimension reduction )
#
# 산점도는 2차원 평면상에 두 변수의 값으로 좌표를 정하여 위치를 나타내는 방법으로 데이터의
# 분포를 관찰할 수 있는 시각화 도구
#
# 산점도의 한계는 변수가 두개인 경우, 즉 2차원 데이터에 대해서만 그래프를 그릴수 있가는 것이다.
#
# 차원 축소란 고차원 데이터를 2, 3차원 데이터로 축소하는 기겁
# 2, 3차원으로 출소된 데이터로 산점도를 작성하여 데이터 분포를 확인하면 고차원상의 데이터 분포를
# 추정할 수 있다.
#
# 고차원의 데이터를 저차원으로 축소하면 어쩔 수 없이 정보의 손실이 발행한다.
#
# 이미 존재하는 차원 축소 방법중 t-sne 방법을 사용
# Rtsne 패키지를 사용
install.packages( "Rtsne" )
library( Rtsne )
library( ggplot2 )

ds <- iris[ , -5 ]

# 중복 데이터 제거
dup = which( duplicated( ds ) )
dup                             # 143번째 행 중봅
ds <- ds[ -dup, ]
ds.y <- iris$Species[ -dup ]    # 중복을 제외한 품종 정보

# t-SNE 실행
tsne <- Rtsne( ds, # 차원 축소 대상 데이터셋
               dim = 2, # 축소할 차원 2 / 3
               perplexity = 10 ) # 차원 축소 과정에서 데이터를 샘플링하는데 샘플의 개수를 몇 개로 할지 지정
                                 # (대상데이터의 행의 수) / 3 보다 작게 지정

# 축소결과 시각화
df.tsne <- data.frame( tsne$Y )
head( df.tsne )

ggplot( df.tsne, aes( x = X1, y = X2, color = ds.y ) ) +
  geom_point( size = 2 )

# 4차원 데이터를 3차원 산점도로 작성
install.packages( c( "rgl", "car" ) )
library( car )
library( rgl )
library( mgcv )

tsne <- Rtsne( ds, dims = 3, perplexity = 10 )
df.tsne <- data.frame( tsne$Y )
head( df.tsne )

# 회귀면이 포함된 3차원 산점도
scatter3d( x = df.tsne$X1, y = df.tsne$X2, z = df.tsne$X3 )

# 회귀면이 없는 3차원 산점도
points <- as.integer( ds.y )
color <- c( 'red', 'green', 'blue' )
scatter3d( x = df.tsne$X1, y = df.tsne$X2, z = df.tsne$X3, 
           point.col = color[ points ], surface = FALSE )
