#
# ggplot2 기본문법
#
# ggplot2 Homepage learning( https://r4ds.had.co.nz/data-visualisation.html )
install.packages( "tidyverse" )
library( tidyverse )

#install.packages( "ggplot2" )  # tidyverse package에 포함 
#require( ggplot2 )

dim( mpg )
str( mpg )
head( mpg )
tail( mpg )
View( mpg )

# creating a ggplot
ggplot( data = mpg ) +
  geom_point( mapping = aes( x = displ, y = hwy ) )

# A graphing template
# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# Aesthetic mappings
ggplot( mpg, aes( displ, hwy, colour = class ) ) +
  geom_point()

ggplot( data = mpg ) +
  geom_point( mapping = aes( x = displ, y = hwy, color = class ) )

ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy, size = class ) )
#> Warning: Using size for a discrete variable is not advised.

# alpha
ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy, alpha = class ) )

# shape
ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy, shape = class ) )

# color
ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy ), color = "blue" )

# Facets
ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy ) ) + 
  facet_wrap( ~ class, nrow = 2 )

ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy ) ) + 
  facet_grid( drv ~ cyl )

# Geometric objects
ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy ) )

ggplot( data = mpg ) + 
  geom_smooth( mapping = aes( x = displ, y = hwy ) )

ggplot( data = mpg ) + 
  geom_smooth( mapping = aes( x = displ, y = hwy, linetype = drv ) )

ggplot( data = mpg ) +
  geom_smooth( mapping = aes( x = displ, y = hwy ) )

ggplot( data = mpg ) +
  geom_smooth( mapping = aes( x = displ, y = hwy, group = drv ) )

ggplot( data = mpg ) +
  geom_smooth( mapping = aes( x = displ, y = hwy, color = drv ),
    show.legend = FALSE )

# 다른 형태 사용법
ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy ) ) +
  geom_smooth( mapping = aes( x = displ, y = hwy ) )

ggplot( data = mpg, mapping = aes( x = displ, y = hwy ) ) + 
  geom_point() + 
  geom_smooth()

ggplot( data = mpg, mapping = aes( x = displ, y = hwy ) ) + 
  geom_point( mapping = aes( color = class ) ) + 
  geom_smooth()

ggplot( data = mpg, mapping = aes( x = displ, y = hwy ) ) + 
  geom_point( mapping = aes( color = class ) ) + 
  geom_smooth( data = filter( mpg, class == "subcompact" ), se = FALSE )

# Exercises
ggplot( data = mpg, mapping = aes( x = displ, y = hwy, color = drv ) ) + 
  geom_point() + 
  geom_smooth( se = FALSE )

# 동일 결과
ggplot( data = mpg, mapping = aes( x = displ, y = hwy ) ) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point( data = mpg, mapping = aes( x = displ, y = hwy ) ) + 
  geom_smooth( data = mpg, mapping = aes( x = displ, y = hwy ) )


#Statistical transformations
dim( diamonds )
str( diamonds )
head( diamonds )
tail( diamonds )
View( diamonds )

ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut ) )

ggplot( data = diamonds ) + 
  stat_count( mapping = aes( x = cut ) ) 

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot( data = demo ) +
  geom_bar( mapping = aes( x = cut, y = freq ), stat = "identity" )

ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, y = ..prop.., group = 1 ) )

# 결과?
ggplot( data = diamonds ) + 
  stat_summary( mapping = aes( x = cut, y = depth ),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median )

# Exercises
ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, y = ..prop.. ) )

ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, fill = color, y = ..prop.. ) )


# Position adjustments
ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, colour = cut ) )

ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, fill = cut ) )

ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, fill = clarity ) )

ggplot( data = diamonds, mapping = aes( x = cut, fill = clarity ) ) + 
  geom_bar( alpha = 1/5, position = "identity" )

ggplot( data = diamonds, mapping = aes( x = cut, colour = clarity ) ) + 
  geom_bar( fill = NA, position = "identity" )

ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, fill = clarity ), position = "fill" )

ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, fill = clarity ), position = "dodge" )


ggplot( data = mpg ) + 
  geom_point( mapping = aes( x = displ, y = hwy ), position = "jitter" )

# Exercises
ggplot( data = mpg, mapping = aes( x = cty, y = hwy ) ) + 
  geom_point()

# Coordinate systems
ggplot( data = mpg, mapping = aes( x = class, y = hwy ) ) + 
  geom_boxplot()

ggplot( data = mpg, mapping = aes( x = class, y = hwy ) ) + 
  geom_boxplot() +
  coord_flip()

install.packages( "maps" )
library( maps )

nz <- map_data("nz")
dim( nz )
str( nz )
head( nz )
tail( nz )
View( nz )

ggplot( nz, aes( long, lat, group = group ) ) +
  geom_polygon( fill = "white", colour = "black" )

ggplot( nz, aes( long, lat, group = group ) ) +
  geom_polygon( fill = "white", colour = "black" ) +
  coord_quickmap()


bar <- ggplot( data = diamonds ) + 
  geom_bar( mapping = aes( x = cut, fill = cut ), 
    show.legend = FALSE,
    width = 1 ) + 
  theme( aspect.ratio = 1 ) +
  labs( x = NULL, y = NULL )

bar + coord_flip()
bar + coord_polar()

# Exercises
ggplot( data = mpg, mapping = aes( x = cty, y = hwy ) ) +
  geom_point() + 
  geom_abline() +
  coord_fixed()

# The layered grammar of graphics
#ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(
#    mapping = aes(<MAPPINGS>),
#    stat = <STAT>, 
#    position = <POSITION>
#  ) +
#  <COORDINATE_FUNCTION> +
#  <FACET_FUNCTION>



#
#
#
require( dplyr )
STOCK = read.csv("E:/workR-Jeju/Uniqlo(FastRetailing) 2012-2016 Training - stocks2012-2016.csv")


graph = ggplot( STOCK ) + 
        geom_histogram( aes( x = Open ), binwidth = 1000, fill = 'royalblue', alpha = 0.4 ) +
        theme_bw() +
        xlab( "개장 주가" ) + 
        ylab( "" ) +
        ggtitle( "Histogram" )
graph
