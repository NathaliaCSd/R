#manipulacao e transformacao de dados usando DPLYR
#material criado pela professora andreza palma

#dplyr é a GRAMATICA PARA MANIPULACAO DE DADOS 
#sera usado um conjunto de dados do proprio r que contem informacoes sobre voos partindo de nova york no ano de 2013
# chamado nycflights13

install.packages('nycflights13')
library(nycflights13)
install.packages("dplyr")
library(dplyr)
nycflights13::flights

#dplyr possui 4 funcoes principais 

#filter()
#filtra um subconjunto de observacoes de acordo com seus valores 
#resumindo = faz uma selecao por linhas


#FILTRANDO TODOS OS VOOS DE 01/01/2013
ex1 = filter(flights, month == 1, day == 1)
ex1

#arrange()
#ORDENA AS LINHAS DE ACORDO COM ALGUMA REGRA
#argumento desc= pode ser utilizado para gerar uma ORDEM DESCRESCENTE 

arrange(flights, desc(dep_delay))

#se usar varias colunas em arrange(), cada coluna adicional eh usada para desempate nas colunas anteriores
arrange(flights, year, month, day)



#select()
#SELECIONA UM SUBCONJUNTO DE VARIAVEIS (POR COLUNAS)

select(flights, year, month, day)

#mutate()
#ADICIONA NOVAS COLUNAS QUE SEJAM FUNCOES DE COLUNAS EXISTENTES

mutate(flights,
       ganho = dep_delay - arr_delay,
       velocidade = distance / air_time * 60)
#GANHO = SUBTRACAO ENTRE DUAS VARIAVEIS 
#VELOCIDADE = DIVISAO ENTRE DISTANCIA E TEMPO NO AR VEZES 60

#pipe (%>%)
#USA O RESULTADO DO ARGUMENTO QUE ESTA A DIREITA COMO ARGUMENTO DO QUE ESTA DO LADO ESQUERDO

ex2 = flights %>% filter(month == 1, day == 1)
ex2

#ORDENAR USANDO PIPE 

flights%>%arrange(desc(dep_delay))


#summarise() e group_by()
#SUMMARISE SOZINHO RETORNA UM VALOR (RESUMO DE VALORES)
#GROUP_BY + SUMMARISE RETORNA RESUMOS AGRUPADOS 

atraso_data <- group_by(flights, year, month, day)
summarise(atraso_data, atrasos = mean(dep_delay, na.rm = TRUE))

#na.rm utilozado para evitar missing values 