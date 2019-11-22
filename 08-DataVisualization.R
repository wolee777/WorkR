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
