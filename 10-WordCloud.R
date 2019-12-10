#
# 워드 클라우드
#
# 분석 대상 데이터중에는 숫자가 아니 문자나 문자 형태의 데이터도 있다.
# 문자 형태의 데이터는 숫자 형태의 데이터를 다룰 때 사용한 방법을 적용하기 어렵다.
# 이러한 문제를 해결하기 위해 등장한 방법중의 하나가 바로 워드 클라우드이다.
# 
# 워드 클라우드( Word Cloud ) : 텍스트 데이터를 분가하는 대표적이 방법이다.
#      대상 데이터에서 단어( 주로 명사 )를 추출하고 단어들의 출현 빈도수를 계산하여 시각화하는 기능을 한다.
#      출현 빈도수가 높은 단어는 그만큼 중요하거나 관심도가 높다는 것을 의미한다.
#      워드 클라우드에서는 출현 빈도수가 높을수록 큰 글씨로 표현된다.
#
# Data Mining : 의사결정 수단을 위하여 대용량의 DataBase로부터 의미 있는 규칙과 패턴을 발견하는 기법
#
# Text Mining : 텍스트 기반 DataBase로부터 자연어 처리 기술을 바탕으로 기존에 알려지지 않은 유용한 패턴과
#               지식을 발견하기 위한 목적으로 언어(텍스트)와 기계적 알고리즘(분석)의 이해관계가 상충됨으로써
#               사용자가 관심을 가지는 정보를 자동적으로 추출하는 프로세스를 의미
#
#   텍스트 마이닝은 크게 자료 처리과정(data processing)과 자료 분석(data analysis)으로 나눌 수 있다. 
#         자료처리과정은 비구조화 데이터를 분석에 용이하도록 가공 및 정제하는 단계이고 자료 분석은 데이터 마이닝,  
#         기계학습(machine learning), 통계학(statistics) 등을 활용하여 텍스트로부터 유의미한 정보를 추출하는 
#         단계이다
#
# 한글 워드 클라우드를 위한 준비
#
# 1. Java 실행 환경 구축
# 2. 텍스트로 된 문서 파일 준비
#  - 텍스트 파일 만들때 주의할 점은 파일의 끝부분 처리를 마지막 문장이 끝나면 반드시 줄 바꿈을 한 후 저장한다.
#  - 인코딩을 'UTF-8'을 선택하여 저장한다.
#  - 파일명이나 파일이 저장된 폴더 경로에 한글이 포함되지 않도록 한다.
#
# 인터넷 검색어 분석
#     네이버 데이터랩 : https://datalab.naver.com/
#     구글 트렌드 : https://trends.google.co.kr/trends/?geo=KR
#
# 행정안전부 불법찰영 범죄 예방 대국민 담화문에 대한 워드 클라우드
#
# 1. 명사 추출하기
Sys.setenv( JAVA_HOME = 'D:/Java/jdk1.8.0_181/jre' )

library( wordcloud )      # 워드 클라우드
library( KoNLP )          # 한국어 처리, https://github.com/haven-jeon/KoNLP
library( RColorBrewer )   # 색상 선택

library( dplyr )
library( ggplot2 )

setwd( 'H:/Workspace/Workspace-R/WorkR' )

text <- readLines( 'mis_document.txt', encoding = 'UTF-8' )

buildDictionary( ext_dic = "woorimalsam" )            # '우리말씀' 한글사전 로딩
pal2 <- brewer.pal( 8, 'Dark2' )                      # 팔레드 생성
pal3 <- brewer.pal( 9, 'Blues' )[ 5:9 ]               # 팔레드 생성
noun <- sapply( text, extractNoun, USE.NAMES = F )    # 명사 추출, 
      # sapply() : 행렬 구조에서 모든 행에 함수 적용할때 사용하는 함수, sapply( 데이터, 적용할 함수 )
      # USE.NAMES : 열 이름을 나타내는 옵션, T / F(열이름이 나타내지 않는다)
noun

