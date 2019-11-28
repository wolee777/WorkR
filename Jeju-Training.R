#
# 1 ~ 1000사이의 3의배수와 5의 배수를 한 줄에 10개씩 출력하고
# 마지막에 개수를 출력
#
i <- 1
count <- 0
lineCount <- 1
multiple3 <- NULL
multiple5 <- NULL

while ( i <= 1000 ) {
  multiple3 <- i %% 3
  multiple5 <- i %% 5
  if ( multiple3 == 0 | multiple5 == 0 ) {
    count <- count + 1
    cat( i, " " )
    lineCount <- lineCount + 1
    if ( lineCount > 10 ) {
      lineCount <- 1
      print( '\n' )
    }
  }
  i <- i + 1
}

cat( '\n', '1 ~ 1000사이의 3의 배수와 5의 배수의 개수 : ', count, '\n' )
