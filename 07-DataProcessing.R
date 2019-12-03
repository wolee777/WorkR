#
# dplyr package를 이용한 data 가공( Data Manipulation, Data Processing )
#
install.packages( "dplyr" )
library( dplyr )

df <- data.frame( var1 = c( 1, 2, 1 ), 
                  var2 = c( 2, 3, 2 ) )
df

# rename() : 이름 변경
df <- rename( df, v1 = var1, v2 = var2 )
df

# 파생변수 추가
df$sum <- df$v1 + df$v2
df

df[ 2, 1 ] <- 5
df
df$grade <- ifelse( df$v1 > df$v2, "TRUE", "FALSE" )
df


df <- data.frame( id = c( 1, 2, 3, 4, 5, 6 ),
                  class = c( 1, 1, 1, 1, 2, 2 ),
                  math = c( 50, 60, 45, 30, 25, 50 ),
                  english = c( 98, 97, 86, 98, 80, 89 ),
                  science = c( 50, 60, 78, 58, 65, 98 ) )
df

# filter() : 행 추출
df %>% filter( class == 1 )
df %>% filter( class == 2 )
df %>% filter( class != 1 )
df %>% filter( class != 3 )

df %>% filter( science > 70 )
df %>% filter( math < 50 )

df %>% filter( class == 1 & math >= 50 )
df %>% filter( math >= 50 | english >= 90 )

df %>% filter( class == 1 | class == 3 | class == 5 )
df %>% filter( class %in% c( 1, 3, 5 ) ) 

class1 <- df %>% filter( class == 1 )
class2 <- df %>% filter( class == 2 )
class1
class2 

# select() : 변수 추출
df %>% select( math )
df %>% select( science )

df %>% select( class, math, science )

df %>% select( -math )

# dplyr 함수 조합
df %>% 
  filter( class == 1 ) %>% 
  select( science )

df %>% 
  select( id, science ) %>% 
  head

df %>% 
  select( id, science ) %>% 
  head( 10 )

df %>% 
  select( id, science ) %>% 
  sum

df %>% 
  select( id, science ) %>% 
  max

# arrange() : 정렬
df %>% arrange( science )
df %>% arrange( desc( science ) )

# mutate() : 파생변수 추가
df %>% 
  mutate( total = math + english + science ) %>% 
  head

df %>% 
  mutate( total = math + english + science,
          average = ( math + english + science ) / 3 ) %>% 
  head

df %>% 
  mutate( grade = ifelse( science >= 60, 'pass', 'fail' ) ) %>% 
  head

df %>% 
  mutate( total = math + english + science,
          average = ( math + english + science ) / 3 ) %>%
  mutate( grade = ifelse( average >= 90, 'pass', ifelse( average < 60, 'fail', 'normal' ) ) ) %>% 
  head

df %>% 
  mutate( total = math + english + science,
          average = ( math + english + science ) / 3 ) %>% 
  arrange( desc( average ) ) %>% 
  head

# summarise() : 집단별 요약
# group_by() : 집단별 나누기
df %>% summarise( mean_math = mean( math ) )

df %>% 
  group_by( class ) %>% 
  summarise( mean_math = mean( math ) )

df %>% 
  group_by( class ) %>% 
  summarise( mean_math = mean( math ),
             mean_english = mean( english ),
             mean_science = mean( science ),
             n = n() )      # n() : 빈도수

str( ggplot2::mpg )
mpg <- data.frame( ggplot2::mpg )
dim( mpg )
str( mpg )
head( mpg )
View( mpg )

mpg %>% 
  group_by( manufacturer, drv ) %>% 
  summarise( mean_cty = mean( cty ) ) %>% 
  head( 10 )

mpg %>% 
  group_by( manufacturer ) %>% 
  filter( class == 'suv' ) %>% 
  mutate( tot = ( cty + hwy ) / 2 ) %>% 
  summarise( mean_tot = mean( tot ) ) %>% 
  arrange( desc( mean_tot ) ) %>% 
  head( 5 )

# 데이터 합치기
# left_join() : 가로로 합치기( 변수 추가 ), 첫 번째 df를 기준으로 두번째 df에 있는 나머지 변수 결합
# inner_join() : 가로로 합치기( 변수 추가 ), 첫 번째 df와 두번째 df에서 기준으로 지정한 변수값이 동일할 때만 결합
# full_join() : 가로로 합치기( 변수 추가 ), 첫 번째 df와 두번째 df에서 기준으로 지정한 변수값 전체를 결합
df1 <- data.frame( id = c( 1, 2, 3, 4, 5 ),
                   midterm = c( 60, 80, 70, 90, 85 ) )
df2 <- data.frame( id = c( 1, 2, 3, 4, 5 ),
                   final = c( 70, 83, 65, 95, 80 ) )
df1
df2

total <- left_join( df1, df2, by = "id" )
total

df1 <- data.frame( id = c( 1, 2, 3 ),
                   address = c( '서울', '부산', '제주' ),
                   stringsAsFactors = F )
df2 <- data.frame( id = c( 1, 2, 4 ),
                   gender = c( '남', '여', '남' ) )
df1
df2
str( df1 )
str( df2 )

df_left <- left_join( df1, df2, by = 'id' )
df_left

df_inner <- inner_join( df1, df2, by = 'id' )
df_inner

df_full <- full_join( df1, df2, by = 'id' )
df_full

name <- data.frame( class = c( 1, 2, 3, 4, 5), 
                    teacher = c( 'Hong', 'Kim', 'Lee', 'Park', 'Choi' ) )
name

df
df_new <- left_join( df, name, by = 'class' )
df_new

# bind_rows() : 세로로 합치기( 행( data ) 추가 )
group_a <- data.frame( id = c( 1, 2, 3, 4, 5 ),
                       test = c( 60, 80, 70, 90, 85 ) )
group_b <- data.frame( id = c( 1, 2, 3, 4, 5 ),
                       test = c( 70, 83, 65, 95, 80 ) )
group_a
group_b

group_all <- bind_rows( group_a, group_b )
group_all

# ggplot2::mpg에 연료별 가격 추가 실습
fuel <- data.frame( fl = c( 'c', 'd', 'e', 'p', 'r' ),
                    price_fl = c( 2.35, 2.38, 2.11, 2.76, 2.22 ),
                    stringsAsFactors = F )
fuel

mpg <- data.frame( ggplot2::mpg )
head( mpg, 5 )
mpg <- left_join( mpg, fuel, by = 'fl' )
head( mpg, 5 )
mpg %>% 
  select( model, fl, price_fl ) %>% 
  head( 5 )


#
# 기술 통계량 함수 : summary(), psych package의 describe()
# 
# describe() - min : 최소값, quantile(,0.25) : 1사분위수, median : 중앙값, mean : 평균
#              quantile(,0.75) : 3사분위수, max : 최대값, vars : 변수개수, n : 관측치
#              sd : 표준편차, range : 범위, kurtosi : 첨도, skew : 왜도
summary( mtcars )

install.packages( "psych" )
library( psych )
describe( mtcars )

#
# 빈도 분석 : descr package의 freq()
#
install.packages( "descr" )
library( descr )

df <- data.frame( id = c( 1, 2, 4 ),
                  gender = c( '남', '여', '남' ) )

table( df$gender )

freq( df$gender )
freq( df$gender, plot = F ) 