# 2. 빈도수 높은 단어를 막대 그래프로 작성
noun2 <- unlist( noun )                                     # 추출된 명사 통합( list형태 -> vector형태로 )
wordcount <- table( noun2 )                                 # 단어 빈도수 계산
sort.noun <- sort( wordcount, decreasing = T )[ 1:10 ]      # 빈도수가 높은 단어 10개 추출
sort.noun
sort.noun <- sort.noun[ -1 ]                                # 공백 단어 제거

barplot( sort.noun,
         names.arg = names( sort.noun ),
         col = 'steelblue',
         main = '빈도수 높은 단어',
         ylab = '단어 빈도수' )

df <- as.data.frame( sort.noun )
df
ggplot( df, aes( x = df$noun2, y = df$Freq ) ) +
  geom_bar( stat = 'identity',
            width = 0.7,
            fill = 'steelblue' ) +
  ggtitle( '빈도수 높은 단어' ) +
  theme( plot.title = element_text( size = 25, 
                                    face = 'bold',
                                    colour = 'steelblue',
                                    hjust = 0,
                                    vjust = 1 ) ) +
  labs( x = '명사', y = '단어빈도수' ) +
  geom_text( aes( label = df$Freq ), hjust = -0.3 ) +     # 빈도 표시
  coord_flip()

# 3. 워드 클라우드 작성
wordcloud( names( wordcount ),        # 단어들
      freq = wordcount,               # 단어들의 빈도
      scale = c( 6, 0.7 ),            # 단어의 폰트 크기(최대, 최소)
      min.freq = 3,                   # 단어의 최소 빈도(빈도가 3이상이 단어들만 표시)
      random.order = F,               # 단어의 출력 위치(T : 무작위, F : 빈도수가 높은 단어일수록 중앙에)
      rot.per = .1,                   # 90도 회전 단어 비율(세로 방향에 포시할 단어 비율, .1은 10%)
      colors = pal2 )                 # 단어의 색

wordcloud( names( wordcount ),        # 단어들
           freq = wordcount,               # 단어들의 빈도
           scale = c( 6, 0.7 ),            # 단어의 폰트 크기(최대, 최소)
           min.freq = 3,                   # 단어의 최소 빈도(빈도가 3이상이 단어들만 표시)
           random.order = F,               # 단어의 출력 위치(T : 무작위, F : 빈도수가 높은 단어일수록 중앙에)
           rot.per = .1,                   # 90도 회전 단어 비율(세로 방향에 포시할 단어 비율, .1은 10%)
           colors = pal3 )                 # 단어의 색

# 4. 워드 클라우드 수정( 의미 없는 단어 삭제, 중요 단어인데 사전에 없어서 생략된 단어등 ) 
#    빈도수 높은데 워드 클라우드에 없으면 사용자 사전에 추가( '정치'가 없다고 가정하고 사전에 추가 과정)
buildDictionary( ext_dic = 'woorimalsam',
                 user_dic = data.frame( '정치', 'ncn' ),    # 'ncn' : KAIST 품사 태그 기눈으로 비서술성명사로 설정하는 코드
                 replace_usr_dic = T )

noun <- sapply( text, extractNoun, USE.NAMES = F )
noun2 <- unlist( noun )               # 추출된 명사 통합

# 무의미한 단어 제거
noun2 <- noun2[ nchar( noun2 ) > 1 ]  # 1글자 단어 제거
noun2 <- gsub( "하지", "", noun2 )    # '하지' 제거, gsub() : 문자열을 바꾸는 함수, gsub( 찾는단어, 바꿀 단어, 찾을 위치 )
noun2 <- gsub( "때문", "", noun2 )    # '때문' 제거

wordcount <- table( noun2 )           # 단어 빈도수 계산 
wordcloud( names( wordcount ),        
           freq = wordcount,          
           scale = c( 6, 0.7 ),       
           min.freq = 3,              
           random.order = F,               
           rot.per = .1,                   
           colors = pal2 )                 


