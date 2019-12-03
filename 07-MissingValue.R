#
# 누락된 자료의 처리
#
require( moonBook )
dim( acs )
str( acs )
head( acs )

na.count = apply( acs, 2, function( x ) sum( is.na( x ) ) )
na.count
na.count[ na.count > 0 ]

barplot( na.count[ na.count > 0 ] )

install.packages( "VIM" )
library( VIM )

aggr( acs, prop = FALSE, numbers = TRUE )
marginplot( acs[ c( "EF", "BMI" ) ], pch = 20, col = c( "darkgray", "red", "blue" ) )

x = as.data.frame( abs( is.na( acs ) ) )
y = apply( x, 2, function(x) sum( x ) > 0 )
round( cor( x[ y ] ), 2 )
