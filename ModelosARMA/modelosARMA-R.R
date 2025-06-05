#modelos ARMA -- R
#professora Andreza Palma

#instalando pacootes necessários

install.packages("tseries")
install.packages("forecast")

library(BatchGetSymbols)
library(tidyverse)
library(ggthemes)
#library(FinTS)
#library(WriteXLS)
library(xtable)
library(tbl2xts)
library(forecast)
library(tseries)
library(timeSeries)


#usando serie de retornos diarios do IBOVESPA desde 21/03/2019

#ticker IBOVESPA
tickers <- c("^BVSP")

ibov <- BatchGetSymbols(tickers, first.date = '2019-03-21', last.date = Sys.time(), type.return = "log", freq.data = "daily")


ibov <- ibov[[2]]

#selecionando os retornos diarios da serie do IBOVESPA 
#as datas da serie serao separadas. 
#variavel será declarada como serie temporal

daily_returns <- ibov %>%select(ref.date, ret.closing.prices)

date <- daily_returns %>%select(ref.date) %>% rename(date = ref.date) %>% slice(-1)

daily_returns <- daily_returns %>% select(ret.closing.prices) %>% slice(-1)

#declarando como serie temporal 
#utilizando comaando as.ts

daily_returns = as.ts(daily_returns)

#IDENTIFICACAO DO MODELO

#podemos estipular o numero de defasagens a ser incluvido atraves de lag.max 

acf(daily_returns, lag.max = 36)
pacf(daily_returns, lag.max = 36)

#é possivel tambem usar a funcao tsdisplay
tsdisplay(daily_returns)

#Estimacao do modelo ARMA

#modelo AR(1)
#comando arima -- necessario inserir a base de dados e a ordem ARIMA desejada
#no caso de AR(1), temos um ARIMA(1,0,0)

#sempre que a serie for estacionaria, a ordem I eh 0, pois a variavel eh integrada de ondem zero

x = arima(daily_returns, order = c(1,0,0))


#diagnostico do modelo

#apos estimar o modelo, é preciso verificar se o mesmo é adequado atraves da analise de residuos 
#que devem ter o comportamento de ruído branco 
#é possivel ver isso pela estatistica Q (teste de box-pierce e ljung-box),
#das FAC e FACP e da analise visual do grafico dos residuos 

tsdiag(x)
Box.test(x$residuals, lag=1)
Box.test(residuals(x), type = "Ljung")
acf(residuals(x))
pacf(residuals(x))

#grafico dos residuos
plot.ts(x$residuals)

#PREVISAO 
forecast <- predict(x, n.ahead=4)
#4 passos a frente
#com desvio padrao

predict(x, n.ahead = 15, se.fit=T)

#formas alternativas
forecast(x,5)
plot(forecast(x,5))

#valores ajustados x observados 
#para ter uma ideia do ajuste do modelo, plotamos a serie observada com a serie estimada 

plot(daily_returns, col = "red")
lines(fitted(x), col = "blue")

#FUNCAO AUTOARIMA 
#escolhe a "melhor" configuracao do modelo

auto.arima(daily_returns)