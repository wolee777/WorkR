#
# 지도와 데이터
#
# R에서 구글맵 사용하는 절차
#
# 1. R을 최신버전으로 설치
# 2. ggplot2를 최신버번으로 설치
# 3. ggmap 설치
# 4. 구글맵을 사용하기 위한 API 키을 획득
library( ggmap )

register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g' ) # 구글키 등록
gc <- geocode( enc2utf8( "제주시" ) ) # 지점의 경도, 위도
gc
cen <- as.numeric( gc ) # 경도, 위도를 숫자로로
cen
map <- get_googlemap( center = cen ) # 지도 중심점 좌표
ggmap( map )

register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g' ) # 구글키 등록
gc <- geocode( enc2utf8( "한라산" ) )
cen <- as.numeric( gc )
map <- get_googlemap( center = cen, # 지도 중심점 좌표
                      zoom = 9, # 지도 확대 정도
                      size = c( 640, 640 ), # 지도 크기
                      maptype = "roadmap" ) # 지도 유형
ggmap( map )

register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g' ) # 구글키 등록
cen <- c( -118.233248, 34.085015 )
map <- get_googlemap( center = cen ) # 지도 유형
ggmap( map )

# 지도위 마커 표시
register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g' ) # 구글키 등록
gc <- geocode( enc2utf8( "제주" ) )
cen <- as.numeric( gc )
map <- get_googlemap( center = cen, 
                      maptype = "roadmap",
                      marker = gc )
ggmap( map )

# 여러 지점 마커와 텍스트 표시
register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g' ) # 구글키 등록
names <- c( "용두암","성산일출봉", "정방폭포",
            "중문관광단지", "한라산1100고지", "차귀도") 
addr <- c( "제주시 용두암길 15",
           "서귀포시 성산읍 성산리",
           "서귀포시 동홍동 299-3",
           "서귀포시 중문동 2624-1",
           "서귀포시 색달동 산1-2",
           "제주시 한경면 고산리 125") 
gc <- geocode( enc2utf8( addr ) )           # 주소를 경도와 위도로 변환 
gc

# 관광지 명칭과 좌표값으로 데이터프레임 생성
df <- data.frame( name=names, 
                  lon = gc$lon, 
                  lat = gc$lat )  
df

cen <- c( mean( df$lon ),mean( df$lat ) )     # 지도의 중심점 
map <- get_googlemap( center = cen,        # 지도 가져오기  
                      maptype = "roadmap",               # 지도의 형태
                      zoom = 10,                         # 지도의 확대 크기
                      size = c( 640, 640 ),                 # 지도의 크기
                      marker = gc )                       # 마커의 위치
ggmap( map )                              # 지도와 마커 화면에 보이기

# 명소 이름 지도 위에 표시하기
gmap <- ggmap( map )
gmap+geom_text( data = df,                 # 지도 위에 텍스트 표시
                aes( x = lon, y = lat),        # 텍스트 위치(관광지 좌표) 
                size = 5,                  # 텍스트 크기
                label = df$name )           # 텍스트 내용

# 지도위 데이터 표시
library( ggplot2 )
register_google( key = 'AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g' ) # 구글키 등록

# 데이터 준비
sp <- sample( 1:nrow( wind ), 50 )                   # 50개 데이터 샘플링
df <- wind[ sp, ]
head( df )

cen <- c( mean( df$lon ), mean( df$lat ) )            # 지도의 중심점 계산
gc <- data.frame( lon = df$lon, lat = df$lat )        # 측정위치 좌표값 데이터
head( gc )

# 측정 위치에 마커 표시하기
map <- get_googlemap( center = cen,
                      maptype = "roadmap",
                      zoom = 6,
                      marker = gc )
ggmap( map )

# 풍속을 원의 크기로 표시하기
map <- get_googlemap( center = cen,                # 마커 없는 지도 가져오기
                      maptype = "roadmap",
                      zoom = 6 )
gmap <- ggmap( map )                              # 지도를 저장
gmap+geom_point( data = df,                        # 풍속을 원의 크기로 표시
                 aes( x = lon,y = lat, size = spd ),
                 alpha = 0.5, 
                 col = "blue" ) +
  scale_size_continuous( range = c( 1, 14 ) )      # 원의 크기 조절


#
#
#
install.packages( "ggiraphExtra" )
library( ggiraphExtra )

str( USArrests )
head( USArrests )

library( tibble )
crime <- rownames_to_column( USArrests, var = "state" )
crime$state <- tolower( crime$state )
str( crime )

library( ggplot2 )
install.packages( "mapproj" )
library( mapproj )

states_map <- map_data( "state" )
str( states_map )

ggChoropleth( data = crime, # 지도에 표현할 데이터
              aes( fill = Murder, # 색으로 표현 할 변수
                   map_id = state ), # 지역 기준 변수
              map = states_map ) # 지도 데이터

ggChoropleth( data = crime, # 지도에 표현할 데이터
              aes( fill = Murder, # 색으로 표현 할 변수
                   map_id = state ), # 지역 기준 변수
              map = states_map, # 지도 데이터
              interactive = T ) 


install.packages( "stringi" )
install.packages( "devtools" )
devtools::install_github( "cardiomoon/kormaps2014" )

library( kormaps2014 )

str( changeCode( korpop1 ) )

library( dplyr )
#korpop1 <- rename( korpop1 , pop = 총인구_명, name = 행정구역별_읍면동 )
korpop1

str( changeCode( kormap1 ) )

ggChoropleth( data = korpop1, # 지도에 표현할 데이터
              aes( fill = pop, # 색으로 표현 할 변수
                   map_id = code, # 지역 기준 변수
                   tooltip = name ), # 지도위 표시될 지역명
              map = kormap1, # 지도 데이터
              interactive = T ) 

str( changeCode( tbc ) )
ggChoropleth( data = tbc, # 지도에 표현할 데이터
              aes( fill = NewPts, # 색으로 표현 할 변수
                   map_id = code, # 지역 기준 변수
                   tooltip = name ), # 지도위 표시될 지역명
              map = kormap1, # 지도 데이터
              interactive = T ) 
