#MAPEAMENTO ESTETICO
#caracteristicas visuais dos objetos geometricos (pontos, barras, linhas, etc)
#funcao aes()

#OBJETOS GEOMETRICOS 
#comecam com geom_ e seguido pelo tipo de objeto

#dispersao: geom_point()
#barras: geom_bar()
#histograma: geom_histogram()
#boxplot: geom_boxplot()
#densidade: geom_density()
#linhas: geom_line()

#camadas sao unidas com um sinal de +

#CRIANDO GRAFICO DE DISPERSAO (pontos)

g1 <- ggplot(mtcars, aes(y = mpg, x = disp)) + geom_point() + geom_smooth(se = FALSE, method = "lm")
#se = FALSE retira o intervalo de confianca
g1

#agora, com o intervalo de confianca 
g1 <- ggplot(mtcars, aes(y = mpg, x = disp)) + geom_point() + geom_smooth(method = "lm")
g1

#mudando as cores dos pontos
g3 <- ggplot(mtcars, aes(y = mpg, x = disp)) + geom_point(color = 'red') + geom_smooth(se = FALSE, method = "lm")
g3

#criando diferentes cores para diferentes categorias de cilindros (variavel cyl do banco de dados)
mtcars$cyl = as.factor(mtcars$cyl)
g4 <- ggplot(mtcars, aes(y = mpg, x = disp)) + geom_point(aes(color = cyl))
g4

#ou diferentes formas para diferentes categorias de cilindros (grupos)
g5 <- ggplot(mtcars, aes(y = mpg, x = disp)) + geom_point(aes(shape = cyl, color = cyl))
g5

#modificando a forma e o tamanho do ponto
g6 <- ggplot(mtcars, aes(y = mpg, x = disp)) + geom_point(shape = 8, color = 'steelblue', size = 5)
g6

#mudando o preenchimento da figura 
g7 <- ggplot(mtcars, aes(y = mpg, x = disp)) + geom_point(shape = 23, fill = "blue", color = 'darkred', size = 3)
g7