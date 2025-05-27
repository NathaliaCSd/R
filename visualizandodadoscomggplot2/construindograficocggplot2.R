#visualizando dados com ggplot2
#material da prof andreza palma

#ggplot eh um pacote. sua gramatica vem das multiplas camadas de um grafico

#instalando e carregando o pacote 
install.packages("ggplot2")
library(ggplot2)

#conjunto de dados do proprio r
data("mtcars")
#eh um banco de dados com caracteristicas de diferentes modelos de carro

head(mtcars)

#sera construido um grafico usando ggplot

#inicia o plot 
g <- ggplot(mtcars)

g <- g + geom_point(aes(x = hp, y = mpg, color = factor(am)), size = 3)
#geom_point adiciona pontos
#size = 3 define o tamanho de todos os pontos

#alterando a escala de cores
g <- g + scale_color_manual("Automatic", values = c("red", "blue"), labels = c("No", "Yes"))

#definindo rotulos (titulos)
g <- g + labs(title = 'Relacao entre consumo, potencia e tipo de cambio', y = 'Consumo', x = 'Potencia')
g

#TODO grafico tem 3 conjuntos de elementos 
#conjunto de dados (data)
#sistema de coordenadas(mapping)
#conjunto de figuras geometricas que caracteriza o grafico (geom)

