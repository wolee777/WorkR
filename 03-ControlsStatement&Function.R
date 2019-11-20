#
# 제어문 & 함수
#
#
# 조건문
# 
# 기본 if~else문
job.type <- 'A'

if ( job.type == 'B' ) {
  bonus <- 200
} else {
  bonus <- 100
}

print( bonus )

joy.type <- 'B'
bonus <- 100

if ( job.type == 'A' ) {
  bonus <- 200
}

print( bonus )

# 다중 if-else문
score <- 85

if ( score > 90 ) {
  grade <- 'A'
} else if ( score > 80 ) {
  grade <- 'B'
} else if ( score > 70 ) {
  grade <- 'C'
} else if ( score > 60 ) {
  grade <- 'D'
} else {
  grade <- 'F'
}

print( grade )

# 조검문에서 논리연산자 사용
a <- 10
b <- 20

if ( a > 5 & b > 5 ) {
  print( a + b )
} 

if ( a > 5 | b > 30 ) {
  print( a * b )
}

# ifelse문
a <- 10
b <- 20

if ( a > b ) {
  c <- a
} else {
  c <- b
}

print( c )

a <- 10
b <- 20
c <- ifelse( a > b, a, b )

print( c )

#
# 반복문
#
# for문
for ( i in 1:5 ) {
  print( '*' )
}

for ( i in 6:10 ) {
  print( i )
}

for ( i in 1:9 ) {
  cat( '2 * ', i, ' = ', 2 * i, '\n' )
}

for ( i in 1:20 ) {
  if ( i %% 2 == 0 ) {
    print( i )
  }
}

sum <- 0

for ( i in 1:100 ) {
  sum <- sum + i
}

print( sum )

norow <- nrow( iris )
mylabel <- c()

for ( i in 1:norow ) {
  if ( iris$Petal.Length[ i ] <= 1.6 ) {
    mylabel[ i ] <- 'L'
  } else if ( iris$Petal.Length[ i ] >= 5.1 ) {
    mylabel[ i ] <- 'H'
  } else {
    mylabel[ i ] <- 'M'
  }
}

print( mylabel )
newds <- data.frame( iris$Petal.Length, mylabel )
head( newds )

# while문
sum <- 0
i <- 1

while ( i <= 100 ) {
  sum <- sum + i
  i <- i + 1
}

print( sum )

# break와 next
#
# break
sum <- 0

for ( i in 1:10 ) {
  sum <- sum + i
  if ( i >= 5 ) {
    break
  }
}

sum

# next
sum <- 0

for ( i in 1:10 ) {
  if ( i %% 2 == 0 ) {
    next
  }
  sum <- sum + i
}

sum

#
# apply()
#
apply( iris[ , 1:4 ], 1, mean )
apply( iris[ , 1:4 ], 2, mean )

#
# 사용자 정의 함수
#
# 사용자 정의 함수 만들기
mymax <- function( x, y ) {
  num.max <- x
  if ( y > x ) {
    num.max <- y
  }
  
  return ( num.max )
}

mymax( 10, 15 )
a <- mymax( 20, 15 )
b <- mymax( 31, 45 )
print( a + b )

# 사용자 정의 함수의 매개변수 초기값 설정
mydiv <- function( x, y = 2 ) {
  result <- x / y
  
  return ( result )
}

mydiv( x = 10, y = 3 )
mydiv( 10, 3 )
mydiv( 10 )

# 함수가 반환하는 결과값이 여러 개일 때의 처리
myfunc <- function( x, y ) {
  val.sum <- x + y
  val.mul <- x * y
  
  return( list( sum = val.sum, mul = val.mul ) )
}

result <- myfunc( 5, 8 )
s <- result$sum
m <- result$mul
cat( '5 + 8 = ', s, '\n' )
cat( '5 * 8 = ', m, '\n' )

# 사용자 정의 함수 저장 및 호출
setwd( "H:/Workspace/Workspace-R/WorkR" )
source( "myfunc.R" )

# 함수 사용
a <- mydiv( 20, 4 )
b <- mydiv( 30, 4 )
a + b
mydiv( mydiv( 20, 2 ), 5 )

#
# 조건에 맞는 데이터의 위치 찾기
#
score <- c( 76, 84, 69, 50, 95, 6, 82, 71, 88, 84 )
which( score == 69 )                                # 성적이 69인 학생은 몇 번째에 있나
which( score >= 85 )                                # 성적이 85 이상인 학생은 몇 번째에 있나
max( score )
which.max( score )                                  # 최고 점수는 몇 번째에 있나
min( score )
which.max( score )                                  # 최저 점수는 몇 번째에 있나

score <- c( 76, 84, 69, 50, 95, 60, 82, 71, 88, 84 )
idx <- which( score <= 60 )
score[ idx ] <- 61
score

idx <- which( score >= 80 )
score.high <- score[ idx ]
score.high

idx <- which( iris$Petal.Length > 5.0 )
idx
iris.big <- iris[ idx, ]
iris.big

idx <- which( iris[ , 1:4 ] > 5.0, arr.ind = TRUE )
idx
