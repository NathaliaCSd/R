#verificando informacoes de um banco de dados USArrests
#que consiste de variaveis sobre a taxa de criminalidade 
#para cada 100 mil habitantes por estado americano

library(ggplot2)

#carregar conjunto de dados USArrests
data("USArrests")
mydata = USArrests

#ver a dimensao do banco de dados 
dim(mydata)

#seis primeiras linhas
head(mydata)
#seis ultimas linhas
tail(mydata)

#sumatio estatistico do conjunto de dados 
summary(mydata)

#nomes das variaveis
names(mydata)

#nomes dos estados norte-americanos
row(mydata)

#sabendo mais sobre o banco de dados
help("USArrests")

#conjunto de dados em cross-section (observacoes de varias unidades - estados em unico periodo de tempo, 1973)

#fazendo um grafico de distribuicao de frequencia (um histograma)
#será da frequencia de assassinatos por estado 

g1 <- ggplot(data = mydata) + geom_histogram(mapping = aes(x = Murder))
g1

#grafico de densidade usando kernel gaussiano
g2 <- ggplot(data = mydata) + geom_density(mapping = aes(x = Murder), kernel = 'gaussian')
g2

#diagrama de caixa ou box-plot
#quartis de distribuicao, onde pode analisar a dispersao da variavel
g3 <- ggplot(data = mydata) + geom_boxplot(mapping = aes(x = 1, y = Murder))
g3

#violin-plot combinacao de um box-plot com um grafico de densidade
ggplot(data = mydata) + geom_violin(mapping = aes(x = 1, y = Murder))

#colocando titulos, subtitulos 
ggplot(data = USArrests) + geom_histogram(mapping = aes(x = Assault), bin = 10) + labs(x = 'Assaltos para cada 100 mil habitantes', y = 'Frequencia', title = 'Assaltos em Estados Americanos')

#alterando as cores das barras 
#comando fill dentro de geom_histogram

ggplot(data = USArrests) + geom_histogram(mapping = aes(x = Assault), bins = 10, fill = 'blue') + labs(x = 'Assaltos para cada 100 mil habitantes', y = 'Frequencia', title = 'Assaltos em Estados Americanos')

#mudando as cores das bordas
ggplot(data = USArrests) + geom_histogram(mapping = aes(x = Assault), bins = 10, fill = 'blue', color = 'black') + labs(x = 'Assaltos para cada 100 mil habitantes', y = 'Frequencia', title = 'Assaltos em Estados Americanos')

#alterar o numero de barras
#bills
#por default eh 30

ggplot(data = USArrests) + geom_histogram(mapping = aes(x = Assault), bins = 4, fill = 'blue', color = 'black') + labs(x = 'Assaltos para cada 100 mil habitantes', y = 'Frequencia', title = 'Assaltos em Estados Americanos')

#fill = rainbow preenche as barras com as 4 cores do arco-iris
ggplot(data = USArrests) + geom_histogram(mapping = aes(x = Assault), bins = 4, fill = rainbow(4), color='black') + labs(x = 'Assaltos para cada 100 mil habitantes', y = 'Frequencia', title = 'Assaltos em Estados Americanos')

#colour muda a cor do contorno
#fill muda a cor do preenchimento 
ggplot(data = USArrests) + geom_boxplot(mapping = aes(x = 1, y = Murder), color = 'red', fill = 'pink')

#grafico de dispersao a fim de verificar como o nivel de assassinatos se relaciona com o tamanho da populacao urbana
ggplot(mydata, aes(x = UrbanPop, y = Murder)) + geom_point(color = 'blue', size = 4) + labs(y = "Assassinatos", x = "Populacao Urbana", title = "Relacao entre assassinatos e Populacao Urbana")
