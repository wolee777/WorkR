#
# dplyr 활용
#
require( dplyr )
STOCK = read.csv("E:/workR-Jeju/Uniqlo(FastRetailing) 2012-2016 Training - stocks2012-2016.csv")

dim( STOCK )
str( STOCK )
head( STOCK )
tail( STOCK )
View( STOCK )

STOCK$Date = as.Date(STOCK$Date)
STOCK$Year = as.factor(format(STOCK$Date,"%Y"))
STOCK$Day = as.factor(format(STOCK$Date,"%a"))

str( STOCK )

# 집계 
# group_by(), summarise()
group_data <- STOCK %>% 
                group_by( Year, Day ) %>% 
                summarise( Mean = round( mean( Open ) ),
                           Median = round( median( Open ) ),
                           Max = round( max( Open ) ),
                           Counts = length( Open ) )

head( group_data )

# ungroup()
ungroup_data <- group_data %>% ungroup()    # group 해제
head( ungroup_data )

# count()    
count_data <- STOCK %>% group_by( Year, Day ) %>% count()   # count
head( count_data )

# 데이터 Sampling
# 조건에 따라 데이터 추출
# filter()
subseted_data  <- group_data %>% filter( Year == "2012" )
head( subseted_data )

# 데이터 중복 제거
sl = sample( 1:nrow( group_data ), 500, replace = TRUE )  # 중복 데이터 생성
duplicated_data  <- group_data[ sl, ]
dim( duplicated_data )

# distinct()
duplicated_data2 <- duplicated_data %>% distinct( Year, Day, Mean, Median, Max, Counts )
dim( duplicated_data2)

# Sample 데이터 무작위 추출
# sample_frac(), sample()
# group이 지정되어 있는 데이터
sample_frac_gr <- group_data %>% sample_frac( size = 0.4, replace = FALSE )
sample_frac_gr

# ungroup으로 그룹지정을 해제한 데이터
sample_frac_un <- ungroup_data %>% sample_frac( size = 0.4, replace = FALSE )
sample_frac_un

# sample_n()
sample_n_gr <- group_data %>% sample_n( size = 2, replace = FALSE )
sample_n_gr

sample_n_un <- ungroup_data %>% sample_n( size = 10, replace = FALSE )
sample_n_un

# 정해진 index에 따라 데이터 추출
# slice(), top_n()
slice_data <- ungroup_data %>% slice( 1:10 )
slice_data

top_n_data <- ungroup_data %>% top_n( 5, Mean )
top_n_data

# 데이터 정렬
# arrange()
# Ascending
asce_data <- ungroup_data %>% arrange( Mean )
head( asce_data )

# Descending 
desc_data <- ungroup_data %>% arrange( -Mean )
head( desc_data )

# 원하는 변수만 뽑기
# select()
# index 활용
select_data <- group_data %>% select( 1:2 )
head( select_data )

# column명 활용
select_data <- group_data %>% select( Year, Day )
head( select_data )

# select_if()
# Factor 변수만 
select_if_data1 <- group_data %>% select_if( is.factor )
head( select_if_data1 )


# integer 변수만
select_if_data2 <- group_data %>% select_if( is.integer )
head( select_if_data2 )

# 새로운 변수 만들기
# mutate()
mutate_data <- STOCK %>% mutate( Divided = round( High / Low, 2 ) ) %>% 
                  select( Date, High, Low, Divided )
head( mutate_data )

# mutate_if()
mutate_if_data = STOCK %>% mutate_if( is.integer, as.numeric )
str( mutate_if_data )

# mutate_at()
mutate_at_data = STOCK %>% mutate_at( vars( -Date, -Year, -Day ), log ) %>% 
                    select_if( is.numeric )
head( mutate_at_data )