#
# 애국가로 형태소 분석
#
# KoNLP package : 시스템 사전, 세종 사전, NIADIC 사전이 포함, 사전마다 포함하는 단어수가 상이
#                 28만 단어,   37만 단어, 98만 단어
library( KoNLP )
useSystemDic()      # 시스템 사전 설정
useSejongDic()      # 세종 사전 설정
useNIADic()         # NIADic 사전 설정

# 텍스트 Download 및 형태소 분석
# 애국가 가사 : https://mois.go.kr/frt/sub/a06/b08/nationalIcon_3/screen.do
#
# 1. 사전 설정
library( KoNLP )
useSejongDic()

# 2. 텍스트 데이터 가져오기
word_data <- readLines( '애국가(가사).txt' )
word_data 

# 3. 명사 추출
word_data2 <- sapply( word_data, extractNoun, USE.NAMES = F )
word_data2

# 3.1 제대로 추출되지 않은 단어를 사용자 정의 사전에 등록 
add_words <- c( '백두산', '남산', '철갑', '가을', '하늘', '달' )
buildDictionary( user_dic = data.frame( add_words, rep( 'ncn', length( add_words ) ) ), replace_usr_dic = T )
get_dictionary( 'user_dic' )

# 3.2 단어 추가 후 다시 명사 추출
word_data2 <- sapply( word_data, extractNoun, USE.NAMES = F )
word_data2

# 4. 행렬을 벡터로 변환
undata <- unlist( word_data2 )
undata

# 5. 사용 빈도 확인
word_table <- table( undata )
word_table

# 6. 필터링 하기 : 두 글자 이상 단어만 선별, 공백이나 한 자리 숫자가 걸러짐
undata2 <- undata[ nchar( undata ) >= 2 ]
undata2
word_table2 <- table( undata2 )
word_table2

# 7. 데이터 정렬
sort( word_table2, decreasing = T )

# 애국가를 이용한 형태소 분석 완료
# 가장 기본적인 전처리 과정만 거쳐 보조사와 명사가 하나로 출력되는 등 100% 정확한 데이터는 아니다.

# 애국가 단어로 워드 클라우드 작성
install.packages( 'wordcloud2' )

library( wordcloud2 )

# 기본형 워드 클라우드 작성
wordcloud2( word_table2 )

# 배경 및 색상 변경
wordcloud2( word_table2, color = 'random-light', backgroundColor = 'black' )

# 모양 변경
wordcloud2( word_table2, fontFamily = '맑은 고딕', size = 1.2, 
            color = 'random-light', backgroundColor = 'black',
            shape = 'star' )  # shape : circle(default), cardioid, diamond, triangle-forword, triangle, pentagon

# 다양한 워드 클라우드 만들기
# 
# 선택한 색상만 반복되는 워드 클라우드
wordcloud2( word_table2, size = 1.6, color = rep_len( c( 'red', 'blue'), 
            nrow( word_table2 ) ) )

wordcloud2( demoFreq, size = 1.6, color = rep_len( c( 'red', 'blue'), nrow( demoFreq ) ) )

# 일정한 방향으로 정렬된 워드 클라우드
wordcloud2( word_table2, minRotation = -pi / 6, maxRotation = -pi / 6, rotateRatio = 1 )

wordcloud2( demoFreq, minRotation = -pi / 6, maxRotation = -pi / 6, rotateRatio = 1 )


# 적용안됨
#
# 원하는 이미지에 워드 클라우드 표시 : 이미지는 배경과 워드클라우드로 표현될 부분의 색상이 확연하게 구분되어야 한다.
#                                      배경이 흰색이고 요소가 검은색인 이미지 추천
wordcloud2( word_table2, color = rep_len( c( 'red', 'blue'), nrow( demoFreq ) ), figPath = 'peace.png' )
wordcloud2( demoFreq, color = rep_len( c( 'red', 'blue'), nrow( demoFreq ) ), figPath = 'peace.png' )
